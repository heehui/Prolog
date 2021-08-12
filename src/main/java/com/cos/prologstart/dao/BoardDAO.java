package com.cos.prologstart.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cos.prologstart.vo.BoardVO;
import com.cos.prologstart.vo.ReplyVO;
import com.cos.prologstart.web.dto.user.UserUpdateDto;


@Mapper 
public interface BoardDAO { 
	
	public boolean addBoard(BoardVO bvo);
	public List<BoardVO> getAllBoard();//
	public BoardVO getBoardOne(int num); //글번호로 해당 게시물 불러오기
	public List<BoardVO> getMenu(String lang);
	public int updateclear(int num,String lang,String title,String image, String contents);
	public int deleteBoard(int num);
	public List<BoardVO> goMypage(String user_id);
	public int hitCount(int num);

	
	public List<ReplyVO> readReply(int num)throws Exception;
	public boolean writeReply(int num, String writer,String content)throws Exception;
	public int updateReply(int reply_num, String content)throws Exception;
	public int deleteReply(int reply_num)throws Exception;
	public int deleteAllReply(int num)throws Exception;

	public List<ReplyVO> myReplyList(String user_id)throws Exception;
	public ArrayList<UserUpdateDto> getAllUser();
	public int deleteMember(String user_id);

	

}
