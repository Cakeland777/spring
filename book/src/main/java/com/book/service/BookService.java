package com.book.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.book.mapper.BookMapper;
import com.book.model.BookVO;
import com.book.model.ImageFileVO;

@Service
public class BookService {
	@Autowired
	BookMapper bookMapper;

	public Map<String, List<BookVO>> listGoods() throws Exception {
		Map<String, List<BookVO>> bookMap = new HashMap<String, List<BookVO>>();
		List<BookVO> bookList = bookMapper.selectGoodsList("bestseller");
		bookMap.put("bestseller", bookList);
		bookList = bookMapper.selectGoodsList("newbook");
		bookMap.put("newbook", bookList);
		bookList = bookMapper.selectGoodsList("steadyseller");
		bookMap.put("steadyseller", bookList);
		return bookMap;

	}

	public Map<String, List<BookVO>> listAllGoods() throws Exception {
		Map<String, List<BookVO>> bookMap = new HashMap<String, List<BookVO>>();
		List<BookVO> bookList = bookMapper.selectAllGoodsList();
		bookMap.put("bookList", bookList);
		return bookMap;

	}

	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap = new HashMap();
		BookVO booksVO = bookMapper.selectGoodsDetail(_goods_id);
		goodsMap.put("booksVO", booksVO);
		List<ImageFileVO> imageList = bookMapper.selectGoodsDetailImage(_goods_id);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}

	public List<BookVO> selectGoodsList(String goodsStatus) throws DataAccessException {

		return bookMapper.selectGoodsList(goodsStatus);

	}

	public List<BookVO> selectAllGoodsList() throws DataAccessException {

		return bookMapper.selectAllGoodsList();

	}

	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
		return bookMapper.selectKeywordSearch(keyword);
	}

	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException {
		return bookMapper.selectGoodsBySearchWord(searchWord);
	}

	public BookVO selectGoodsDetail(String goods_id) throws DataAccessException {
		return bookMapper.selectGoodsDetail(goods_id);
	}

	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException {
		return bookMapper.selectGoodsDetailImage(goods_id);
	}

	public List<BookVO> bookList() throws Exception {

		return bookMapper.bookList();
	}
}
