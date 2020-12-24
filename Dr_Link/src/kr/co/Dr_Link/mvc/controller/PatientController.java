package kr.co.Dr_Link.mvc.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.Dr_Link.mvc.dao.PatientDaoImp;
import kr.co.Dr_Link.mvc.dao.PatientDaoInter;
import kr.co.Dr_Link.mvc.dao.PrescriptionDaoImp;
import kr.co.Dr_Link.mvc.dao.PrescriptionDaoInter;
import kr.co.Dr_Link.mvc.dto.MedicineDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;
import kr.co.Dr_Link.mvc.dto.TreatmentRecordDTO;



@Controller
@RequestMapping(value = "/patients")
public class PatientController {

	@Autowired	
	private PrescriptionDaoInter pre_dao;
	@Autowired
	private PatientDaoInter patient_dao;

	@RequestMapping(value = "main")
	public String main() {
		System.out.println("patients 컨트롤러");
		return "redirect:main";
	}
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("patients 컨트롤러");
		return "/patients/"+step;
	}
	/* 김다유 : patient_dashboard 페이지로 이동 - 처방기록리스트 */
	/* patient_dashboard에서 진료기록, 결제기록, 예약기록 담당하시는 분들 여기서 값 세팅해주세요 */
	@RequestMapping(value = "patient_dashboard")
	public String treatmentRecord(PrescriptionDTO pre_vo, Model model) {
		System.out.println("대시보드 매핑");
		try {
		List<PrescriptionDTO> prescriptionRecord = patient_dao.prescriptionRecord(2);
		System.out.println(prescriptionRecord.size());
		model.addAttribute("prescriptionRecord", prescriptionRecord);
		} catch (NullPointerException e) {
				  
		}
		return "/patients/patient_dashboard";
	}
	
	/* 김다유 : 처방기록 상세 페이지로 이동 */
	@RequestMapping(value = "/detail_prescription") 
	public String end_prescription(PrescriptionDTO pre_vo,Model model, MedicineDTO medi_vo) {
		pre_vo.setPrescription_num(103);
		pre_vo.setPatient_num(2);
		PrescriptionDTO prescription = pre_dao.detail_prescription(pre_vo);
		
		List<MedicineDTO> medi_detail = pre_dao.medicine_detail_info(prescription.getMedicine_num());
		model.addAttribute("prescription",prescription);
		model.addAttribute("medi_detail",medi_detail);
		
//		int chk_num = 0;
//		String url ="";
//		
//		if(chk_num == 0) {
//			int pre_num = prescription.getPrescription_num();
//			model.addAttribute("pre_num",pre_num);
//			url="/patients/payment";
//		}else {
//			model.addAttribute("prescription",prescription);
//			model.addAttribute("medi_detail",medi_detail);
//			url="/patients/detail_prescription";
//		}
		System.out.println("controller detail_prescription 실행 완료");
		    
		return "/patients/detail_prescription";
	}

}
