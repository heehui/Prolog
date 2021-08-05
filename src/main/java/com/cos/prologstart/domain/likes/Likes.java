package com.cos.prologstart.domain.likes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.cos.prologstart.domain.board.Board;
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
@Table(
	uniqueConstraints = {		//유니크 제약조건을 검 - 중복으로 되지 않게 
		@UniqueConstraint(
			name="likes_uk",	
			columnNames = {"boardId", "userId"}
		)
	}
 )
public class Likes {	//N
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;
	
	
	@JoinColumn(name ="boardId")
	@ManyToOne
	private Board board; //1
	
	
	
	@JsonIgnoreProperties({"boards"}) 
	@JoinColumn(name ="userId")
	@ManyToOne
	private User user;	//1
	
	
	
	
	
	private LocalDateTime createDate;
	
	@PrePersist		
	public void createDate() {
		this.createDate = LocalDateTime.now();
	}
}
