package com.cos.prologstart.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.prologstart.domain.likes.LikesRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class LikesService {
	private final LikesRepository likesRepository;
	
	
	@Transactional
	public void 좋아요(int boardId, int principalId) {
		likesRepository.mLikes(boardId, principalId);
	}

	
	@Transactional
	public void 좋아요취소(int boardId, int principalId) {
		likesRepository.mUnLikes(boardId, principalId);
	}
}
