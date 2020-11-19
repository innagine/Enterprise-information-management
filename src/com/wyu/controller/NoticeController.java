package com.wyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wyu.pojo.Notice;
import com.wyu.pojo.User;
import com.wyu.service.NoticeService;
import com.wyu.service.UserService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	//添加公告
	@RequestMapping("/addNotice")
	@ResponseBody
	public String addNotice(Notice notice, Model model) {

		String addInfo = "0";
		
//		随机生成公告id
		String id1=new SimpleDateFormat("mmssSSS").format(new Date());
		int id=Integer.parseInt(id1);
		notice.setId(id);
		System.out.println(notice.getName());
		System.out.println(notice.getTitle());
		System.out.println(notice.getContent());
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaa");
		
		try {
			int in = service.addNotice(notice);
			if(in>0) {
				System.out.println("发布成功");
				addInfo = "1";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		model.addAttribute("addInfo", addInfo);

		return addInfo;
	}
	
	
	
	//查看公告
	@RequestMapping("/CheckNotice")
	public String CheckNotice(Notice notice, Model model) {
		
		String content = "";
		String name = "";
		String title = "公告不存在！请重新输入公告号";
		
		

        
        
//      判断是否输入公告id
        if(notice.getId()!=null) {
        	
//    		获取id
            int id=notice.getId();
//          获取公告内容
    		Notice notice2=service.findNotice2(id);
    		content=notice2.getContent();
    		name=notice2.getName();
    		title=notice2.getTitle();
    		System.out.println("cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc");
        }

        
		
//		List<Notice> list = service.findNotice();
//
//		
//		list.forEach(li->System.out.println(li.getContent()));
//		System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
//		//循环公告对象
//		for(int i=0;list.size()>=i;i++) {
//			
//			//比较公告名字是否相等
//			if(list.get(i).getTitle().equals(notice.getTitle())) {
//				addInfo =list.get(i).getContent();
//				System.out.println(addInfo);
//				
//				model.addAttribute("addInfo", addInfo);
//				System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
//				
//				//退出循环
//				return "notice2";
//			}
//		}

//		
		
//		题目
		model.addAttribute("title", title);
//		主题
		model.addAttribute("name", name);
//		内容
		model.addAttribute("content",content);
		return "Querynotice";
		
	}
}
