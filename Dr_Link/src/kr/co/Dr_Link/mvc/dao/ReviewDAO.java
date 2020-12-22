package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import kr.co.Dr_Link.mvc.dto.Doc_ReviewDTO;

public interface ReviewDAO {
	
	void addReview(Doc_ReviewDTO vo);
	
	void updateReview(Doc_ReviewDTO vo);
	
	void deleteReview(Doc_ReviewDTO vo);
	
	Doc_ReviewDTO getReview(int review_num);
	
	List<Doc_ReviewDTO> getReviewList(int doctor_num);

}
