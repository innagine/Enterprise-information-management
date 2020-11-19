package com.wyu.service;

import java.util.List;

import com.wyu.pojo.User;

public interface UserService {

	//��¼
	User login(String number);
	//ע��
	int addUser(User user);
	//��ѯ����
	List<User> findUsers();
	//ģ����ѯ
	List<User> findUsersLike(User user);
	//ɾ���û�
	int deleteUser(String number);
	//�޸�����
	int updateUser(User user);
	
}
