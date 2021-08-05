package com.cos.prologstart.handler;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.cos.prologstart.handler.ex.CustomApiException;
import com.cos.prologstart.handler.ex.CustomException;
import com.cos.prologstart.handler.ex.CustomValidationApiException;
import com.cos.prologstart.handler.ex.CustomValidationException;
import com.cos.prologstart.util.Script;
import com.cos.prologstart.web.dto.CMRespDto;

@RestController
@ControllerAdvice
public class ControllerExceptionHandler {
	
	@ExceptionHandler(CustomValidationException.class)	//RuntimeException이 발동하는 모든 Exception을 validationException 함수가  가로챈다
	public String validationException(CustomValidationException e) {
		//CMRespDto , Script 비교
		//1. 클라이언트에게 응답 - Script 가 좋음
		//2. Ajax Android 통신 - CMRespDto 가 좋음
		
		if(e.getErrorMap()==null) {
			return Script.back(e.getMessage());
		}else {
			return Script.back(e.getErrorMap().toString());
		}
	}
	
	
	//
	@ExceptionHandler(CustomException.class)	
	public String exception(CustomException e) {
		return Script.back(e.getMessage());
	}
	
	
	
	
	@ExceptionHandler(CustomValidationApiException.class)	
	public ResponseEntity<?> validationApiException(CustomValidationApiException e) {
			
		
		return new ResponseEntity<>(new CMRespDto<>(-1, e.getMessage(), e.getErrorMap()), HttpStatus.BAD_REQUEST );

		
		
	//public CMRespDto<?> validationApiException(CustomValidationApiException e) {	
		
		//return new CMRespDto<>(-1, e.getMessage(), e.getErrorMap());
		
		
	}
	
	@ExceptionHandler(CustomApiException.class)	
	public ResponseEntity<?> apiException(CustomApiException e) {
			
		
		return new ResponseEntity<>(new CMRespDto<>(-1, e.getMessage(), null), HttpStatus.BAD_REQUEST );
	}
}
