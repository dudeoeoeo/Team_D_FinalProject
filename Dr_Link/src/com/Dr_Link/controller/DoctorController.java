package com.Dr_Link.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	
	@RequestMapping(value = "{step}")
	public ModelAndView name(@PathVariable String step) {
		System.out.println("doctor 컨트롤러 요청");
		ModelAndView mv = new ModelAndView("/doctor/" + step);
		return mv; 
	}
	
	@RequestMapping(value = "/add-billig")
	public String name() {
		System.out.println("닥터로 매핑");
		return "doctor/add-billing"; 
	}
	/*
	@RequestMapping(value = "{page}")
	public String page(@RequestParam("page") String page) {
		System.out.println("페이지 매핑 : " + page);
		return "/doctor/" + page;
	}
	*/
}
