package com.book.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.book.model.BookVO;
import com.book.model.ImageFileVO;
import com.book.model.MemberVO;
import com.book.service.AdminService;
import com.book.service.BookService;
import com.book.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	@Autowired
	private MemberService memberservice;
	@Autowired
	private BookService bookService;
	@Autowired
	private AdminService adminService;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {

	}

	@RequestMapping(value = "userList", method = RequestMethod.GET)
	public void userListGET() throws Exception {

	}

	@RequestMapping(value = "bookInsertForm", method = RequestMethod.GET)
	public void bookInsertForm() throws Exception {

	}

	@RequestMapping(value = "/adminDelete")
	public String deleteMember(@RequestParam("userid") String userid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		memberservice.deleteMember(userid);

		return "redirect:/admin/userList";

	}

	@ResponseBody
	@RequestMapping(value = "/userList.do", method = RequestMethod.POST)
	public List<MemberVO> userAll(Model model) throws Exception {
		List<MemberVO> data = memberservice.memberList();
		model.addAttribute("data", data);
		return data;
	}

	@RequestMapping(value = "bookList", method = RequestMethod.GET)
	public void bookListGET() throws Exception {

	}

	@ResponseBody
	@RequestMapping(value = "/bookList.do", method = RequestMethod.POST)
	public List<BookVO> bookAll(Model model) throws Exception {
		List<BookVO> data = bookService.bookList();
		model.addAttribute("data", data);
		return data;
	}

	protected List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			ImageFileVO imageFileVO = new ImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName);
			fileList.add(imageFileVO);

			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
					if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); // 이후 파일 생성
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); // 임시로 저장된
																											// multipartFile을
																											// 실제 파일로 전송
			}
		}
		return fileList;
	}

	@RequestMapping(value = "/bookDelete")
	public String deleteBook(@RequestParam("goods_id") String goods_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		adminService.deleteBook(goods_id);

		return "redirect:/admin/bookList";

	}

	@RequestMapping(value = "/addNewBook", method = { RequestMethod.POST })
	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;

		Map newGoodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newGoodsMap.put(name, value);
		}

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getUserid();

		List<ImageFileVO> imageFileList = upload(multipartRequest);
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
			}
			newGoodsMap.put("imageFileList", imageFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int goods_id = adminService.addNewGoods(newGoodsMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + goods_id);
					org.apache.commons.io.FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('새상품을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/bookList';";
			message += ("</script>");
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/bookList';";
			message += ("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
