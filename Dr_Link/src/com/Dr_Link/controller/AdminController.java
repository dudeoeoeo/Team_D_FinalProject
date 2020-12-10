package com.Dr_Link.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@RequestMapping(value = "{step}")
	public String page(@PathVariable String step) {
		System.out.println("admin 컨트롤러 요청");
		return "/admin/" + step; 
	}
	
}
