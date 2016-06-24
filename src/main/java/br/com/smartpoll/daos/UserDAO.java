package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.User;

@Repository
public class UserDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public User searchByUsername(String username){
		try{
			return manager.createQuery("select u from User u where username like :u", User.class)
					.setParameter("u", username)
					.getSingleResult();
		}
		catch(NoResultException nre){
			return null;
		}
	}
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<User> users = manager.createQuery("select u from User u where u.username = :u", User.class)
				.setParameter("u", username)
				.getResultList();
		if(users.isEmpty()){
			throw new UsernameNotFoundException("O usuario "+username+" não existe");
		}
		return users.get(0);
	}
	
	public void save(User user){
		manager.persist(user);
	}
	
	public void update(User user){
		manager.merge(user);
	}

}
