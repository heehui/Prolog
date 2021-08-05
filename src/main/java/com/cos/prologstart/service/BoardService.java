package com.cos.prologstart.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.prologstart.config.auth.PrincipalDetails;
import com.cos.prologstart.domain.board.Board;
import com.cos.prologstart.domain.board.BoardRepository;
import com.cos.prologstart.web.dto.board.BoardUploadDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor 
@Service
public class BoardService {
	
	private final BoardRepository boardRepository;
	 
	
	@Transactional(readOnly = true)
	public List<Board>인기페이지(){
		return boardRepository.mPopular();
	}
	
	@Transactional(readOnly = true)	
	public Page<Board> 보드스토리(int principalId, Pageable pageable){
		Page<Board> boards = boardRepository.mStory(principalId, pageable);
		
		//boards 에 좋아요 담기 
		boards.forEach((board)->{
			
			board.setLikeCount(board.getLikes().size());
			
			board.getLikes().forEach((like)->{
				if(like.getUser().getId() == principalId) {	//해당 게시글에 좋아요 한 사람들을 찾아서 현재 로그인한 사람이 좋아요 한것인지 비교
					board.setLikeState(true);
				}
			});
		});
		
		
		return boards;
	}
	 
	
	@Value("${file.path}")
	private String uploadFolder;
	
	
	@Transactional	//
	public void 게시글업로드(BoardUploadDto boardUploadDto, PrincipalDetails principalDetails) {
		
		UUID uuid = UUID.randomUUID();	//file 이름이 중복되지 않게 
		String boardFileName = uuid+"_"+boardUploadDto.getFile().getOriginalFilename();
		System.out.println("파일 이름: "+ boardFileName);
		
		Path boardFilePath = Paths.get(uploadFolder+boardFileName);
		
		try {	//통신, I/O 예외가 발생할 수 있따
			Files.write(boardFilePath, boardUploadDto.getFile().getBytes());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		//테이블에 저장 하긱
												//UUID가 포함된 파일명
		Board board = boardUploadDto.toEntity(boardFileName, principalDetails.getUser()); 
		
		//Board boardEntity = 	
		boardRepository.save(board);
		
		
		//System.out.println(boardEntity.toString());
		
	}

}
