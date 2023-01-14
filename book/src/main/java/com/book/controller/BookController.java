package com.book.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.book.model.BookVO;
import com.book.service.BookService;

@Controller
@EnableAspectJAutoProxy
public class BookController {
	@Autowired
	private BookService bookService;
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

//	@RequestMapping(value = "/main", method = { RequestMethod.POST, RequestMethod.GET })
//	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String) request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		session = request.getSession();
//		Map<String, List<BookVO>> goodsMap = bookService.listGoods();
//		mav.addObject("goodsMap", goodsMap);
//		return mav;
//	}
	@RequestMapping(value = "/main", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		session = request.getSession();
		Map<String, List<BookVO>> goodsMap = bookService.listGoods();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}

}