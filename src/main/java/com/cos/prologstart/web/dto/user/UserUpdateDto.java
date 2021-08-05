package com.cos.prologstart.web.dto.user;

import javax.validation.constraints.NotBlank;

import com.cos.prologstart.domain.user.User;

import lombok.Data;


@Data
public class UserUpdateDto {

	@NotBlank
	private String name;	
	
	@NotBlank
	private String password;
	private String website;
	private String bio;
	private String phone;
	private String gender;
	
	public User toEntity() {
		return User.builder()
			.name(name)				//validation 체크
			.password(password)		//validation 체크
			.website(website)
			.bio(bio)
			.phone(phone)
			.gender(gender)
			.build();
	}
}
