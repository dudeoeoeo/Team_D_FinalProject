package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.DrLinkDTO;
import kr.co.Dr_Link.mvc.dto.MedicineDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;

@Repository("PrescriptionDaoInter")
public class PrescriptionDaoImp implements PrescriptionDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	/* 리스트 처리 해야 함 ... */
	@Override
	public void add_prescription(PrescriptionDTO vo) {
		System.out.println("===> Mybatis add_prescription() 실행");
		ss.insert("prescription.add_prescription",vo);
	}

	@Override
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) {
		System.out.println("===> Mybatis detail_prescription() 실행");
		return ss.selectOne("prescription.detail_prescription",vo);
	}



	@Override
	public PatientDTO prescription_info(PatientDTO patientVo) {
		System.out.println("===> Mybatis prescription_info(환자정보) 실행");
		return ss.selectOne("prescription.patient_info",patientVo);
	}

	@Override
	public DoctorDTO prescription_info(String d_id) {
		System.out.println("===> Mybatis prescription_info(의사정보) 실행");
		return ss.selectOne("prescription.doctor_info",d_id);
	}


	@Override
	public List<MedicineDTO> medicine_info(MedicineDTO vo) {
		System.out.println("===> Mybatis medicine_info() 실행");
		return ss.selectList("prescription.medicine_info",vo);
	}

}
