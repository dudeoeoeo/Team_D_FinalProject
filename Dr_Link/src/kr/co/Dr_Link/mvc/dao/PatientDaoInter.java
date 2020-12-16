package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.TreatmentRecordDTO;

public interface PatientDaoInter {
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<TreatmentRecordDTO> treatmentRecord (TreatmentRecordDTO vo);

}
