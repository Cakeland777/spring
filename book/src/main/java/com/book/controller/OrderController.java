package com.book.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.book.model.BookVO;
import com.book.model.MemberVO;
import com.book.model.OrderVO;
import com.book.service.OrderService;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/orderEachGoods", method = RequestMethod.POST)
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		OrderVO orderVO = new OrderVO();
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession();

		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		String action = (String) session.getAttribute("action");
//
//		if (isLogOn == null || isLogOn == false) {
//			session.setAttribute("orderInfo", _orderVO);
//			session.setAttribute("action", "/order/orderEachGoods");
//			return new ModelAndView("redirect:/member/loginForm");
//		} else {
		if (action != null && action.equals("/order/orderEachGoods")) {
			orderVO = (OrderVO) session.getAttribute("orderInfo");
			session.removeAttribute("action");
		} else {
			orderVO = _orderVO;
		}

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		List myOrderList = new ArrayList<OrderVO>();
		myOrderList.add(orderVO);

		MemberVO member = (MemberVO) session.getAttribute("member");

		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", member);
		return mav;
	}

	@RequestMapping(value = "/orderResult", method = RequestMethod.POST)
	public ModelAndView payToOrderGoods(OrderVO orderVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		session.setAttribute("orderer", member);
		orderService.insertOrder(orderVO);

		mav.addObject("myOrderList", orderVO);
		return mav;
	}

	@RequestMapping(value = "/orderAllCartGoods", method = RequestMethod.POST)
	public ModelAndView orderAllCartGoods(@RequestParam("cart_goods_qty") String[] cart_goods_qty,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		Map cartMap = (Map) session.getAttribute("cartMap");
		List myOrderList = new ArrayList<OrderVO>();

		List<BookVO> myGoodsList = (List<BookVO>) cartMap.get("myGoodsList");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		for (int i = 0; i < cart_goods_qty.length; i++) {
			String[] cart_goods = cart_goods_qty[i].split(":");
			for (int j = 0; j < myGoodsList.size(); j++) {
				BookVO BookVO = myGoodsList.get(j);
				int goods_id = BookVO.getGoods_id();
				if (goods_id == Integer.parseInt(cart_goods[0])) {
					OrderVO _orderVO = new OrderVO();
					String goods_title = BookVO.getGoods_title();
					int goods_sales_price = BookVO.getGoods_sales_price();
					String goods_fileName = BookVO.getGoods_fileName();
					_orderVO.setGoods_id(goods_id);
					_orderVO.setGoods_title(goods_title);
					_orderVO.setGoods_sales_price(goods_sales_price);
					_orderVO.setGoods_fileName(goods_fileName);
					_orderVO.setOrder_goods_qty(Integer.parseInt(cart_goods[1]));
					myOrderList.add(_orderVO);
					break;
				}
			}
		}
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberVO);
		return mav;
	}

}
