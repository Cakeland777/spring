package com.book.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.book.model.BookVO;
import com.book.model.CartVO;

public interface CartMapper {

	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;

	public List<BookVO> selectGoodsList(List<CartVO> cartList) throws DataAccessException;

	public String selectCountInCart(CartVO cartVO) throws DataAccessException;

	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException;

	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException;

	public void deleteCartGoods(int cart_id) throws DataAccessException;

	public int selectMaxCartId() throws DataAccessException;

}
