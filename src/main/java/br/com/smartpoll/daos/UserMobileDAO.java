package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.UserMobile;

@Repository
public class UserMobileDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<UserMobile> list(int account){
		return manager.createQuery("select um from UserMobile um where account = :a", UserMobile.class)
				.setParameter("a", account)
				.getResultList();
	}
	
	public UserMobile searchById(int id){
		return manager.createQuery("select um from UserMobile um where id = :id", UserMobile.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public UserMobile searchByUsername(String username){
		try{
			return manager.createQuery("select um from UserMobile um where username like :u", UserMobile.class)
					.setParameter("u", username)
					.getSingleResult();
		}
		catch(NoResultException nre){
			return null;
		}
	}
	
	public UserMobile searchByUsernamePassword(String username, String password){
		try{
			return manager.createQuery("select um from UserMobile um where username like :u and password like :p", UserMobile.class)
					.setParameter("u", username)
					.setParameter("p", password)
					.getSingleResult();
		}
		catch(NoResultException nre){
			return null;
		}
	}
	
	public UserMobile searchByImei(String imei){
		try{
			return manager.createQuery("select um from UserMobile um where imei like :i", UserMobile.class)
					.setParameter("i", imei)
					.getSingleResult();
		}
		catch(NoResultException nre){
			return null;
		}
	}
	
	public void save(UserMobile user){
		manager.persist(user);
	}
	
	public void update(UserMobile user){
		manager.merge(user);
	}
	
	public void remove(UserMobile user){
		manager.remove(user);
	}

}
