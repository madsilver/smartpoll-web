package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.Poll;
import br.com.smartpoll.models.Question;

@Repository
public class QuestionDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<Question> list(Poll poll){
		return manager.createQuery("select q from Question q where q.poll = :p", Question.class)
				.setParameter("p", poll)
				.getResultList();
	}
	
	public List<Question> listByType(Poll poll, int type ){
		return manager.createQuery("select q from Question q where q.poll = :p and q.type = :t", Question.class)
				.setParameter("p", poll)
				.setParameter("t", type)
				.getResultList();
	}
	
	public Question searchById(String id){
		return manager.createQuery("select q from Question q where id = " + id, Question.class)
				.getSingleResult();
	}
	
	public void save(Question question){
		manager.persist(question);
	}
	
	public void update(Question question){
		manager.merge(question);
	}
	
	public void remove(Question question){
		manager.remove(question);
	}

}