package br.com.smartpoll.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="temp_upload")
public class TempUpload {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String value;
	
	public TempUpload(){
	}
	
	public TempUpload(String value){
		this.value = value;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
