package com.wyu.service;

import java.util.List;

import com.wyu.pojo.Notice;
import com.wyu.pojo.User;


public interface NoticeService {

	//发布公告
	int addNotice(Notice notice);
//	//查询所有
//	List<Notice> findNotice();

	List<Notice> findNotice();


	Notice findNotice2(int id);




	
}
