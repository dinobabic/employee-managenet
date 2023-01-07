package com.main.service;

import java.util.List;

import com.main.crm.CrmCustomer;
import com.main.entity.Customer;

public interface CustomerService {
	
	public List<Customer> getCustomers();
	
	public Customer findByUsername(String username);
	
	public Customer findById(Long id);
	
	public void deleteCustomer(Long id);
	
	public void saveCustomer(Customer customer);
	
	public void saveCustomer(CrmCustomer crmCustomer);
}
