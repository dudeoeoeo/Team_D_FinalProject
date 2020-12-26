package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.MedicineDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;



public interface PrescriptionDaoInter {
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<PrescriptionDTO> prescriptionRecord (int patient_num);
	public void add_prescription(PrescriptionDTO vo);
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) ;
	public PatientDTO patient_info(int patient_num);
	public DoctorDTO doctor_info(int doctor_num);
	public List<MedicineDTO> medicine_info (MedicineDTO vo) ;
	public List<MedicineDTO> medicine_detail_info (String [] medicine_num) ;
}
