package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.DrLinkDTO;
import kr.co.Dr_Link.mvc.dto.MedicineDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;

public interface PrescriptionDaoInter {
	public void insertPrescription(PrescriptionDTO vo);
	public List<PrescriptionDTO> detail_prescription(PrescriptionDTO vo) ;
	public PatientDTO prescription_info(PatientDTO patientVo);
	public DoctorDTO prescription_info(String d_id);
	public DrLinkDTO prescription_info(DrLinkDTO drLinkVo );
	public List<MedicineDTO> medicine_info (MedicineDTO vo) ;
}
