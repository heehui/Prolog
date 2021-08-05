package com.cos.prologstart.web.dto.user;

import com.cos.prologstart.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@AllArgsConstructor	//전체 생성자
@NoArgsConstructor	//빈 생성자
@Data
public class UserProfileDto {
	private boolean PageOwnerState;
	private int boardCount;
	private boolean subscribeState;
	private int subscribeCount;
	private User user;

}
