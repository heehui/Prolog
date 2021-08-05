package com.cos.prologstart.handler.ex;

import java.util.Map;

public class CustomValidationException extends RuntimeException{
	
	//객체를 구분할 때 씀
	private static final long serialVersionUID = 1L;
	
	private Map<String, String> errorMap;
	
	
	public CustomValidationException(String message, Map<String, String> errorMap ) {	//생성자
		
		super(message);
		this.errorMap = errorMap;
	}
	
	
	public Map<String, String> getErrorMap(){
		return errorMap;
	}

}
