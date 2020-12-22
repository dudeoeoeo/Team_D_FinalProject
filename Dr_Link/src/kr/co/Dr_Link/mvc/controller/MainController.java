package kr.co.Dr_Link.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.Dr_Link.mvc.dao.DoctorDaoInter;
import kr.co.Dr_Link.mvc.dao.PatientDaoInter;
import kr.co.Dr_Link.mvc.dao.ReviewDAO;
import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.service.DoctorServiceImpl;
import kr.co.Dr_Link.mvc.service.PatientServiceImpl;

@Controller
public class MainController {
	@Autowired
	private PatientDaoInter PDaoInter;
	@Autowired
	private DoctorDaoInter DDaoInter;
	@Autowired
	private DoctorServiceImpl Dservice;
	@Autowired	
	private DoctorDaoInter doctor_dao;
	@Autowired
	private PatientDaoInter patient_dao;
	@Autowired
	private PatientServiceImpl service;
	@Autowired
	private ReviewDAO re_dao;
	
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
		
	  try {
	  DoctorDTO doctor_profile = doctor_dao.doctor_info(2);
	  model.addAttribute("doctor_profile",doctor_profile);
	  

	  List<String[]> m = new ArrayList<String[]>();
	  String [] d_graduation = doctor_profile.getD_graduation().split(",");
	  m.add(d_graduation);
	  String [] d_career = doctor_profile.getD_career().split(",");
	  m.add(d_career);
	  String [] d_field = doctor_profile.getD_field().split(",");
	  m.add(d_field);
	  

	  model.addAttribute("m",m);
	  model.addAttribute("reviewList",re_dao.getReviewList(2));
	  
	  System.out.println("의사상세프로필 이동");
	  
	  } catch (NullPointerException e) {
	  
	  }
		 
		return "doctor_profile";
	}
	
	
	/* 김성민 */
	@RequestMapping(value = { "index", "/" })
	public String goMain() {
		return "main";
	}

	//환자 로그인 체크
	@RequestMapping(value = "loginCheck")
	public String loginCheck(PatientDTO dto, HttpSession session) {
		System.out.println("===> dao로 가자!");
		PDaoInter.loginCheckPatient(dto);
		PatientDTO result = PDaoInter.loginCheckPatient(dto);
		if (result == null) {
			System.out.println("로그인 실패!");
			return "login";
		} else {
			System.out.println("===> Mybatis loginchk() 실행 성공인가?");
			session.setAttribute("login", result.getP_id());
		}
		return "main";
	}
	
	
	// 환자 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", service.find_id(response, email));
		return "find-id";
	}



	// 환자 아이디 중복 검사(AJAX)
	@RequestMapping(value = "check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("p_id") String p_id, HttpServletResponse response) throws Exception{
		System.out.println("===> Mybatis 아이디 중복 검사(AJAX) 실행 성공인가?");
		service.check_id(p_id, response);
	}
	
	// 환자 비밀번호 찾기
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute PatientDTO dto, HttpServletResponse response) throws Exception{
		System.out.println("===> Mybatis 비밀번호 찾기 실행 성공인가?");
		service.find_pw(response, dto);
	}

	//환자 회원가입
	@RequestMapping(value = "userInsert", method = RequestMethod.POST)
	public ModelAndView userInsert(PatientDTO dto, HttpServletRequest request) {
		System.out.println("userinsert 요청");
		ModelAndView mav = new ModelAndView("redirect:login");
		
		HttpSession session = request.getSession();
		String r_path = session.getServletContext().getRealPath("/");
		System.out.println("r_path :"+r_path);
		String img_path ="C:\\SungminKim\\GoogleDrive\\spring\\basic\\Dr_Link\\webapp\\resources\\img\\profileImage\\";
		System.out.println("img_path :"+img_path);
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path);
		MultipartFile p_photo =dto.getP_photo();
		String oriFn = dto.getP_id() + p_photo.getOriginalFilename(); // 여기에 회원 아이디와 동일 파일 이름으로 저장하자
		
		path.append(oriFn);
		dto.setP_imgfile(oriFn);
		System.out.println("path = r_path + img_path:"+path);
		
		//위에 3줄 이상해서 내가 추가해본다.

		StringBuffer newpath = new StringBuffer();
		newpath.append(img_path);
		newpath.append(oriFn);
		
		File f = new File(newpath.toString()); // ���� �̹����� ����� ���
		try {
			p_photo.transferTo(f); // �������� transferTo�� ȣ���ؼ� �̹����� ������ҿ� ���� 
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("imgName",oriFn);

		System.out.println("===> dao로 가자!");
		PDaoInter.insertPatient(dto);
		System.out.println("===> Mybatis add() 실행 성공인가?");
		return mav;
		
	}
	
	//관리자 FAQ
		@RequestMapping(value = "adminquestion")
		public String aq() {
			return "admin/question";
		}
		
		//의사 로그인 체크 drloginCheck
		@RequestMapping(value = "drloginCheck")
		public String drloginCheck(DoctorDTO dto, HttpSession session) {
			System.out.println("===> dao로 가자!");
			DDaoInter.dr_loginCheck(dto);
			DoctorDTO result = DDaoInter.dr_loginCheck(dto);
			if (result == null) {
				System.out.println("로그인 실패!");
				return "login";
			} else {
				System.out.println("===> Mybatis loginchk() 실행 성공인가?");
				session.setAttribute("login", result.getD_id());
			}
			return "main";
		}
		
		//의사 회원가입 doctor_profileImage
		@RequestMapping(value = "doctorInsert", method = RequestMethod.POST)
		public ModelAndView doctorInsert(DoctorDTO dto, HttpServletRequest request) {
			System.out.println("doctorInsert 요청");
			ModelAndView mav = new ModelAndView("redirect:login");
			
			HttpSession session = request.getSession();
			String r_path = session.getServletContext().getRealPath("/");
			System.out.println("r_path :"+r_path);
			String img_path ="C:\\SungminKim\\GoogleDrive\\spring\\basic\\Dr_Link\\webapp\\resources\\img\\doctorProfileImage\\";
			System.out.println("img_path :"+img_path);
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path);
			MultipartFile d_photo =dto.getD_photo();
			String oriFn = dto.getD_id() + d_photo.getOriginalFilename(); // 여기에 회원 아이디와 동일 파일 이름으로 저장하자
			
			path.append(oriFn);
			dto.setD_imgfile(oriFn);
			System.out.println("path = r_path + img_path:"+path);
			
			//위에 3줄 이상해서 내가 추가해본다.

			StringBuffer newpath = new StringBuffer();
			newpath.append(img_path);
			newpath.append(oriFn);
			
			File f = new File(newpath.toString()); 
			try {
				d_photo.transferTo(f); 
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mav.addObject("imgName",oriFn);

			System.out.println("===> dao로 가자!");
			DDaoInter.insertDoctor(dto);
			System.out.println("===> Mybatis add() 실행 성공인가?");
			return mav;
		}
		
		
		// 의사 아이디 찾기
		@RequestMapping(value = "doctor_find_id.do", method = RequestMethod.POST)
		public String doctor_find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
			md.addAttribute("id", Dservice.doctor_find_id(response, email));
			return "doctor_find-id";
		}


		// 의사 아이디 중복 검사(AJAX)
		@RequestMapping(value = "doctor_check_id.do", method = RequestMethod.POST)
		public void doctor_check_id(@RequestParam("d_id") String d_id, HttpServletResponse response) throws Exception{
			System.out.println("===> Mybatis 아이디 중복 검사(AJAX) 실행 성공인가?");
			Dservice.doctor_check_id(d_id, response);
		}
		
		// 의사 비밀번호 찾기
		@RequestMapping(value = "doctor_find_pw.do", method = RequestMethod.POST)
		public void doctor_find_pw(@ModelAttribute DoctorDTO dto, HttpServletResponse response) throws Exception{
			System.out.println("===> Mybatis 비밀번호 찾기 실행 성공인가?");
			Dservice.doctor_find_pw(response, dto);
		}

	} 
