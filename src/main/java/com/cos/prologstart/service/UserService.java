 package com.cos.prologstart.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cos.prologstart.domain.subscribe.SubscribeRepository;
import com.cos.prologstart.domain.user.User;
import com.cos.prologstart.domain.user.UserRepository;
import com.cos.prologstart.handler.ex.CustomApiException;
import com.cos.prologstart.handler.ex.CustomException;
import com.cos.prologstart.web.dto.user.UserProfileDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class UserService {
	
	private final UserRepository userRepository;
	private final SubscribeRepository subscribeRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	//수정시에도 패스워드 암호화 되게 적용 
	
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Transactional
	public User 회원프로필사진변경(int principalId, MultipartFile profileImageFile) {
		UUID uuid = UUID.randomUUID();	//file 이름이 중복되지 않게 
		String boardFileName = uuid+"_"+profileImageFile.getOriginalFilename();
		System.out.println("파일 이름: "+ boardFileName);
		
		Path boardFilePath = Paths.get(uploadFolder+boardFileName);
		
		try {	//통신, I/O 예외가 발생할 수 있따
			Files.write(boardFilePath, profileImageFile.getBytes());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		User userEntity = userRepository.findById(principalId).orElseThrow(()->{
			return new CustomApiException("유저를 찾을 수 없습니다.");
		});
		
		userEntity.setProfileImageUrl(boardFileName);
		
		return userEntity;
	}
	
	@Transactional(readOnly=true)
	public UserProfileDto 회원프로필(int pageUserId, int principalId) {
		
		UserProfileDto dto = new UserProfileDto();
		
		//SELECT * FROM BOARD WHERE USERID = :userId;
		 
		User userEntity = userRepository.findById(pageUserId).orElseThrow(()->{
			return new CustomException("해당 프로필 페이지는 없는 페이지입니다.");
		});
		
		dto.setUser(userEntity);
		dto.setPageOwnerState(pageUserId==principalId);	
		dto.setBoardCount(userEntity.getBoards().size());
		
		int subscribeState = subscribeRepository.mSubscribeState(principalId, pageUserId);
		int subscribeCount = subscribeRepository.mSubscribeCount(pageUserId);
		
		dto.setSubscribeState(subscribeState == 1);
		dto.setSubscribeCount(subscribeCount);
		
		//좋아요 카운트 추가하기 
		userEntity.getBoards().forEach((board)->{
			board.setLikeCount(board.getLikes().size());
		});
		
		return dto;
	}
	
	@Transactional
	public User 회원수정(int id, User user) {
		
		//영속화
		User userEntity = userRepository.findById(id).get();
		
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		
		
		//영속화 오브젝트 수정 - 더티체킹 업데이트 
		userEntity.setName(user.getName());
		userEntity.setPassword(encPassword);
		userEntity.setBio(user.getBio());
		userEntity.setWebsite(user.getWebsite());
		userEntity.setPhone(user.getPhone());
		userEntity.setGender(user.getGender());
		
		
		
		return userEntity;
	}	//더티체킹 일어나서 업데이트 ok

}
