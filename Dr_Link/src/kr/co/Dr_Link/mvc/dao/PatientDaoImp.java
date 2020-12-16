package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dto.TreatmentRecordDTO;


@Repository("PatientDaoInter")
public class PatientDaoImp implements PatientDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<TreatmentRecordDTO> treatmentRecord(TreatmentRecordDTO vo) {
		System.out.println("===> Mybatis treatmentRecord() 실행");
		return ss.selectList("patient.treatmentRecord");
	}


}
