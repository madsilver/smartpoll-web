package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.TempUpload;

@Repository
public class TempUploadDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<TempUpload> list(){
		return manager.createQuery("select tu from TempUpload tu", TempUpload.class)
				.getResultList();
	}
	
	public void save(TempUpload tempUpload){
		manager.persist(tempUpload);
	}
	
	public void remove(TempUpload tempUpload){
		manager.remove(tempUpload);
	}

}
