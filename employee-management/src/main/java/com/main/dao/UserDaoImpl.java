package com.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.entity.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User findByUsername(String username) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<User> query = currentSession.createQuery("from User where userName=:uName", User.class);
		query.setParameter("uName", username);
		User user = null;
		
		try {
			user = query.getSingleResult();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

	@Override
	public void saveUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(user);
		
	}

	@Override
	public List<User> getUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<User> query = currentSession.createQuery("from User", User.class);
		
		List<User> users = query.getResultList();
		
		return users;
	}

	@Override
	public void deleteUser(Long id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.
			createQuery("delete from User where id=:userId");
		query.setParameter("userId", id);
		query.executeUpdate();
	}

	@Override
	public User getUserById(Long id) {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.get(User.class, id);
	}

}
