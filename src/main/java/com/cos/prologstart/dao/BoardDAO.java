package com.cos.prologstart.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cos.prologstart.vo.BoardVO;
import com.cos.prologstart.vo.ReplyVO;
import com.cos.prologstart.web.dto.user.UserUpdateDto;


@Mapper 
public interface BoardDAO { 
	
	public boolean addBoard(BoardVO bvo); //게시물 등록
	public List<BoardVO> getAllBoard();//전체 게시판
	public BoardVO getBoardOne(int num); //글번호로 해당 게시물 불러오기
	public List<BoardVO> getMenu(String lang);//게시판 카테고리 이동
	public int updateclear(int num,String lang,String title,String image, String contents);//게시물 수정
	public int deleteBoard(int num);//게시물 삭제
	
	public List<BoardVO> goMypage(String user_id);//프로필페이지 이동
	public int hitCount(int num);//조회수 조회

	public List<ReplyVO> readReply(int num)throws Exception;//댓글 조회
	public boolean writeReply(int num, String writer,String content)throws Exception;//댓글 작성
	public int updateReply(int reply_num, String content)throws Exception;//댓글 수정
	public int deleteReply(int reply_num)throws Exception;//댓글삭제
	public int deleteAllReply(int num)throws Exception;//전체 댓글 삭제
	public List<ReplyVO> myReplyList(String user_id)throws Exception; //내가 쓴 댓글 보기

	public ArrayList<UserUpdateDto> getAllUser(); //회원정보 조회
	public int deleteMember(String user_id); //회원강제탈퇴

	public List<BoardVO> getSearchList(String type, String keyword)throws Exception; //검색기능
	public List<BoardVO> getPopularList(); //인기글
	

}
