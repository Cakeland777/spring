package com.book.mapper;

import com.book.model.MemberVO;

public interface MemberMapper {
	public void InsertMember(MemberVO member);

	public int idCheck(String userid);

	public MemberVO memberLogin(MemberVO member);
}
