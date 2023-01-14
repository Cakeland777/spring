package com.book.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.book.model.BoardVO;

public interface BoardMapper {

	public void insertBoard(BoardVO boardVO) throws DataAccessException;

	public List<BoardVO> boardList(String goods_id);

	public BoardVO boardDetail(String bid);

	public void insertBoardReply(BoardVO boardVO) throws DataAccessException;

	public void deleteBoard(String bid);
}