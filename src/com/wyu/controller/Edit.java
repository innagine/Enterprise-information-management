package com.wyu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Edit {
	
	//ÍË³öµÇÂ¼
	@RequestMapping("/edit")
	public String execute(HttpSession session){
		session.invalidate();
	    return "index";
	}
	
}