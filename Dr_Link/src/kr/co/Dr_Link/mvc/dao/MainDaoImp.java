package kr.co.Dr_Link.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dto.Hospital_boardDTO;

@Repository
public class MainDaoImp implements MainDaoInter {
	
	private static final Logger logger=
            LoggerFactory.getLogger(MainDaoImp.class);
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<Hospital_boardDTO> getAllHospitalBoards() {
		System.out.println("boardListDAO 요청");
		logger.info("h_boardListCalled...");
		return ss.selectList("board.boardList");
	}
	
	public List<Hospital_boardDTO> getAllHospitalBoards(int p_num) {
		Map<String, Integer> map = new HashMap<>();
		if (p_num == 1) {
			map.put("start", p_num);
			map.put("end", p_num*10);
		} else {
			map.put("start", p_num*10-9);
			map.put("end", p_num*10);
		}
		System.out.println("boardListDAO p_num 요청 " + map.get("start") + " / " + map.get("end"));
		return ss.selectList("board.boardListPage", map);
	}
	public Hospital_boardDTO getDetailHospitalBoard(String h_b_num) {
		System.out.println("boardDetailDAO 요청");
		return ss.selectOne("board.boardDetail", h_b_num);
	}

	public int getBoardCnt() {
		System.out.println("getCnt 요청" + "총 행의 개수");
		return ss.selectOne("board.getCnt");
	};
	
	public void plusWatchCnt(String h_b_num) {
		System.out.println("updateCntDAO 요청");
		ss.update("board.plusCnt", h_b_num);
	}
	
}
