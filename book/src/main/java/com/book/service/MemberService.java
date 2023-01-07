package com.book.service;

import java.util.List;

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

	public void deleteMember(String userid) throws Exception {
		membermapper.deleteMember(userid);

	}

	public String selectPwd(String userid) throws Exception {

		return membermapper.selectPwd(userid);
	}

	public String selectEmail(String userid) throws Exception {

		return membermapper.selectEmail(userid);
	}

	public void updateMember(MemberVO member) throws Exception {

		membermapper.updateMember(member);
	}

	public void resetPwd(String pwd, String userid) throws Exception {

		membermapper.resetPwd(pwd, userid);
	}

	public List<MemberVO> memberList() throws Exception {

		return membermapper.memberList();
	}

	public String findIdByPhone(String name, String phone) throws Exception {

		return membermapper.findIdByPhone(name, phone);
	}
}
