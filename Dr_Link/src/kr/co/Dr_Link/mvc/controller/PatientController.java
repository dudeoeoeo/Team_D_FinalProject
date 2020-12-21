package kr.co.Dr_Link.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.Dr_Link.mvc.dao.PatientDaoImp;
import kr.co.Dr_Link.mvc.dao.PatientDaoInter;
import kr.co.Dr_Link.mvc.dao.PrescriptionDaoImp;
import kr.co.Dr_Link.mvc.dao.PrescriptionDaoInter;
import kr.co.Dr_Link.mvc.dto.DrLinkDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;
import kr.co.Dr_Link.mvc.dto.TreatmentRecordDTO;



@Controller
@RequestMapping(value = "/patients")
public class PatientController {

	@Autowired	
	private PrescriptionDaoInter pre_dao;
	@Autowired
	private PatientDaoInter patient_dao;
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("patients 컨트롤러");
		return "/patients/"+step;
	}
	/* 김다유 : patient_dashboard 페이지로 이동 - 처방기록리스트 */
	/* patient_dashboard에서 진료기록, 결제기록, 예약기록 담당하시는 분들 여기서 값 세팅해주세요 */
	@RequestMapping(value = "patient_dashboard")
	public String treatmentRecord(PrescriptionDTO pre_vo, Model model) {
		try {
		List<PrescriptionDTO> prescriptionRecord = patient_dao.prescriptionRecord(pre_vo);
		System.out.println(prescriptionRecord.get(0).getPrescription_date()); 
		System.out.println("***"+prescriptionRecord.get(0).getDoctor_num()); 
		model.addAttribute("prescriptionRecord", prescriptionRecord);
		} catch (NullPointerException e) {
				  
		}
		return "/patients/patient_dashboard";
	}
	
	/* 김다유 : 처방기록 상세 페이지로 이동 */
	@RequestMapping(value = "/detail_prescription") 
	public String end_prescription(PrescriptionDTO vo,Model model) {
		PrescriptionDTO prescription = pre_dao.detail_prescription(vo);
		System.out.println("***"+prescription.getPayment_check());
		System.out.println("***"+prescription.getPrescription_date());
		System.out.println("***"+prescription.getPrescription_time());
		model.addAttribute("prescription",prescription);
		
		int chk_num = 0;
		String url ="";
		
		if(chk_num == 0) {
			int pre_num = prescription.getPrescription_num();
			model.addAttribute("pre_num",pre_num);
			url="/patients/결재";
		}else {
			model.addAttribute("prescription",prescription);
			url="/patients/detail_prescription";
		}
		model.addAttribute("prescription",prescription);
		System.out.println("controller detail_prescription 실행 완료");
		    
		return "/patients/detail_prescription";
	}

}
