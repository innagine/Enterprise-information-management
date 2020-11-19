package com.wyu.service;

import java.util.List;

import com.wyu.pojo.Uploadfile;

public interface UploadFileService {
	int addUploadfile(Uploadfile uploadfile);
	int deletefile(String filename);
	List<Uploadfile> getFile();
}
