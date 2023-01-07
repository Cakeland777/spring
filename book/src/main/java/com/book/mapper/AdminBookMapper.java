package com.book.mapper;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.book.model.ImageFileVO;

public interface AdminBookMapper {

	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;

	public void insertGoodsImageFile(ImageFileVO imageFileVO) throws DataAccessException;

	public void deleteBook(String goods_id);
}