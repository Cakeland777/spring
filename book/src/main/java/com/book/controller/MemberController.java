package com.book.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping(value = "pwdReset", method = RequestMethod.GET)
	public void pwdReset() {

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

	@RequestMapping(value = "/userEmailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String userEmailCheckPOST(HttpServletRequest request, String userid, String email) throws Exception {

		String emailck = memberservice.selectEmail(userid);

		if (emailck.equals(email)) {

			return "success";

		} else {

			return "fail";
		}
	}

	@RequestMapping(value = "/userpwdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String userpwdCheckPOST(HttpServletRequest request, String userid, String pwd) throws Exception {
		String pwdck = memberservice.selectPwd(userid);

		if (pwdck.equals(pwd)) {

			return "success";

		} else {

			return "fail";
		}
	}

	@RequestMapping(value = "pwdResetForm", method = RequestMethod.POST)
	public String pwdReset(HttpServletRequest request, String userid, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		if (userid != null) {

			rttr.addFlashAttribute("userid", userid);
			return "redirect:/member/pwdReset";

		} else {

			return "redirect:/main";
		}
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public String findId(HttpServletRequest request, String name, String phone) throws Exception {

		String userid = memberservice.findIdByPhone(name, phone);

		return userid;

	}

	@RequestMapping(value = "/pwdUpdate.do", method = RequestMethod.POST)
//	@ResponseBody
	public String resetPwd(HttpServletRequest request, String pwd, String userid) throws Exception {

		memberservice.resetPwd(pwd, userid);
		return "redirect:/member/login";

	}

	@RequestMapping(value = "deletePage", method = RequestMethod.GET)
	public void deleteGET() {

	}

	@RequestMapping(value = "findPwd", method = RequestMethod.GET)
	public void PwdFindGET() {

	}

	@RequestMapping(value = "findPage", method = RequestMethod.GET)
	public void findGET() {

	}

	@RequestMapping(value = "updateMember", method = RequestMethod.GET)
	public void update(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO mem = (MemberVO) session.getAttribute("member");

		session.setAttribute("member", mem);

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(@ModelAttribute MemberVO member, HttpServletRequest request) throws Exception {

		memberservice.updateMember(member);
		HttpSession session = request.getSession();
		session.setAttribute("member", member);

		return "redirect:/member/mypage";

	}

	@RequestMapping(value = "/deleteMember")
	public String deleteMember(HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO mem = (MemberVO) session.getAttribute("member");
		String userid = mem.getUserid();
		memberservice.deleteMember(userid);
		session.invalidate();
		return "redirect:/main";

	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO mem = memberservice.memberLogin(member);
		if (mem == null) {

			String result = "fail";
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";

		}

		session.setAttribute("member", mem);
		String userid = mem.getUserid();
		session.setAttribute("user_name", userid);
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

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public void mypage(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO mem = (MemberVO) session.getAttribute("member");

		session.setAttribute("member", mem);

	}

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		String setFrom = "관리자 <minishelll777@gmail.com>";
		String toMail = email;
		String title = "비밀번호 초기화 인증번호";
		String content = "인증번호는 " + "<b>" + checkNum + "</b>" + " 입니다" + "<br>";
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
		String num = Integer.toString(checkNum);
		return num;
	}

	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	@ResponseBody
	public void mailGET(String email) throws Exception {
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