package com.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.book.mapper.BoardMapper;
import com.book.model.BoardVO;

@Service
public class BoardService {
	@Autowired
	BoardMapper boardMapper;

	public void insertBoard(BoardVO boardVO) throws DataAccessException {
		boardMapper.insertBoard(boardVO);
	}

	public List<BoardVO> boardList(String goods_id) {

		return boardMapper.boardList(goods_id);

	}

	public BoardVO boardDetail(String bid) {

		return boardMapper.boardDetail(bid);

	}

	public void deleteBoard(String bid) throws DataAccessException {
		boardMapper.deleteBoard(bid);
	}

	public void insertBoardReply(BoardVO boardVO) throws DataAccessException {
		boardMapper.insertBoardReply(boardVO);
	}
}
