package kr.co.Dr_Link.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.Dr_Link.mvc.dao.DoctorDaoImp;
import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;

@Controller
public class MainController {
	

	@Autowired	
	private DoctorDaoImp doctor_dao;
	
	@RequestMapping(value = "/Dr_LinkMainPage")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		return step;
	}

	@RequestMapping(value = "/doctor_profile")
	public String doctor_profile(DoctorDTO vo, Model model) {
		/*
		 * try {
		 * 
		 * DoctorDTO doctor_profile = doctor_dao.doctor_profile(vo); String graduation =
		 * doctor_profile.getD_graduation(); String[] college = graduation.split(",");
		 * 
		 * String[][] result = new String[college.length][];
		 * 
		 * for (String s : college) { System.out.println(s); }
		 * 
		 * for (int i = 0; i < college.length; ++i) { result[i] = college[i].split(" ");
		 * System.out.println(result[i][0]); System.out.println(result[i][1]); }
		 * 
		 * model.addAttribute("doctor_profile",doctor_profile);
		 * model.addAttribute("doctor_graduation",result);
		 * System.out.println("의사상세프로필 이동");
		 * 
		 * } catch (NullPointerException e) {
		 * 
		 * }
		 */
		return "doctor_profile";
	}
	
}
