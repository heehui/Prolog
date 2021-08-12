package com.cos.prologstart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cos.prologstart.dao.BoardDAO;
import com.cos.prologstart.vo.BoardVO;
import com.cos.prologstart.vo.ReplyVO;
import com.cos.prologstart.web.dto.user.UserProfileDto;
import com.cos.prologstart.web.dto.user.UserUpdateDto;




@Service
public class BoardService1 {
	
	@Autowired 
	private BoardDAO bdao;
	
	
	public boolean addBoard(BoardVO bvo) {
		return bdao.addBoard(bvo);
	}

	public List<BoardVO> getAllBoard(){
		return bdao.getAllBoard();
	}
	
	
	public BoardVO getBoardOne(int num){
		return bdao.getBoardOne(num);
	}
	
	
	public int updateclear(int num, String lang,String title,String image, String contents) {
		return bdao.updateclear(num, lang, title, image,contents);
	}
	
	public List<BoardVO> getMenu(String lang){
		return bdao.getMenu(lang);
	}

	
	public int deleteBoard(int num) {
		return bdao.deleteBoard(num);
	}
	
	public List<BoardVO> goMypage(String user_id){
		return bdao.goMypage(user_id);
	}
	public int hitCount(int num) {
		return bdao.hitCount(num);
	}
	
	
	public List<ReplyVO> readReply(int num)throws Exception{
		return bdao.readReply(num);
	}
	
	public boolean writeReply(int num,String writer,String content)throws Exception{
		return bdao.writeReply(num, writer,content);
	}
	
	public int updateReply(int reply_num, String content)throws Exception{
		return bdao.updateReply(reply_num, content);
	}
	
	public int deleteReply(int reply_num)throws Exception{
		return bdao.deleteReply(reply_num);
	}
	
	public int deleteAllReply(int num)throws Exception{
		return bdao.deleteAllReply(num);
	}
	public List<ReplyVO> myReplyList(String user_id)throws Exception{
		return bdao.myReplyList(user_id);
	}
	
	
	public ArrayList<UserUpdateDto> getAllUser(){
		return bdao.getAllUser();
	}
	
	
	
	public int deleteMember(String user_id) {
		return bdao.deleteMember(user_id);
	}
	

}
