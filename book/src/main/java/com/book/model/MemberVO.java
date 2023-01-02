package com.book.model;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;

	private String pwd;

	private String phone;

	private String name;

	private String email;

	private String addr1;

	private String addr2;

	private String addr3;

	private int admin_ck;

	private String regdate;

	private int money;

	private int point;

}