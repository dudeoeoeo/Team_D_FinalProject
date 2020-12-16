package kr.co.Dr_Link.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.Dr_Link.mvc.dao.DoctorDaoImp;
import kr.co.Dr_Link.mvc.dao.PatientDaoImp;
import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;
import kr.co.Dr_Link.mvc.dto.SearchDTO;

@Controller
public class MainController {
	

	@Autowired	
	private DoctorDaoImp doctor_dao;
	private PatientDaoImp patient_dao;
	
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
	

	@RequestMapping(value = "userInsert")
	public String userInsert(PatientDTO dto) {
		System.out.println("===> dao로 가자!");
		patient_dao.insertPatient(dto);
		System.out.println("===> Mybatis add() 실행 성공인가?");
		return "login";
	}

	@RequestMapping(value = "loginCheck")
	public String loginCheck(PatientDTO dto, HttpSession session) {
		System.out.println("===> dao로 가자!");
		patient_dao.loginCheckPatient(dto);
		PatientDTO result = patient_dao.loginCheckPatient(dto);
		if (result == null) {
			return "login";
		} else {
			System.out.println("===> Mybatis loginchk() 실행 성공인가?");
			session.setAttribute("login", result.getP_id());
		}
		return "main";
	}
	
	
	// 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", service.find_id(response, email));
		return "find-id";
	}


	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("p_id") String p_id, HttpServletResponse response) throws Exception{
		System.out.println("===> Mybatis 아이디 중복 검사(AJAX) 실행 성공인가?");
		service.check_id(p_id, response);
	}
	
	
	// id 중복 체크 컨트롤러
//	@RequestMapping(value = "idCheck.do", method = RequestMethod.GET)
//	@ResponseBody
//	public int idCheck(@RequestParam("p_id") String p_id) {
//		System.out.println("===> Mybatis idCheck() 실행 성공인가?");
//		return PDaoInter.idCheck(p_id);
//	}
//	
	// 비밀번호 찾기
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute PatientDTO dto, HttpServletResponse response) throws Exception{
		System.out.println("===> Mybatis 비밀번호 찾기 실행 성공인가?");
		service.find_pw(response, dto);
	}
	
	// 의료진소개
	@RequestMapping("/search")
	public String view(SearchDTO vo, Model model) {
		List<SearchDTO> getSearch = doctor_dao.getSearch();
		model.addAttribute("getSearch", getSearch);
		return "search"; 
		}
	
}
