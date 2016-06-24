package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.Option;
import br.com.smartpoll.models.Question;

@Repository
public class OptionDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<Option> list(){
		return manager.createQuery("select o from Option o", Option.class)
				.getResultList();
	}
	
	public Option searchById(String id){
		Option option = null;
		Query query = manager.createQuery("select o from Option o where id = " + id, Option.class);
		try{
			option = (Option) query.getSingleResult();
		}
		catch (NoResultException nre){
			
		}
			
		return option;		
	}
	
	public List<Option> searchByQuestion(Question question){
		return manager.createQuery("select o from Option o where o.question = :q", Option.class)
		.setParameter("q", question)
		.getResultList();
	}
	
	public void save(Option option){
		manager.persist(option);
	}

}