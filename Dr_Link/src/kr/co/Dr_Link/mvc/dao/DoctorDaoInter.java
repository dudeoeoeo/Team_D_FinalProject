package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.DoctorDTO;
import kr.co.Dr_Link.mvc.dto.SearchDTO;

public interface DoctorDaoInter {
	public DoctorDTO doctor_info(int doctor_num);
	public void doctor_profile_update(DoctorDTO vo);
	public List<SearchDTO> getSearch();
}
	