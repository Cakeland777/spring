package com.book.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.mapper.MemberMapper;
import com.book.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {
	@Autowired
	private MemberMapper membermapper;

	// 회원가입 쿼리 테스트 메서드
	@Test
	public void InsertMember() throws Exception {
		MemberVO member = new MemberVO();

		member.setUserid("test");
		member.setPhone("1111");// 회원 id
		member.setPwd("test"); // 회원 비밀번호
		member.setName("test"); // 회원 이름
		member.setEmail("test"); // 회원 메일
		member.setAddr1("test"); // 회원 우편번호
		member.setAddr2("test"); // 회원 주소
		member.setAddr3("test"); // 회원 상세주소

		membermapper.InsertMember(member);// 쿼리 메서드 실행

	}

}