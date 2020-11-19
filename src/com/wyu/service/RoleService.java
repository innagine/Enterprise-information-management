package com.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wyu.pojo.Role;

@Service
public interface RoleService {

	List<Role> findRoles();

	int addRole(Role role);

	List<Role> findRolesList();

	List<Role> findRolesLike(Role role);

	int deleteRole(int number);

	int updateRole(Role role);
}
