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

import com.main.crm.CrmUser;
import com.main.entity.User;
import com.main.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@GetMapping("/showRegistrationPage")
	public String showRegistrationPage(Model model) {
		model.addAttribute("crmUser", new CrmUser());
		return "registration-page";
	}
	
	@PostMapping("/registerUser")
	public String processRegistration(@Valid @ModelAttribute("crmUser") CrmUser crmUser,
							BindingResult bindingResult, Model model) {
		
		String username = crmUser.getUsername();
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("registrationError", "You failed to register.");
			return "registration-page";
		}
		
		User existing = userService.findByUsername(username);
		if (existing != null) {
			model.addAttribute("crmUser", new CrmUser());
			model.addAttribute("registrationError", "You failed to register.");
			return "registration-page";
		}
		
		userService.saveUser(crmUser);
		
		return "redirect: /emplyee-management/showLoginPage";
	}
}












