package com.wyu.mapper;

import java.util.List;

import com.wyu.pojo.User;

public interface UserCustomMapper {
	
	List<User> findUserAndRoleName();
	
	List<User> selectByExample(User user);
	

}
