package com.wyu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.User;
import com.wyu.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	//�û���¼
	@RequestMapping("/login")
	public String login(String number, String password, HttpSession session, Model model) {

		User user = service.login(number);

		String loginInfo = "�û�������";

		if (user != null) {
			if (password.equals(user.getPassword())) {
			//	System.out.println("��¼�ɹ�");
				session.setAttribute("user", user);
				return "main";

			}else {
				loginInfo = "0";
				System.out.println("�������");
			}

		}
		
		model.addAttribute("loginInfo", loginInfo);

		return "index";
	}
	
	//����û�
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUser(User user, Model model) {
		
		user.setCreatedate(new Date());
		System.out.println("=======>"+user);
		
		String addInfo = "0";
		
		
		try {
			int in = service.addUser(user);
			if(in>0) {
				System.out.println("��ӳɹ�");
				addInfo = "1";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		model.addAttribute("addInfo", addInfo);
		return addInfo;
	}
	
	//�˺�ajax����
	@RequestMapping("/numberAjax")
	@ResponseBody
	public String numberAjax(String number) {
		System.out.println(number);
		User user = service.login(number);
		if(user==null) {
			return "0";
		}
		return "1";//�鵽���˺��Ѵ���
	}
	
	
	//user��ҳ
	@RequestMapping(value = "/findUser", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findUsers(int page, int rows) {
		
		PageHelper.startPage(page, rows);
		
		List<User> list = service.findUsers();

		String listjson = JSON.toJSONString(list);
		PageInfo info = new PageInfo<>(list);
		long total = info.getTotal();
		System.out.println(total);
		

		list.forEach(li->System.out.println(li));
		
		String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		
		return json;
		
	}
	
	//ģ����ѯ
		@RequestMapping(value = "/findUsersLike", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String findUsersLike(User user, int page, int rows) {
			
			
			System.out.println("----->"+user);
			if(user.getRoleId()==null) {
				user.setRoleId(0);
			}
			PageHelper.startPage(page, rows);
			List<User> list = service.findUsersLike(user);
			
			
			list.forEach(li->System.out.println(li));
			
			
			
			String listjson = JSON.toJSONString(list);
			PageInfo info = new PageInfo<>(list);
			long total = info.getTotal();
			System.out.println(total);
			

			list.forEach(li->System.out.println(li));
			
			String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
			
			
			return json;
			
		}
	
	
	//ɾ���û�
		@RequestMapping(value="/deleteUser", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String deleteUser(String number) {			
			System.out.println("---->Ҫɾ����"+number);
			
			int in = service.deleteUser(number);
			String reInfo = "ɾ��ʧ��";
			
			if(in>0) {
				reInfo="ɾ���ɹ�";
				
			}
			System.out.println(reInfo);
			return reInfo;
			
		}
		
		
		
	//�޸�����
		@RequestMapping(value = "/updateUser", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String updateUser(User user) {
			
			int in = service.updateUser(user);
			
			if(in>0) {
				System.out.println("�޸ĳɹ�");
				return "1";
				
			}
			
			
			return "0";
		}
		
		
	
}






