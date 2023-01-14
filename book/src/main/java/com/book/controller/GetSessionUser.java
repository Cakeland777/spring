package com.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.book.model.MemberVO;

public class GetSessionUser {
	public static MemberVO getMember() {
		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes();
		HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);

		return (MemberVO) httpSession.getAttribute("member"); // 로그인할때 userVo란 이름으로 세션정보가 담아있다.
	}
}