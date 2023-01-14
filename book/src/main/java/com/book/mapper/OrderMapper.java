package com.book.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.book.model.OrderVO;

public interface OrderMapper {
	public List<OrderVO> listOrderGoods(OrderVO orderBean) throws DataAccessException;

	public void insertNewOrder(OrderVO orderVo) throws DataAccessException;

	public OrderVO findMyOrder(String order_id) throws DataAccessException;

	public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException;

	public void removeGoodsFromCart(OrderVO orderVO) throws DataAccessException;

	int selectOrderID() throws DataAccessException;

	public List<OrderVO> orderList() throws DataAccessException;
}
