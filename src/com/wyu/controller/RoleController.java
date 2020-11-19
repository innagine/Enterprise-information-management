package com.wyu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.Role;
import com.wyu.service.RoleService;

@Controller
public class RoleController {
	
	@Autowired
	private RoleService service;
	
	@RequestMapping(value="/findRoles", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findRoles() {
		
		
		List<Role> list = service.findRoles();
		
		String json = JSON.toJSONString(list);
		System.out.println(json);
		
		
		
		return json;
		
	}
	
	//添加角色
		@RequestMapping("/addRole")
		@ResponseBody
		public String addRole(Role role, Model model) {
			
			System.out.println("=======>"+role);
			
			String addInfo = "0";
			
			
			try {
				int in = service.addRole(role);
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
		
		//role分页
		@RequestMapping(value = "/findRolesList", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String findRolesList(int page, int rows) {
			
			PageHelper.startPage(page, rows);
			
			List<Role> list = service.findRolesList();

			String listjson = JSON.toJSONString(list);
			PageInfo info = new PageInfo<>(list);
			long total = info.getTotal();
			System.out.println(total);
			

			list.forEach(li->System.out.println(li));
			
			String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
			
			
			return json;
			
		}
		
		//模糊查询
			@RequestMapping(value = "/findRolesLike", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String findRolesLike(Role role, int page, int rows) {
				
				
				System.out.println("----->"+role);
				
				PageHelper.startPage(page, rows);
				List<Role> list = service.findRolesLike(role);
				
				
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
			@RequestMapping(value="/deleteRole", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String deleteRole(int number) {			
				System.out.println("---->要删除的"+number);
				
				int in = service.deleteRole(number);
				String reInfo = "删除失败";
				
				if(in>0) {
					reInfo="删除成功";
					
				}
				System.out.println(reInfo);
				return reInfo;
				
			}
			
			
			
		//修改数据
			@RequestMapping(value = "/updateRole", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String updateRole(Role role) {
				
				int in = service.updateRole(role);
				
				if(in>0) {
					System.out.println("修改成功");
					return "1";
					
				}
				
				
				return "0";
			}

}
