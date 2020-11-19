package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.UserCustomMapper;
import com.wyu.mapper.UserMapper;
import com.wyu.pojo.User;
import com.wyu.pojo.UserExample;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserExample example;
	
	@Autowired
	private UserCustomMapper userCustomMapper;

	@Override
	public User login(String number) {

		return mapper.selectByPrimaryKey(number);

	}

	@Override
	public int addUser(User user) {
		
		return mapper.insert(user);
	}


	@Override
	public List<User> findUsers() {
//		example.clear();
//		List<User> list = mapper.selectByExample(example);
		
		List<User> list = userCustomMapper.findUserAndRoleName();
		
		return list;
	}

	@Override
	public List<User> findUsersLike(User user) {
		
		List<User> list = userCustomMapper.selectByExample(user);
		list.forEach(li->System.out.println(li.getNumber()));
		
		return list;
		
		
//		example.clear();
//
//		Criteria criteria = example.createCriteria();
//		criteria.andNumberLike("%"+user.getNumber()+"%");
//		criteria.andUsernameLike("%"+user.getUsername()+"%");
//		criteria.andPhoneLike("%"+user.getPhone()+"%");
//		if(user.getRoleId() != 0) {
//			
//			criteria.andRoleIdEqualTo(user.getRoleId());
//		}
//		
//		example.or();
//		
//		return mapper.selectByExample(example);
	}

	@Override
	public int deleteUser(String number) {

		return mapper.deleteByPrimaryKey(number);
	}

	@Override
	public int updateUser(User user) {
		
		return mapper.updateByPrimaryKeySelective(user);
	}
	

}
