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
	
	
	public boolean addBoard(BoardVO bvo) { //게시물 등록
		return bdao.addBoard(bvo);
	}
	
	
	public List<BoardVO> getAllBoard(){ //게시판 전체 조회
		return bdao.getAllBoard();
	}
	
	
	public BoardVO getBoardOne(int num){ //게시물 조회
		return bdao.getBoardOne(num);
	}
	
	
	public int updateclear(int num, String lang,String title,String image, String contents) { //게시물 수정
		return bdao.updateclear(num, lang, title, image,contents);
	}
	
	
	public List<BoardVO> getMenu(String lang){//게시판 카테고리
		return bdao.getMenu(lang);
	}

	
	public int deleteBoard(int num) {//게시물 삭제
		return bdao.deleteBoard(num);
	}
	
	
	public List<BoardVO> goMypage(String user_id){//프로필페이지
		return bdao.goMypage(user_id);
	}
	
	
	public int hitCount(int num) {//조회수
		return bdao.hitCount(num);
	}
	
	
	public List<ReplyVO> readReply(int num)throws Exception{ //댓글 조회
		return bdao.readReply(num);
	}
	
	
	public boolean writeReply(int num,String writer,String content)throws Exception{ //댓글 작성
		return bdao.writeReply(num, writer,content);
	}
	
	
	public int updateReply(int reply_num, String content)throws Exception{ //댓글 수정
		return bdao.updateReply(reply_num, content);
	}
	
	
	public int deleteReply(int reply_num)throws Exception{ //댓글 삭제
		return bdao.deleteReply(reply_num);
	}
	
	
	public int deleteAllReply(int num)throws Exception{ //전체 댓글 삭제
		return bdao.deleteAllReply(num);
	}
	
	
	public List<ReplyVO> myReplyList(String user_id)throws Exception{ //내가 쓴 댓글 보기
		return bdao.myReplyList(user_id);
	}
	
	
	public ArrayList<UserUpdateDto> getAllUser(){//회원정보 조회
		return bdao.getAllUser();
	}
	
	
	public int deleteMember(String user_id) { //회원강제탈퇴
		return bdao.deleteMember(user_id);
	}
	

	public List<BoardVO> getSearchList(String type, String keyword)throws Exception{ //검색기능
		return bdao.getSearchList(type, keyword);
	}
	
	
	public List<BoardVO> getPopularList(){ //인기글
		return bdao.getPopularList();
	}
	
}
