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
	public DoctorDTO doctor_profile(DoctorDTO vo) {
		System.out.println("===> Mybatis doctor_profile() 실행");
		return ss.selectOne("doctor.doctor_profile",vo);
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
