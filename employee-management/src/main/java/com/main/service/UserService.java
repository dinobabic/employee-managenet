package com.main.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.main.crm.CrmUser;
import com.main.entity.User;

public interface UserService extends UserDetailsService {
	
	public List<User> getUsers();
	
	public User findByUsername(String username);
	
	public void saveUser(CrmUser crmUser);

	public void deleteUser(Long id);

	public User getUserById(Long id);

	public void saveUser(User user);
}
