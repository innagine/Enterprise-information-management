package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.UploadfileMapper;
import com.wyu.pojo.Uploadfile;
import com.wyu.pojo.UploadfileExample;

@Service
public class UploadfileServiceImpl implements UploadFileService {
	
	@Autowired
	private UploadfileMapper mapper;
	@Override
	public int addUploadfile(Uploadfile uploadfile) {
		// TODO Auto-generated method stub
		
		return mapper.insert(uploadfile);
	}
	
	@Override
	public List<Uploadfile> getFile() {
		// TODO Auto-generated method stub
		return mapper.selectByExample(new UploadfileExample());
	}

	@Override
	public int deletefile(String filename) {
		// TODO Auto-generated method stub
		return mapper.deleteByName(filename);
	}

}
