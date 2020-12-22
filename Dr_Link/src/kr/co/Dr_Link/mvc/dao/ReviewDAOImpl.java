package kr.co.Dr_Link.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.Dr_Link.mvc.dto.Doc_ReviewDTO;
@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addReview(Doc_ReviewDTO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReview(Doc_ReviewDTO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReview(Doc_ReviewDTO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public Doc_ReviewDTO getReview(int review_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Doc_ReviewDTO> getReviewList(int doctor_num) {
		// TODO Auto-generated method stub
		return ss.selectList("doc_review.reviewList", doctor_num);
	}

}
