package com.wyu.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wyu.pojo.Uploadfile;
import com.wyu.service.UploadFileService;

@Controller
public class ULAndDLController {

	@Autowired
	private UploadFileService service;
	private String dir = "D:\\upload";
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("name") String name,@RequestParam("upload") List<MultipartFile> upload,Model model) {
		System.out.println("name===>" + name);
		File dirPath = new File(dir);
		if(!dirPath.exists()) {
			dirPath.mkdirs();
		}
		if("".equals(name)||name==null) {
			return "0";
		}
		if(!upload.isEmpty()&&upload.size()>0) {
			for(MultipartFile file : upload) {
				String origin = file.getOriginalFilename();
				String sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
				String newname = name + "_" + sdf + "_" + origin;
				Uploadfile uf = new Uploadfile();
				uf.setUploadname(name);
				uf.setFilename(newname);
				uf.setUploaddate(new Date());
				try {
					file.transferTo(new File(dir+"\\"+newname));
					int in = service.addUploadfile(uf);
					if(in>0) {
						System.out.println("上传成功");
					}
				} catch (IllegalStateException e) {
					// TODO: handle exception
					e.printStackTrace();
				} catch (IOException e) {
					// TODO: handle exception
					e.printStackTrace();
				} 
			}
			return "1";
		}
		return "0";
	}
	
	@RequestMapping("/getFiles")
	public String getFiles(Model model) {
		File dirPath = new File(dir);
		Queue<File> queue = new LinkedList<>();
		queue.offer(dirPath);
		List<String> list = new LinkedList<>();
		while(!queue.isEmpty()) {
			File root = queue.poll();
			File[] files = root.listFiles();
			for(File file: files) {
				list.add(file.getName());
			}
		}
		model.addAttribute("list",list);
		return "download";
	}
	
	@RequestMapping("/download")
	@ResponseBody
	public ResponseEntity<byte[]> download(HttpServletRequest request, String filename) {
		File file = new File(dir+"//"+filename);
		try {
			filename = this.getFilename(request,filename);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDispositionFormData("attachment",filename);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		try {
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getFilename(HttpServletRequest request, String filename) throws Exception{
		System.out.println("filename===>"+filename);
		String[] IEBrowserKeyWord = {"MSIE","Teident","Edge"};
		String userAgent = request.getHeader("User-Agent");
		for(String KeyWord : IEBrowserKeyWord) {
			if(userAgent.contains(KeyWord)) {
				return URLEncoder.encode(filename,"UTF-8");
			}
		}
		return new String(filename.getBytes("UTF-8"),"ISO-8859-1"); 
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(String filename) {
		File file = new File(dir+"//"+filename);
		try {
			if(file!=null) {
				file.delete();
				service.deletefile(filename);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
