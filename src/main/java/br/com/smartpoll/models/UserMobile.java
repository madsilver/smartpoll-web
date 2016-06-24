package br.com.smartpoll.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_mobile")
public class UserMobile {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(unique = true)
	private String username;
	private String password;
	private String imei;
	private String last_imei;
	private Date last_message;
//	@ManyToOne(fetch = FetchType.LAZY)
//    @Fetch(FetchMode.SELECT)
//    @JoinColumn(name = "account_id", nullable = false)	
	@Column(name="account_id")
	private int account;

	
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImei() {
		return imei;
	}
	public void setImei(String imei) {
		this.imei = imei;
	}
	public String getLast_imei() {
		return last_imei;
	}
	public void setLast_imei(String last_imei) {
		this.last_imei = last_imei;
	}
	public Date getLast_message() {
		return last_message;
	}
	public void setLast_message(Date last_message) {
		this.last_message = last_message;
	}
	
	

}
