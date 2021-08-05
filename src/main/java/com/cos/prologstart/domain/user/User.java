package com.cos.prologstart.domain.user;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.cos.prologstart.domain.board.Board;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//JPA - Java Persistence API (자바로 데이터를 영구적으로 저장(DB)할 수 있는 API를 제공)


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity	//디비에 테이블 생성

public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	//번호증가전략이 데이터베이스를 따라간다.(디비에 따라 전략이 다름)
	private int id;   
	
	@Column(length=100, unique=true)
	private String username;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=false)
	private String name;
	
	private String website;		//웹사이트
	private String bio;			//자기소개
	
	@Column(nullable=false)
	private String email;
	
	private String phone;
	private String gender;
	
	private String profileImageUrl;	//사진
	private String role; 	//권한
	
	
	
	//양방향 매핑을 위해서 
	//나는 연관관계의 주인x -> 테이블에 컬럼 만들지 x
	//User Select할 때 해당  User id 로 등록된 board 들 다 가지고 온다.
	//Lazy = User 를 Select 할때 해당 user id로 등록된 board 들을 가져오지 x 대시 ㄴ getBoards() 함수가 호출될 때 가져온다
	//Eager = User 를 Select 할때 해당 user id 로 등록된 board들을 전부 Join 해서 가져온다
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)	
	@JsonIgnoreProperties({"user"})	//Board 안에 user 무시하고 파싱해준다
	private List<Board> boards;
	
	
	
	
	private LocalDateTime createDate;
	
	@PrePersist		//디비에 insert 되기 직전에 실행
	public void createDate() {
		this.createDate = LocalDateTime.now();
	}
}
