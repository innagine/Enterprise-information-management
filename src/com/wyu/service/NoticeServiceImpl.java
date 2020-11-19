package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.NoticeMapper;
import com.wyu.pojo.Notice;
import com.wyu.pojo.NoticeExample;
import com.wyu.pojo.User;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;


	@Override
	public int addNotice(Notice notice) {
		
		return mapper.insert(notice);
	}

	@Override
	public List<Notice> findNotice() {
		
		return mapper.selectByExample(new NoticeExample());
	}
	
	@Override
	public Notice findNotice2(int id) {

		return mapper.selectByPrimaryKey(id);
	}
}
