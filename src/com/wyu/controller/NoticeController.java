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

	//��ӹ���
	@RequestMapping("/addNotice")
	@ResponseBody
	public String addNotice(Notice notice, Model model) {

		String addInfo = "0";
		
//		������ɹ���id
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
				System.out.println("�����ɹ�");
				addInfo = "1";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		model.addAttribute("addInfo", addInfo);

		return addInfo;
	}
	
	
	
	//�鿴����
	@RequestMapping("/CheckNotice")
	public String CheckNotice(Notice notice, Model model) {
		
		String content = "";
		String name = "";
		String title = "���治���ڣ����������빫���";
		
		

        
        
//      �ж��Ƿ����빫��id
        if(notice.getId()!=null) {
        	
//    		��ȡid
            int id=notice.getId();
//          ��ȡ��������
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
//		//ѭ���������
//		for(int i=0;list.size()>=i;i++) {
//			
//			//�ȽϹ��������Ƿ����
//			if(list.get(i).getTitle().equals(notice.getTitle())) {
//				addInfo =list.get(i).getContent();
//				System.out.println(addInfo);
//				
//				model.addAttribute("addInfo", addInfo);
//				System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
//				
//				//�˳�ѭ��
//				return "notice2";
//			}
//		}

//		
		
//		��Ŀ
		model.addAttribute("title", title);
//		����
		model.addAttribute("name", name);
//		����
		model.addAttribute("content",content);
		return "Querynotice";
		
	}
}
