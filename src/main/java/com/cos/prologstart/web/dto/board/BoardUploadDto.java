package com.cos.prologstart.web.dto.board;

import org.springframework.web.multipart.MultipartFile;

import com.cos.prologstart.domain.board.Board;
import com.cos.prologstart.domain.user.User;

import lombok.Data;

@Data
public class BoardUploadDto {
	private MultipartFile file;
	private String caption;
	
	
	public Board toEntity(String postBoardUrl, User user) {
		return Board.builder()
				.caption(caption)
				.postBoardUrl(postBoardUrl)
				.user(user)
				.build();
	}
}
