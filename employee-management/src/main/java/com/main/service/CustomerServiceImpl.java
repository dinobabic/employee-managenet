package com.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.crm.CrmCustomer;
import com.main.dao.CustomerDao;
import com.main.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDao customerDao;

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		return customerDao.getCustomers();
	}

	@Override
	@Transactional
	public Customer findByUsername(String username) {
		return customerDao.findByUsername(username);
	}

	@Override
	@Transactional
	public Customer findById(Long id) {
		return customerDao.findById(id);
	}

	@Override
	@Transactional
	public void deleteCustomer(Long id) {
		customerDao.deleteCustomer(id);
	}

	@Override
	@Transactional
	public void saveCustomer(Customer customer) {
		customerDao.saveCustomer(customer);
	}

	@Override
	@Transactional
	public void saveCustomer(CrmCustomer crmCustomer) {
		Customer customer = new Customer();
		customer.setUsername(crmCustomer.getUsername());
		customer.setFirstName(crmCustomer.getFirstName());
		customer.setLastName(crmCustomer.getLastName());
		customer.setEmail(crmCustomer.getEmail());
		customer.setMoneySpent(crmCustomer.getMoneySpent());
		
		customerDao.saveCustomer(customer);
	}

}
