package com.cos.prologstart.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.cos.prologstart.domain.user.User;

import lombok.Data;


@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

	
	private static final long serialVersionUID = 1L;
	
	private User user;
	private Map<String, Object> attributes;	////OAuth 
	
	public PrincipalDetails(User user) {	//생성자
		this.user=user;
		
	}
	
	public PrincipalDetails(User user, Map<String, Object> attributes) {	//OAuth 
		this.user=user;
		
	}
	
	
	//권한 
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {	//권한
		
		Collection<GrantedAuthority> collector = new ArrayList<>();
		collector.add(() -> {return user.getRole();});	// 람다식으로 표기 
		return collector;
	}

	@Override
	public String getPassword() {
		
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {	//니 계정이 만료되었니? //false 일경우 로그인 x
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {	//니 계정이 잠겼니?
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {	// 니 비번 만료되었니?
		return true;
	}

	@Override
	public boolean isEnabled() {	// 니 계정이 활성화 되었니?
		return true;
	}


	
	
	@Override
	public Map<String, Object> getAttributes() {
		
		return attributes;	//{id:239857298357, name:최희도, email:minchoter@gmail.com}
	}


	@Override
	public String getName() {
		
		return (String) attributes.get("name");
	}

}
