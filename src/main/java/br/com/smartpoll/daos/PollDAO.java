package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.Poll;

@Repository
public class PollDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<Poll> list(){
		return manager.createQuery("select distinct (p) from Poll p", Poll.class)
				.getResultList();
	}
	
	public Poll searchById(long id){
		return manager.createQuery("select p from Poll p where id = :i", Poll.class)
				.setParameter("i", id)
				.getSingleResult();
	}
	
	public List<Poll> searchByAccount(int account){
		return manager.createQuery("select p from Poll p where p.account = :a", Poll.class)
				.setParameter("a", account)
				.getResultList();
	}
	
	public void save(Poll poll){
		manager.persist(poll);
	}
	
	public void update(Poll poll){
		manager.merge(poll);
	}
	
	public void remove(Poll poll){
		manager.remove(poll);
	}

}
