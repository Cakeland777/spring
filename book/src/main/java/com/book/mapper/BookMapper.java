package com.book.mapper;

import java.util.ArrayList;
import java.util.List;

import com.book.model.BookVO;
import com.book.model.ImageFileVO;

public interface BookMapper {

	public List<BookVO> selectGoodsList(String goodsStatus);

	public List<BookVO> selectAllGoodsList();

	public List<String> selectKeywordSearch(String keyword);

	public ArrayList selectGoodsBySearchWord(String searchWord);

	public BookVO selectGoodsDetail(String goods_id);

	public List<ImageFileVO> selectGoodsDetailImage(String goods_id);

	public List<BookVO> bookList();
}