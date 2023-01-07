package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.entity.User;
import com.main.service.UserService;


@Controller
public class DashboardController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/admin-dashboard")
	public String showAdminDashboard(Model model) {
		List<User> users = null;
		
		users = userService.getUsers();
		model.addAttribute("users", users);
		
		return "admin-dashboard";
	}
}
