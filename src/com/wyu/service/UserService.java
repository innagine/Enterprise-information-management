package com.wyu.service;

import java.util.List;

import com.wyu.pojo.User;

public interface UserService {

	//登录
	User login(String number);
	//注册
	int addUser(User user);
	//查询所有
	List<User> findUsers();
	//模糊查询
	List<User> findUsersLike(User user);
	//删除用户
	int deleteUser(String number);
	//修改数据
	int updateUser(User user);
	
}
