package kr.co.Dr_Link.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.Dr_Link.mvc.dao.DoctorDaoInter;
import kr.co.Dr_Link.mvc.dao.PrescriptionDaoInter;
import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.MedicineDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;

@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@Autowired	
	private PrescriptionDaoInter pre_dao;
	@Autowired	
	private DoctorDaoInter doc_dao;
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("doctor 컨트롤러 실행");
		return "/doctor/"+step;
	}
	
	
	/* 배열 붙이는 메소드 */
	public static String arrayJoin(String glue, String array[]) {
	    String result = "";
	    for (int i = 0; i < array.length; i++) {
	      result += array[i];
	      if (i < array.length - 1) result += glue;
	    }
	    return result;
	  }
	
	

	@RequestMapping(value = "/login")
	public String login() {
		System.out.println("로그인");
		return "login";
	}

	/* 김다유 : add_prescription 페이지로 이동 */
	@RequestMapping(value = "/add_prescription") 
	public String add_prescription( HttpServletRequest request, PatientDTO patientVo,DoctorDTO doctorVo, MedicineDTO mediVo, Model model, HttpSession session) {
		System.out.println("처방입력 페이지로 이동");
		
		/* 로그인해서 session에 값이 있다고 가정하고 테스트 */
		PatientDTO patientinfo = pre_dao.patient_info(2);
		DoctorDTO doctorinfo = pre_dao.doctor_info(2);
		List<MedicineDTO> medicine_info = pre_dao.medicine_info(mediVo);
		
		model.addAttribute("patientinfo",patientinfo);
		model.addAttribute("doctorinfo",doctorinfo);
		model.addAttribute("medicine_info",medicine_info);
		System.out.println("controller add_prescription 실행 완료");
		return "/doctor/add_prescription";
	}
	
	/* 김다유 : end_prescription 페이지로 이동 */
	@RequestMapping(value = "/end_prescription", method = RequestMethod.POST) 
	public String end_prescription(HttpServletRequest request, PrescriptionDTO pre_vo, MedicineDTO medi_vo, Model model) {
		/*배열로 받은 값 , 구분자를 붙여 String으로 만든 후 insert*/
		
		
		String dsg = arrayJoin(",", pre_vo.getDosage());
		pre_vo.setDsg(dsg);
		String qty = arrayJoin(",", pre_vo.getQuantity());
		pre_vo.setQty(qty);
		String tdate = arrayJoin(",", pre_vo.getTaking_date());
		pre_vo.setTdate(tdate);
		String medi_num = arrayJoin(",", pre_vo.getMedicine_num());
		pre_vo.setMedi_num(medi_num);
		String pre_date = arrayJoin(",", request.getParameterValues("prescription_date"));
		pre_vo.setPre_date(pre_date);			
		pre_dao.add_prescription(pre_vo);
		
		/* 방금 pre_dao.add_prescription 한 값에서 바로 prescription을 가져와서 setting 하는 방법이 뭘까 */
		/* 방금 pre_dao.add_prescription 한 값을 바로 페이지에 띄우기 위해 select*/
		pre_vo.setPrescription_num(pre_dao.detail_prescription(pre_vo).getTreatment_num()); //처방번호와
		pre_vo.setPatient_num(pre_dao.detail_prescription(pre_vo).getPatient_num());		//환자 번호로 select
		PrescriptionDTO prescription = pre_dao.detail_prescription(pre_vo);
		List<MedicineDTO> medi_detail = pre_dao.medicine_detail_info(prescription.getMedicine_num());
		model.addAttribute("medi_detail",medi_detail);
		
		//약품 이름을 띄우기 위해 들어온 약품번호를 배열에 담아 한개씩 select
		model.addAttribute("prescription",prescription);
		model.addAttribute("medi_detail",medi_detail);
		
		return "/doctor/end_prescription";
		
	}
	
	/*김다유 : 의사 프로필 수정 페이지*/
	@RequestMapping(value = "/doctor-profile-settings")
	public String profile_settings(DoctorDTO vo, Model model) {
		DoctorDTO doctorinfo = pre_dao.doctor_info(2);
		 List<String[]> m = new ArrayList<String[]>();
		  String [] d_graduation = doctorinfo.getD_graduation().split(",");
		  String [] d_career = doctorinfo.getD_career().split(",");
		  String [] d_content = null;
		  String [] d_field = null;
		  m.add(d_graduation);
		  m.add(d_career);	  
		  if(doctorinfo.getD_content()!=null) {
			d_content = doctorinfo.getD_content().split(",");
			m.add(d_content);
		  }
		  if(doctorinfo.getD_field()!=null) {
		  	d_field = doctorinfo.getD_field().split(",");
			m.add(d_field);
		  }	 
		  model.addAttribute("m",m);
		model.addAttribute("doctorinfo",doctorinfo);
		return "/doctor/doctor-profile-settings";
	}
	
	
	/* 김다유 : 의사 프로필세팅 완료 후 페이지 이동 */
	@RequestMapping(value = "/setting_ok" )
	public String setting_ok(DoctorDTO vo, HttpServletRequest req, HttpServletResponse resp,Model model){
		vo.setD_pwd(req.getParameter("chg_pwd"));
		doc_dao.doctor_profile_update(vo);
		return "/doctor/doctor-dashboard";
		}
		
	
}
