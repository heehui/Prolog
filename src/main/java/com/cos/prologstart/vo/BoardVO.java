package com.cos.prologstart.vo;

import lombok.Data;

@Data
public class BoardVO {
	
	private String user_id;
	private int user_num;
	private int num;//글번호
	private String lang;//게시판 카테고리
	private String title;
	private String contents;
	private String image;
	private String date1;
	private int hit; //조회수
	private int reply_cnt; //댓글 개수
	
	private String type;
	private String keyword;
	
	public BoardVO() {}
	
	public BoardVO(String user_id,int user_num,int num, String lang, String title,String contents,String image) {
		this.user_id =user_id; 
		this.user_num =user_num; 
		this.num =num;
		this.lang =lang;
		this.title =title;
		this.contents =contents;
		this.image =image;
		
	}
}
