package com.main.dao;

import java.util.List;

import com.main.entity.Customer;

public interface CustomerDao {

	void saveCustomer(Customer customer);

	void deleteCustomer(Long id);

	Customer findByUsername(String username);

	Customer findById(Long id);

	List<Customer> getCustomers();

}
