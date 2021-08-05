package com.cos.prologstart.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;


//annotation 없어도 JpaRepository를 상속하면 IoC 등록ㅇㅣ 자동으로 된닫
public interface UserRepository extends JpaRepository<User, Integer>{
	//JPA query method 사용 
	User findByUsername(String username);
}
