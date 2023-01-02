package com.book.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.model.MemberVO;
import com.book.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberservice;
	@Autowired
	private JavaMailSender mailSender;

	// 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() {

	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		memberservice.InsertMember(member);

		return "redirect:/main";

	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {

	}

	@RequestMapping(value = "/useridCheck", method = RequestMethod.POST)
	@ResponseBody
	public String useridCheckPOST(String userid) throws Exception {
		int result = memberservice.idCheck(userid);

		if (result != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO mem = memberservice.memberLogin(member);
		if (mem == null) {

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";

		}

		session.setAttribute("member", mem);

		return "redirect:/main";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		session.invalidate();

	}

	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String email) throws Exception {
		String setFrom = "관리자 <minishelll777@gmail.com>";
		String toMail = email;
		String title = "회원가입 축하메일";
		String content = "회원가입을 해주셔서 감사합니다" + "<br>";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}