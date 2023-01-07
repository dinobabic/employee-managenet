package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.entity.Customer;
import com.main.service.CustomerService;

@Controller
public class LoginController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/showLoginPage")
	public String showLoginPage() {
		return "login-page";
	}
	
	@GetMapping("/successLogin")
	public String showDashboard(Model model) {
		List<Customer> customers = customerService.getCustomers();
		model.addAttribute("customers", customers);
		return "dashboard";
	}
}
