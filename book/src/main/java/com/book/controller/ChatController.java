package com.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.model.MemberVO;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {

	@RequestMapping("/chat")
	public void chat(Model model, HttpSession session) {

		MemberVO user = (MemberVO) session.getAttribute("member");

		model.addAttribute("userid", user.getName());
	}
}