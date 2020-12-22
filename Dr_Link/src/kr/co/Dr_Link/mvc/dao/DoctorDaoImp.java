package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;
import kr.co.Dr_Link.mvc.dto.SearchDTO;

@Repository("DoctorDaoInter")
public class DoctorDaoImp implements DoctorDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public DoctorDTO doctor_info(int doctor_num) {
		System.out.println("===> Mybatis prescription_info(의사정보) 실행");
		return ss.selectOne("prescription.doctor_info",doctor_num);
	}


	@Override
	public void doctor_profile_update(DoctorDTO vo) {
		System.out.println("===> Mybatis addPrescription() 실행");
		ss.insert("prescription.addPrescription",vo);
	}
	
	@Override
	public List<SearchDTO> getSearch() {
		System.out.println("===> ss getSearch() 실행");
		return ss.selectList("doctor.getSearch");
	}




}
