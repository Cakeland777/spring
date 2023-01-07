package com.book.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.book.mapper.AdminBookMapper;
import com.book.model.ImageFileVO;

@Service
public class AdminService {
	@Autowired
	AdminBookMapper adminBookMapper;

	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		adminBookMapper.insertNewGoods(newGoodsMap);
		return Integer.parseInt((String) newGoodsMap.get("goods_id"));
	}

	public void insertGoodsImage(List fileList) throws DataAccessException {
		for (int i = 0; i < fileList.size(); i++) {
			ImageFileVO imageFileVO = (ImageFileVO) fileList.get(i);
			adminBookMapper.insertGoodsImageFile(imageFileVO);

		}

	}

	public void deleteBook(String goods_id) throws Exception {
		adminBookMapper.deleteBook(goods_id);

	}

	public int addNewGoods(Map newGoodsMap) throws Exception {
		int goods_id = insertNewGoods(newGoodsMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList) newGoodsMap.get("imageFileList");
		for (ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setGoods_id(goods_id);
		}
		insertGoodsImage(imageFileList);
		return goods_id;
	}
}
