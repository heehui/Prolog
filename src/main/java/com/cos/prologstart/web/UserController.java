package com.cos.prologstart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import com.cos.prologstart.config.auth.PrincipalDetails;
import com.cos.prologstart.service.BoardService1;
import com.cos.prologstart.service.UserService;
import com.cos.prologstart.web.dto.user.UserProfileDto;

import lombok.RequiredArgsConstructor;



@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService userService;
	
	@Autowired
	private BoardService1 bs;
	
	@GetMapping("/{pageUserId}")					//데이터 들고가기
	public String profile(@PathVariable int pageUserId, Model model, @AuthenticationPrincipal PrincipalDetails principalDetails,
			 HttpServletRequest req,  HttpSession session) {
		UserProfileDto dto = userService.회원프로필(pageUserId, principalDetails.getUser().getId());


		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);

		model.addAttribute("menu", bs.goMypage(user_id)); //해당 user_id를 가진 게시글을 모두 조회

		model.addAttribute("dto", dto);
		return "profile";
	}
	
	@GetMapping("/{id}/update")			//이것을 사용하면 세션 알아서.
	public String update(@PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		//System.out.println("세션정보: "+principalDetails.getUser());
		
		
		return "update";
	}
	
	
	//추가
	
	@GetMapping("/noMember")	
	public String noMember() {
		
		return "index";
	}
	
	
	

}
