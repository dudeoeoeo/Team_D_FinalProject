package com.Dr_Link.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Dr_Link.service.PatientService;

@Controller
public class MainController {
	
	
	@RequestMapping(value="login")
	public String login() {
		System.out.println("매핑");
		return "login";
	}
	
	@RequestMapping(value = "pharmacy-details")
	public String name() {
		System.out.println("메인의 닥터로 매핑");
		return "doctor/appointments"; 
	}
}
