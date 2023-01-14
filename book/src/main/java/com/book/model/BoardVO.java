package com.book.model;

import lombok.Data;

@Data
public class BoardVO {
	private String bid;
	private int goods_id;
	private String title;
	private String userid;
	private String content;
	private String time;
	private String parent_id;
}
