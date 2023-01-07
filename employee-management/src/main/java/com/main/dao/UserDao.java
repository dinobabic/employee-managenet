package com.main.dao;

import java.util.List;

import com.main.entity.User;

public interface UserDao {

	public User findByUsername(String username);
	
	public void saveUser(User user);

	public List<User> getUsers();

	public void deleteUser(Long id);

	public User getUserById(Long id);
}
