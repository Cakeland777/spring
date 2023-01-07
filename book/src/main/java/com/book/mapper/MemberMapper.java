package com.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.model.MemberVO;

public interface MemberMapper {
	public void InsertMember(MemberVO member);

	public int idCheck(String userid);

	public MemberVO memberLogin(MemberVO member);

	public void deleteMember(String userid);

	public String selectPwd(String userid);

	public String selectEmail(String userid);

	public void updateMember(MemberVO member);

	public List<MemberVO> memberList();

	public void resetPwd(@Param("pwd") String pwd, @Param("userid") String userid);

	public String findIdByPhone(@Param("name") String name, @Param("phone") String phone);
}
