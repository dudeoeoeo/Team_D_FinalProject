package kr.co.Dr_Link.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dao.PrescriptionDaoInter;
import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.MedicineDTO;
import kr.co.Dr_Link.mvc.dto.PatientDTO;
import kr.co.Dr_Link.mvc.dto.PrescriptionDTO;


@Repository("PrescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService{
	

	@Autowired
	private PrescriptionDaoInter pre_dao;

	@Override
	public List<PrescriptionDTO> prescriptionRecord(int patient_num) {
		return pre_dao.prescriptionRecord(patient_num);
	}

	@Override
	public void add_prescription(PrescriptionDTO vo) {
		pre_dao.add_prescription(vo);
	}

	@Override
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) {
		return pre_dao.detail_prescription(vo);
	}

	@Override
	public PatientDTO patient_info(int patient_num) {
		return pre_dao.patient_info(patient_num);
	}

	@Override
	public DoctorDTO doctor_info(int doctor_num) {
		return pre_dao.doctor_info(doctor_num);
	}

	@Override
	public List<MedicineDTO> medicine_info(MedicineDTO vo) {
		return pre_dao.medicine_info(vo);
	}

	@Override
	public List<MedicineDTO> medicine_detail_info(String[] medicine_num) {
		return pre_dao.medicine_detail_info(medicine_num);
	}

}
