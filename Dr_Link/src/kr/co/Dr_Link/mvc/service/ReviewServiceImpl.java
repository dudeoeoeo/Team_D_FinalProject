package kr.co.Dr_Link.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.Dr_Link.mvc.dao.ReviewDAO;
import kr.co.Dr_Link.mvc.dto.Doc_ReviewDTO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO re_dao;

	@Override
	public void addReview(Doc_ReviewDTO vo) {

	}

	@Override
	public void updateReview(Doc_ReviewDTO vo) {

	}

	@Override
	public void deleteReview(Doc_ReviewDTO vo) {

	}

	@Override
	public Doc_ReviewDTO getReview(int review_num) {
		return null;
	}

	@Override
	public List<Doc_ReviewDTO> getReviewList(int doctor_num) {
		List<Doc_ReviewDTO> getReviewList = re_dao.getReviewList(doctor_num);
		System.out.println("serviece 입니다 : "+getReviewList);
		return getReviewList;
	}

}
