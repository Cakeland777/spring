package com.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.mapper.MemberMapper;
import com.book.model.MemberVO;

@Service
public class MemberService {
	@Autowired
	MemberMapper membermapper;

	public void InsertMember(MemberVO member) throws Exception {

		membermapper.InsertMember(member);

	}

	public int idCheck(String userid) throws Exception {

		return membermapper.idCheck(userid);
	}

	public MemberVO memberLogin(MemberVO member) throws Exception {

		return membermapper.memberLogin(member);
	}

}
