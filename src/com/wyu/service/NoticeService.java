package com.wyu.service;

import java.util.List;

import com.wyu.pojo.Notice;
import com.wyu.pojo.User;


public interface NoticeService {

	//��������
	int addNotice(Notice notice);
//	//��ѯ����
//	List<Notice> findNotice();

	List<Notice> findNotice();


	Notice findNotice2(int id);




	
}
