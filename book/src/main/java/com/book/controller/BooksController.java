package com.book.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.model.BoardVO;
import com.book.model.BookVO;
import com.book.service.BoardService;
import com.book.service.BookService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/books")
public class BooksController {

	@Autowired
	private BookService bookService;
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/booksDetail", method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		Map goodsMap = bookService.goodsDetail(goods_id);
		List<BoardVO> data = boardService.boardList(goods_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("data", data);
		model.addAttribute("data", data);
		BookVO booksVO = (BookVO) goodsMap.get("booksVO");
//		addGoodsInQuick(goods_id, booksVO, session);
		return mav;
	}

	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		if (keyword == null || keyword.equals(""))
			return null;

		keyword = keyword.toUpperCase();
		List<String> keywordList = bookService.selectKeywordSearch(keyword);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);

		String jsonInfo = jsonObject.toString();
		return jsonInfo;
	}

	@RequestMapping(value = "/searchBooks", method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("query") String searchWord, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<BookVO> goodsList = bookService.selectGoodsBySearchWord(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		return mav;

	}

	@ResponseBody
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public List<BoardVO> bookAll(Model model, @RequestParam("goods_id") String goods_id) throws Exception {
		List<BoardVO> data = boardService.boardList(goods_id);
		model.addAttribute("data", data);
		return data;
	}

	@RequestMapping(value = "board", method = RequestMethod.POST)
	public String insertBoard(HttpServletRequest request, BoardVO board, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		int goods_id = board.getGoods_id();
		boardService.insertBoard(board);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/boardReply", method = RequestMethod.POST)
	public String replyBoard(HttpServletRequest request, HttpServletResponse resp, BoardVO board,
			RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		boardService.insertBoardReply(board);
		String referer = request.getHeader("Referer");
		int goods_id = board.getGoods_id();
		return "redirect:/books/booksDetail?goods_id=" + goods_id;

	}

	@RequestMapping(value = "/boardDelete")
	public String deleteBook(@RequestParam("bid") String bid, @RequestParam("goods_id") String goods_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		boardService.deleteBoard(bid);

		String referer = request.getHeader("Referer");
		return "redirect:/books/booksDetail?goods_id=" + goods_id;

	}

	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam("bid") String bid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		BoardVO board = boardService.boardDetail(bid);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("board", board);
		return mav;

	}

	@RequestMapping(value = "/allBooks", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		session = request.getSession();
		Map<String, List<BookVO>> goodsMap = bookService.listAllGoods();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
}
