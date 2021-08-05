package com.cos.prologstart.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.cos.prologstart.config.oauth.OAuth2DetailsService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@EnableWebSecurity	//해당 파일로 시큐리티를 활성화
@Configuration //loC   
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	private final OAuth2DetailsService oAuth2DetailsService;
	
	@Bean
	public BCryptPasswordEncoder encode() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		//super.configure(http);
		//super 삭제 - 기존 시큐리티가 가지고 있는 기능이 다 비활성화됨.
		http.csrf().disable();
		http.authorizeRequests()
		.antMatchers("/", "/user/**", "/image/**", "/subscribe/**", "/comment/**", "/api/**").authenticated()
		.anyRequest().permitAll()
		.and()
		.formLogin()
		.loginPage("/auth/signin")	//GET
		.loginProcessingUrl("/auth/signin")	//POST -> 스프링 시큐리티가 로그인 프로세스 진행핮ㄴ다
		.defaultSuccessUrl("/")
		
		//Oauth2 로그인 
		.and()
		.oauth2Login()	//form 로그인도 하는데 oauth2로그인도 한다
		.userInfoEndpoint()	//oauth2로그인을 하면 최종응답을 회원정보로 바로 받을 수 있다. 
		.userService(oAuth2DetailsService);
		
		
	}

	

}
