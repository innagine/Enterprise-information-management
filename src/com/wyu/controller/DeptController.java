package com.wyu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.Dept;
import com.wyu.service.DeptService;

@Controller
public class DeptController {

	@Autowired
	private DeptService service;
	
	
	//单独查询
	@RequestMapping(value="/findDepts", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findDepts() {
		
		List<Dept> list = service.findDpets();
		
		String json = JSON.toJSONString(list);
		System.out.println(json);
		return json;
		
	}
	
	
	//添加部门
	@RequestMapping("/addDept")
	@ResponseBody
	public String addDept(Dept dept, Model model) {
		
		System.out.println("=======>"+dept);
		
		String addInfo = "0";
		
		
		try {
			int in = service.addDept(dept);
			if(in>0) {
				System.out.println("添加成功");
				addInfo = "1";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		model.addAttribute("addInfo", addInfo);
		return addInfo;
	}
	
	//dept分页
	@RequestMapping(value = "/findDpetsList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findDpetsList(int page, int rows) {
		
		PageHelper.startPage(page, rows);
		
		List<Dept> list = service.findDpets();

		String listjson = JSON.toJSONString(list);
		PageInfo info = new PageInfo<>(list);
		long total = info.getTotal();
		System.out.println(total);
		

		list.forEach(li->System.out.println(li));
		
		String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		
		return json;
		
	}
	
	//模糊查询
	@RequestMapping(value = "/findDeptsLike", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findDeptsLike(Dept dept, int page, int rows) {
		
		
		System.out.println("----->"+dept);
		
		PageHelper.startPage(page, rows);
		List<Dept> list = service.findDeptsLike(dept);
		
		
		list.forEach(li->System.out.println(li));
		
		
		
		String listjson = JSON.toJSONString(list);
		PageInfo info = new PageInfo<>(list);
		long total = info.getTotal();
		System.out.println(total);
		

		list.forEach(li->System.out.println(li));
		
		String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		
		return json;
		
	}
	
	
	//删除部门
		@RequestMapping(value="/deleteDept", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String deleteDept(int number) {			
			System.out.println("---->要删除的"+number);
			
			int in = service.deleteDept(number);
			String reInfo = "删除失败";
			
			if(in>0) {
				reInfo="删除成功";
				
			}
			System.out.println(reInfo);
			return reInfo;
			
		}
		
		
		
	//修改数据
		@RequestMapping(value = "/updateDept", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String updateDept(Dept dept) {
			
			int in = service.updateDept(dept);
			
			if(in>0) {
				System.out.println("修改成功");
				return "1";
				
			}
			
			
			return "0";
		}
		
		
	
}






