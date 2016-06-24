package br.com.smartpoll.daos;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.Account;

@Repository
public class AccountDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public Account searchById(String id){
		try{
			return manager.createQuery("select a from Account a where id = :i", Account.class)
					.setParameter("i", id)
					.getSingleResult();
		} 
		catch(NoResultException nre){
			return null;
		}
	}
	
	public Account searchByEmail(String email){
		try{
			return manager.createQuery("select a from Account a where email like :e ", Account.class)
					.setParameter("e", email)
					.getSingleResult();
		} 
		catch(NoResultException nre){
			return null;
		}
	}
	
	public void save(Account account){
		manager.persist(account);
	}
	
	public void update(Account account){
		manager.merge(account);
	}

}
