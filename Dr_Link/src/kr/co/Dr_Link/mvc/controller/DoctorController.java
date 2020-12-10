package kr.co.Dr_Link.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@RequestMapping(value = "/login")
	public String login() {
		System.out.println("매핑");
		return "login";
	}
	@RequestMapping(value = "/{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("doctor 안에서 url 요청: " + step);
		return "/doctor/" + step;
	}
}
