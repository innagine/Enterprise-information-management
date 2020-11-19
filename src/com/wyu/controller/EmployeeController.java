package com.wyu.controller;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.Employee;
import com.wyu.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService service;
	
	
	//���Ա��
	@RequestMapping("/addEmployee")
	@ResponseBody
	public String addEmployee(Employee employee, Model model) {
		
		employee.setCreateDate(new Date());
		System.out.println("=======>"+employee);
		
		String addInfo = "0";
		
		
		try {
			int in = service.addEmployee(employee);
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
	
	//employee��ҳ
	@RequestMapping(value = "/findEmployees", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findEmployees(int page, int rows) {
		
		PageHelper.startPage(page, rows);
		
		List<Employee> list = service.findEmployees();

		String listjson = JSON.toJSONString(list);
		PageInfo info = new PageInfo<>(list);
		long total = info.getTotal();
		System.out.println(total);
		

		list.forEach(li->System.out.println(li));
		
		String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		
		return json;
		
	}
	
	//ģ����ѯ
		@RequestMapping(value = "/findEmployeesLike", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String findEmployeesLike(Employee employee, int page, int rows) {
			
			
			System.out.println("----->"+employee);
			PageHelper.startPage(page, rows);
			List<Employee> list = service.findEmployeesLike(employee);
			
			
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
		@RequestMapping(value="/deleteEmployee", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String deleteEmployee(int number) {			
			System.out.println("---->Ҫɾ����"+number);
			
			int in = service.deleteEmployee(number);
			String reInfo = "ɾ��ʧ��";
			
			if(in>0) {
				reInfo="ɾ���ɹ�";
				
			}
			System.out.println(reInfo);
			return reInfo;
			
		}
		
		
		
	//�޸�����
		@RequestMapping(value = "/updateEmployee", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String updateEmployee(Employee employee) {
			
			int in = service.updateEmployee(employee);
			
			if(in>0) {
				System.out.println("�޸ĳɹ�");
				return "1";
				
			}
			
			
			return "0";
		}
		
		
		@RequestMapping("/test11")
		public void test11(){
			Employee employee = new Employee();
			employee.setName("1");
			List<Employee> list = service.findEmployeesLike(employee);
			list.forEach(li->System.out.println(li));
			
			
			
		}
		
	
}






