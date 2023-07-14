package com.example.back.vo;

import lombok.Data;

@Data
public class PageinfoVO {
	
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;

}
