package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.Hospital_boardDTO;

public interface MainDaoInter {
	
	public List<Hospital_boardDTO> getAllHospitalBoards();
	public List<Hospital_boardDTO> getAllHospitalBoards(int p_num);
	public Hospital_boardDTO getDetailHospitalBoard(String h_b_num);
	public void plusWatchCnt(String h_b_num);
	public int getBoardCnt();
}
