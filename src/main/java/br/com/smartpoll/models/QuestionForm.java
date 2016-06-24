package br.com.smartpoll.models;

public class QuestionForm {
	
	private int id;
	private long poll;
	private String description;
	private int type;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getPoll() {
		return poll;
	}
	public void setPoll(long poll) {
		this.poll = poll;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}



	
}
