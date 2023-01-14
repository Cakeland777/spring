package com.book.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.book.model.MemberVO;

public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO mem = (MemberVO) session.getAttribute("member");

		if (mem == null || mem.getAdmin_ck() == 0) {

			response.sendRedirect("/main");

			return false;

		}

		return true;
	}
}
