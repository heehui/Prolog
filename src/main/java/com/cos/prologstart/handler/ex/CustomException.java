package com.cos.prologstart.handler.ex;

public class CustomException extends RuntimeException{
	
	//객체를 구분할 때 씀
	private static final long serialVersionUID = 1L;
	
	
	
	public CustomException(String message) {	//생성자
		
		super(message);
	}
	

}
