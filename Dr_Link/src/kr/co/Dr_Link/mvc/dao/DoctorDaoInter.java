package kr.co.Dr_Link.mvc.dao;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;

public interface DoctorDaoInter {
	public DoctorDTO doctor_profile(DoctorDTO vo);
	public void doctor_profile_update(DoctorDTO vo);
}
	