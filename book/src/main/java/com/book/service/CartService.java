package com.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.book.mapper.CartMapper;
import com.book.model.BookVO;
import com.book.model.CartVO;

@Service
public class CartService {
	@Autowired
	CartMapper cartMapper;

	public Map<String, List> myCartList(CartVO cartVO) throws Exception {
		Map<String, List> cartMap = new HashMap<String, List>();
		List<CartVO> myCartList = selectCartList(cartVO);
		if (myCartList.size() == 0) {
			return null;
		}
		List<BookVO> myGoodsList = selectGoodsList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myGoodsList);
		return cartMap;
	}

	public boolean findCartGoods(CartVO cartVO) throws Exception {
		return selectCountInCart(cartVO);

	}

	public void addGoodsInCart(CartVO cartVO) throws Exception {
		insertGoodsInCart(cartVO);
	}

	public boolean modifyCartQty(CartVO cartVO) throws Exception {
		boolean result = true;
		cartMapper.updateCartGoodsQty(cartVO);
		return result;
	}

	public void removeCartGoods(int cart_id) throws Exception {
		cartMapper.deleteCartGoods(cart_id);
	}

	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = cartMapper.selectCartList(cartVO);
		return cartList;
	}

	public List<BookVO> selectGoodsList(List<CartVO> cartList) throws DataAccessException {

		List<BookVO> myGoodsList;
		myGoodsList = cartMapper.selectGoodsList(cartList);
		return myGoodsList;
	}

	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result = cartMapper.selectCountInCart(cartVO);
		return Boolean.parseBoolean(result);
	}

	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException {
		int cart_id = selectMaxCartId();
		cartVO.setCart_id(cart_id);
		cartMapper.insertGoodsInCart(cartVO);
	}

	private int selectMaxCartId() throws DataAccessException {
		int cart_id = cartMapper.selectMaxCartId();
		return cart_id;
	}

}
