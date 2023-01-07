package com.main.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.crm.CrmCustomer;
import com.main.entity.Customer;
import com.main.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@GetMapping("/add-customer")
	public String showAddCustomer(Model model) {
		model.addAttribute("crmCustomer", new CrmCustomer());
		return "add-customer";
	}
	
	@PostMapping("/registerCustomer")
	public String registerCustomer(@Valid  @ModelAttribute(name = "crmCustomer") CrmCustomer crmCustomer, 
							BindingResult bindingResult, Model model) {
		String username = crmCustomer.getUsername();
		
		System.out.println(crmCustomer);
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("registrationError", "You failed to add new customer!");
			model.addAttribute("crmCustomer", new CrmCustomer());
			return "add-customer";
		}
		
		Customer customer = customerService.findByUsername(username);
		if (customer != null) {
			model.addAttribute("registrationError", "You failed to add new customer!");
			model.addAttribute("crmCustomer", new CrmCustomer());
			return "add-customer";
		}
		
		customerService.saveCustomer(crmCustomer);
		
		return "redirect: /emplyee-management/successLogin";
	}
	
	@GetMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam("customerId") Long id) {
		customerService.deleteCustomer(id);
		return "redirect: /emplyee-management/successLogin";
	}
	
	@GetMapping("/updateCustomer")
	public String showUpdateCustomer(@RequestParam("customerId") Long id, Model model) {
		Customer customer = customerService.findById(id);
		model.addAttribute("customer", customer);
		return "update-customer";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {
		customerService.saveCustomer(customer);
		return "redirect: /emplyee-management/successLogin";
	}
}









