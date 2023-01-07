package com.main.dao;

import com.main.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String roleName);
}
