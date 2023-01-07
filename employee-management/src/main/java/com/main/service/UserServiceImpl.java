package com.main.service;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.entity.Role;
import com.main.crm.CrmUser;
import com.main.dao.RoleDao;
import com.main.dao.UserDao;
import com.main.entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.findByUsername(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password");
		}
		
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
				mapRolesToAuthorities(user.getRoles()));
	}

	@Override
	@Transactional
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	@Transactional
	public void saveUser(CrmUser crmUser) {
		User user = new User();
		user.setUsername(crmUser.getUsername());
		user.setPassword(passwordEncoder.encode(crmUser.getPassword()));
		user.setFirstName(crmUser.getFirstName());
		user.setLastName(crmUser.getLastName());
		user.setEmail(crmUser.getEmail());
		user.setRoles(Arrays.asList(roleDao.findRoleByName("ROLE_EMPLOYEE")));
		
		userDao.saveUser(user);
	}
	
	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
		return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}

	@Override
	@Transactional
	public List<User> getUsers() {
		return userDao.getUsers();
	}

	@Override
	@Transactional
	public void deleteUser(Long id) {
		userDao.deleteUser(id);
	}

	@Override
	@Transactional
	public User getUserById(Long id) {
		return userDao.getUserById(id);
	}

	@Override
	@Transactional
	public void saveUser(User user) {
		userDao.saveUser(user);
	}
}
