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
import com.wyu.pojo.Job;
import com.wyu.service.JobService;

@Controller
public class JobController {
	
	@Autowired
	private JobService service;
	
	//关联查找
	@RequestMapping(value="/findJobs", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findJobs() {
		
		
		List<Job> list = service.findJobs();
		
		String json = JSON.toJSONString(list);
		System.out.println(json);
		
		
		
		return json;
		
	}
	
	//添加角色
		@RequestMapping("/addJob")
		@ResponseBody
		public String addJob(Job job, Model model) {
			
			System.out.println("=======>"+job);
			
			String addInfo = "0";
			
			
			try {
				int in = service.addJob(job);
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
		
		//job分页
		@RequestMapping(value = "/findJobsList", produces = "application/json;charset=utf-8")
		@ResponseBody
		public String findJobsList(int page, int rows) {
			
			PageHelper.startPage(page, rows);
			
			List<Job> list = service.findJobs();

			String listjson = JSON.toJSONString(list);
			PageInfo info = new PageInfo<>(list);
			long total = info.getTotal();
			System.out.println(total);
			

			list.forEach(li->System.out.println(li));
			
			String json = "{\"total\":"+total+",\"rows\":"+listjson+"}";
			
			
			return json;
			
		}
		
		//模糊查询
			@RequestMapping(value = "/findJobsLike", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String findJobsLike(Job job, int page, int rows) {
				
				
				System.out.println("----->"+job);
				
				PageHelper.startPage(page, rows);
				List<Job> list = service.findJobsLike(job);
				
				
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
			@RequestMapping(value="/deleteJob", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String deleteJob(int number) {			
				System.out.println("---->要删除的"+number);
				
				int in = service.deleteJob(number);
				String reInfo = "删除失败";
				
				if(in>0) {
					reInfo="删除成功";
					
				}
				System.out.println(reInfo);
				return reInfo;
				
			}
			
			
			
		//修改数据
			@RequestMapping(value = "/updateJob", produces = "application/json;charset=utf-8")
			@ResponseBody
			public String updateJob(Job job) {
				
				int in = service.updateJob(job);
				
				if(in>0) {
					System.out.println("修改成功");
					return "1";
					
				}
				
				
				return "0";
			}

}
