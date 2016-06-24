package br.com.smartpoll.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "poll")
@XmlRootElement
public class Poll {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String description;
	private int account;
	private Date date;
	@OneToMany(mappedBy = "poll", fetch = FetchType.EAGER)//Eager para gerar o xml no download, evita LazyInitializationException
    @Fetch(FetchMode.SELECT)
	private List<Question> question;
	@OneToMany(mappedBy = "poll", fetch = FetchType.LAZY)
	private List<PollData> pollData;
	
	/**
	 * Getters Setters
	 */
	
	@XmlAttribute
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@XmlAttribute
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@XmlElementWrapper(name="questions")
	public List<Question> getQuestion() {
		return question;
	}
	public void setQuestion(List<Question> question) {
		this.question = question;
	}
	@XmlTransient
	public List<PollData> getPollData() {
		return pollData;
	}
	public void setPollData(List<PollData> pollData) {
		this.pollData = pollData;
	}
	

	

}
