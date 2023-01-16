package com.book.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.book.model.CartVO;
import com.book.model.MemberVO;
import com.book.service.CartService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	@Autowired
	private CartService cartService;

	@RequestMapping(value = "/addGoodsInCart", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String userid = memberVO.getUserid();
		CartVO cartVO = new CartVO();
		cartVO.setUserid(userid);
		// 카트 등록전에 이미 등록된 제품인지 판별한다.
		cartVO.setGoods_id(goods_id);
		cartVO.setUserid(userid);
		boolean isAreadyExisted = cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:" + isAreadyExisted);
		if (isAreadyExisted == true) {
			return "already_existed";
		} else {
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}

	@RequestMapping(value = "/myCartList", method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getUserid();
		CartVO cartVO = new CartVO();
		cartVO.setUserid(member_id);
		Map<String, List> cartMap = cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		return mav;
	}

	@RequestMapping(value = "/modifyCartQty", method = RequestMethod.POST)
	public @ResponseBody String modifyCartQty(@RequestParam("goods_id") int goods_id,
			@RequestParam("cart_goods_qty") int cart_goods_qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getUserid();
		CartVO cartVO = new CartVO();
		cartVO.setGoods_id(goods_id);
		cartVO.setUserid(member_id);
		cartVO.setCart_goods_qty(cart_goods_qty);
		boolean result = cartService.modifyCartQty(cartVO);

		if (result == true) {
			return "modify_success";
		} else {
			return "modify_failed";
		}

	}

	@RequestMapping(value = "/removeCartGoods", method = RequestMethod.POST)
	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		cartService.removeCartGoods(cart_id);
		mav.setViewName("redirect:/cart/myCartList");
		return mav;
	}
}
