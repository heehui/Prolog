package com.cos.prologstart.domain.board;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PrePersist;
import javax.persistence.Transient;

import com.cos.prologstart.domain.likes.Likes;
import com.cos.prologstart.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Board {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;   
	private String caption;
	private String postBoardUrl;	//사진을 전송받아 서버 특정 폴더에 저장 - DB에 그 저장된 경로를 insert할 예정 
	
	
	@JsonIgnoreProperties({"boards"})
	@JoinColumn(name="userId")
	@ManyToOne(fetch=FetchType.EAGER)		//Board랑 User 관계 N : 1
	private User user;	//누가 업로드 했는지 알아야하니까나 추가해주기.
	
	//좋아요, 댓글 
	
	
	@JsonIgnoreProperties({"board"})						
	@OneToMany(mappedBy = "board") 	//Likes의 board(변수이름)		//연관관계주인 x fk 만들지 x
	private List<Likes> likes;
	
	
	
	
	@Transient
	private boolean likeState;
	
	@Transient
	private int likeCount;
	
	
	private LocalDateTime createDate;
	
	
	@PrePersist		
	public void createDate() {
		this.createDate = LocalDateTime.now();
	}

	
	
	//오브젝트를 콘솔에 ㅈ출력할때 문제가 될 수 있어서 User 부분을 출력되지 않게 
	/*
	 * @Override public String toString() { return "Board [id=" + id + ", caption="
	 * + caption + ", postBoardUrl=" + postBoardUrl + ", createDate=" + createDate +
	 * "]"; }
	 */	
}
