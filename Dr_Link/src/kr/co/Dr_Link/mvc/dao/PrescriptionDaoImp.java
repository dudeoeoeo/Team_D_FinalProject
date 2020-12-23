package kr.co.Dr_Link.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
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
	public PatientDTO patient_info(int patient_num) {
		System.out.println("===> Mybatis prescription_info(환자정보) 실행");
		return ss.selectOne("prescription.patient_info",patient_num);
	}

	@Override
	public DoctorDTO doctor_info(int doctor_num) {
		System.out.println("===> Mybatis prescription_info(의사정보) 실행");
		return ss.selectOne("prescription.doctor_info",doctor_num);
	}


	@Override
	public List<MedicineDTO> medicine_info(MedicineDTO vo) {
		System.out.println("===> Mybatis medicine_info() 실행");
		return ss.selectList("prescription.medicine_info",vo);
	}

	@Override
	public List<MedicineDTO> medicine_detail_info(String [] medicine_num) {
		System.out.println("===> Mybatis medicine_detail_info() 실행");
		ArrayList<MedicineDTO> medi_num = new ArrayList<MedicineDTO>();
		for(String medicine : medicine_num) {
			medi_num.add(ss.selectOne("prescription.medicine_detail_info",medicine));
		}
		return medi_num;
	}

}
