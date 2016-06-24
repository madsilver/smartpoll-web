package br.com.smartpoll.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "question")
@XmlType( propOrder = { "id", "description", "type", "option"})
public class Question {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "poll_id", nullable = false)	
	private Poll poll;
	private String description;
	private int type;
	@OneToMany(mappedBy = "question", fetch = FetchType.EAGER) //Eager para gerar o xml no download, evita LazyInitializationException
    @Fetch(FetchMode.SELECT)
	private List<Option> option;
	@OneToMany(mappedBy = "question", fetch = FetchType.LAZY)
	private List<PollData> pollData;
	
	public static int MULTIPLE_CHOICE = 0;
	public static int SINGLE_CHOICE = 1;
	
	/**
	 * Getters Setters
	 */
	
	@XmlAttribute
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@XmlAttribute
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@XmlAttribute
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@XmlTransient
	public Poll getPoll() {
		return poll;
	}
	public void setPoll(Poll poll) {
		this.poll = poll;
	}
	public List<Option> getOption() {
		return option;
	}
	public void setOption(List<Option> option) {
		this.option = option;
	}
	@XmlTransient
	public List<PollData> getPollData() {
		return pollData;
	}
	public void setPollData(List<PollData> pollData) {
		this.pollData = pollData;
	}
	
	
	

}
