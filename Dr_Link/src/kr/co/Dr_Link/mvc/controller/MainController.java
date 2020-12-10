package kr.co.Dr_Link.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.Dr_Link.mvc.dao.MainDaoInter;
import kr.co.Dr_Link.mvc.dto.Hospital_boardDTO;

@Controller
public class MainController {
	
	@Autowired
	private MainDaoInter dao;
	
	@RequestMapping(value = {"index", "/"})
	public String goMain() {
		return "main";
	}
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("main 에서 매핑 요청 url: " + step);
		return step;
	}
	
	@RequestMapping(value = "notice")
	public ModelAndView getH_BoardList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("notice");
		List<Hospital_boardDTO> li;
		int pageAll = dao.getBoardCnt();
		pageAll = (pageAll%10 == 0) ? pageAll/10 : (pageAll/10)+1;
		try {
			if(request.getParameter("d_page") != null) {
				li = dao.getAllHospitalBoards(Integer.parseInt(request.getParameter("d_page")));
			} else {
				li = dao.getAllHospitalBoards();
			}
			mv.addObject("h_boardList",li);
			mv.addObject("page_num", pageAll);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value = "notice_detail")
	public ModelAndView getH_BoardDetail(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("notice_detail");
		String h_b_num = request.getParameter("b_num");
		dao.plusWatchCnt(h_b_num);
		Hospital_boardDTO dto = dao.getDetailHospitalBoard(h_b_num);
		mv.addObject("h_board", dto);
		
		return mv;
	}
}
