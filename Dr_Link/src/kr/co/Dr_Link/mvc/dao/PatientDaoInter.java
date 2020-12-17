package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.TreatmentRecordDTO;

public interface PatientDaoInter {
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<TreatmentRecordDTO> treatmentRecord (TreatmentRecordDTO vo);
	
	/* 김성민 */
	public void insertPatient(PatientDTO dto);
	
	public PatientDTO loginCheckPatient(PatientDTO dto);
	
	public int idCheck(String p_id);
	
	public int check_id(String p_id) throws Exception;
	
	public String find_id(String email) throws Exception;
	
	public int update_pw(PatientDTO dto) throws Exception;
	
	public PatientDTO emailCheck(String id) throws Exception;
	
//	// 비밀번호 변경
//	public int updatePw(PatientDTO dto) throws Exception;
}
