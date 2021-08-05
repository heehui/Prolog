package com.cos.prologstart.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cos.prologstart.domain.user.User;
import com.cos.prologstart.handler.ex.CustomValidationException;
import com.cos.prologstart.service.AuthService;
import com.cos.prologstart.web.dto.auth.SignupDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor	//final필드 DI할 때 사용
@Controller	//	1. IoC 2. 파일 리턴 하느느 컨트롤러
public class AuthController {
	
	
	private static final Logger log = LoggerFactory.getLogger(AuthController.class);
	
	private final AuthService authService;
	

	/*
	 * public AuthController(AuthService authService) {
	 * this.authService=authService; }
	 */
	
	@GetMapping(value="/logout")
	  public String logout(HttpServletRequest request, HttpServletResponse response) {
	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      if (auth != null && auth.isAuthenticated()) {
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	      }
	      return "redirect:/";
	  }
	
	
	@GetMapping("/auth/signin")
	public String signinForm() {
		return "auth/signin";
	}
	

	@GetMapping("/auth/signup")
	public String signupForm() {
		return "auth/signup";
	}
	
	@PostMapping("/auth/signup")
	public String signup(@Valid SignupDto signupDto,
						BindingResult bindingResult) {	//key=value(x-www-form-urlencoded)
		
		//log.info(signupDto.toString());
		
		if(bindingResult.hasErrors()) {
			Map<String,String>errorMap=new HashMap<>();
			
			for(FieldError error:bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());				
			}
			throw new CustomValidationException("유효성검사 실패", errorMap);
		}else {
			User user=signupDto.toEntity();
			User userEntity=authService.회원가입(user);
			
			System.out.println(userEntity);
			//log.info(user.toString());
			return "auth/signin";
		}
	}
}
