package com.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.entity.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveCustomer(Customer customer) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(customer);
	}

	@Override
	public void deleteCustomer(Long id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from Customer where id=:customerId");
		query.setParameter("customerId", id);
		query.executeUpdate();
	}

	@Override
	public Customer findByUsername(String username) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Customer> query = currentSession.createQuery("from Customer where username=:customerName", Customer.class);
		query.setParameter("customerName", username);
		Customer customer = null;
		
		try {
			customer = query.getSingleResult();
		}
		catch (Exception e) {
			// Do nothing
		}
		
		return customer;
	}

	@Override
	public Customer findById(Long id) {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.get(Customer.class, id);
	}

	@Override
	public List<Customer> getCustomers() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Customer> query = currentSession.createQuery("from Customer", Customer.class);
		return query.getResultList();
	}

}
