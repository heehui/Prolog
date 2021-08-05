package com.cos.prologstart.domain.likes;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface LikesRepository extends JpaRepository<Likes, Integer> {
	
	@Modifying
	@Query(value = "INSERT INTO likes(boardId, userId, createDate) VALUES(:boardId, :principalId, now())", nativeQuery = true)
	int mLikes(int boardId, int principalId);
	
	
	@Modifying
	@Query(value = "DELETE FROM likes WHERE boardId = :boardId AND userId = :principalId", nativeQuery = true)
	int mUnLikes(int boardId, int principalId);

}
