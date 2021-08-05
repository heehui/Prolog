package com.cos.prologstart.web.api;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.prologstart.config.auth.PrincipalDetails;
import com.cos.prologstart.domain.board.Board;
import com.cos.prologstart.service.BoardService;
import com.cos.prologstart.service.LikesService;
import com.cos.prologstart.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class BoardApiController {
	
	private final BoardService boardService;
	private final LikesService likesService;
	
	@GetMapping("/api/board")
	public ResponseEntity<?> boardStory(@AuthenticationPrincipal PrincipalDetails principalDetails, 
			@PageableDefault(size=3) Pageable pageable){
		Page<Board> boards = boardService.보드스토리(principalDetails.getUser().getId(), pageable);
		
		return new ResponseEntity<>(new CMRespDto<>(1,"성공", boards), HttpStatus.OK);
	}
	
	@PostMapping("/api/board/{boardId}/likes")
	public ResponseEntity<?> likes(@PathVariable int boardId ,@AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요(boardId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
	}
	
	@DeleteMapping("/api/board/{boardId}/likes")
	public ResponseEntity<?> UnLikes(@PathVariable int boardId ,@AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요취소(boardId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소", null), HttpStatus.OK);
	}
}
