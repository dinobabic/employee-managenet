package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.entity.User;
import com.main.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/employee/deleteEmployee")
	public String deleteUser(@RequestParam("userId") Long id, Model model) {
		userService.deleteUser(id);
		
		return "redirect:/admin-dashboard";
	}
	
	@GetMapping("/employee/updateEmployee")
	public String showUpdateEmployee(@RequestParam("userId") Long id, Model model) {
		
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		
		return "update-employee";
	}
	
	@PostMapping("/employee/saveEmployee")
	public String updateEmployee(@ModelAttribute("user") User user) {
		userService.saveUser(user);
		return "redirect:/admin-dashboard";
	}
}
