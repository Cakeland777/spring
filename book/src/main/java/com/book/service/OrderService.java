package com.book.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.book.controller.GetSessionUser;
import com.book.mapper.OrderMapper;
import com.book.model.OrderVO;

@Service
public class OrderService {
	@Autowired
	OrderMapper orderMapper;

	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException {
		List<OrderVO> orderGoodsList = new ArrayList<OrderVO>();
		orderGoodsList = (ArrayList) orderMapper.listOrderGoods(orderVO);
		return orderGoodsList;
	}

	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException {
		int order_id = selectOrderID();

		String member_id = GetSessionUser.getMember().getUserid();
		String name = GetSessionUser.getMember().getName();
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);
			orderVO.setMember_id(member_id);
			orderVO.setOrderer_name(name);
			orderVO.setOrder_id(order_id);
			System.out.println(orderVO);
			orderMapper.insertNewOrder(orderVO);
		}

	}

	public void insertOrder(OrderVO orderVo) throws DataAccessException {
		int order_id = selectOrderID();
		orderVo.setOrder_id(order_id);
		orderMapper.insertNewOrder(orderVo);

	}

	public OrderVO findMyOrder(String order_id) throws DataAccessException {
		OrderVO orderVO = orderMapper.findMyOrder(order_id);
		return orderVO;
	}

	public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException {
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);
			orderMapper.removeGoodsFromCart(orderVO);
		}
	}

	public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
		insertNewOrder(myOrderList);
		// 카트에서 주문 상품 제거한다.
		orderMapper.removeGoodsFromCart(myOrderList);
	}

	private int selectOrderID() throws DataAccessException {
		return orderMapper.selectOrderID();

	}

	public List<OrderVO> orderList() throws Exception {

		return orderMapper.orderList();
	}

	public OrderVO AdminOrderDetail(String order_id) throws Exception {

		return orderMapper.AdminOrderDetail(order_id);
	}
}
