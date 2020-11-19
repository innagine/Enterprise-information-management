package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.RoleMapper;
import com.wyu.pojo.Role;
import com.wyu.pojo.RoleExample;
import com.wyu.pojo.RoleExample.Criteria;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleMapper mapper;

	@Override
	public List<Role> findRoles() {
		RoleExample example = new RoleExample();
		return mapper.selectByExample(example);
	}

	@Override
	public int addRole(Role role) {
		return mapper.insert(role);
	}

	@Override
	public List<Role> findRolesList() {
		RoleExample example = new RoleExample();
		
		return mapper.selectByExample(example);
	}

	@Override
	public List<Role> findRolesLike(Role role) {
		RoleExample example = new RoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andRidEqualTo(role.getRid());
		criteria.andRnameLike("%"+role.getRname()+"%");
		criteria.andRremarkLike("%"+role.getRremark()+"%");
		example.or();
		return mapper.selectByExample(example);
	}

	@Override
	public int deleteRole(int number) {
		return mapper.deleteByPrimaryKey(number);
	}

	@Override
	public int updateRole(Role role) {
		return mapper.updateByPrimaryKeySelective(role);
	}

}
