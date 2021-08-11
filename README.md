
### spring boot와 Mybatis, JPA, MariaDBfh 만든 '공유블로그 Prolog' 입니다.
#### 로그인 및 회원가입, 게시판, 댓글 기능, 관리자 기능이 포함되어있습니다.

---
- 초기시작 URL은 http://localhost:8900/auth/signin 입니다.

1. 테이블 Create 쿼리문

 - pro 권한 주기

```create user 'pro'@'%' identified by 'pro1234';
GRANT ALL PRIVILEGES ON *.* TO 'pro'@'%';
create database prolog
```


- 게시판 테이블
```
CREATE TABLE `boardtable2` (
	`user_id` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci', -- 로그인한 id
	`num` INT(10) NOT NULL AUTO_INCREMENT, -- 글번호
	`lang` VARCHAR(100) NOT NULL COLLATE 'utf8mb3_general_ci', -- 게시판 이름
	`title` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci', -- 게시글 제목
	`contents` VARCHAR(1000) NOT NULL COLLATE 'utf8mb3_general_ci', -- 게시글 내용
	`image` VARCHAR(200) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci', -- 첨부한 이미지
	`date1` TIMESTAMP NULL DEFAULT current_timestamp(), -- 날짜
	INDEX `num` (`num`) USING BTREE,
	INDEX `user_id` (`user_id`) USING BTREE
);
```


- 댓글 테이블
```
CREATE TABLE `replytable` ( 
	`num` INT(10) NOT NULL, -- 게시글 글번호
	`reply_num` INT(20) NOT NULL AUTO_INCREMENT, -- 댓글 번호
	`content` VARCHAR(1000) NOT NULL COLLATE 'utf8mb3_general_ci', -- 댓글 내용
	`writer` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci', -- 댓글 작성자
	`regdate` TIMESTAMP NULL DEFAULT current_timestamp(), -- 댓글 날짜
	PRIMARY KEY (`reply_num`) USING BTREE,
	INDEX `num` (`num`) USING BTREE,
	CONSTRAINT `FK_replytable_boardtable2` FOREIGN KEY (`num`) REFERENCES `prolog`.`boardtable2` (`num`) ON UPDATE NO ACTION ON DELETE CASCADE
);
```


2. application.yml 설정
- 포트번호 
```
server:
  port: 8900
  servlet:
    context-path: /
    encoding:
      charset: utf-8
      enabled: true
```
- jsp 적용
```
spring:
  mvc:
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp
```
- mariaDB 연결
```
datasource:
    driver-class-name: org.mariadb.jdbc.Driver
    url: jdbc:mariadb://localhost:3306/prolog?serverTimezone=Asia/Seoul
    username: pro
    password: pro1234
```

2. application.properties 설정
```
mybatis.mapper-locations=classpath:mapper/**/**.xml
```
3.mybatismapper.xml
```
<mapper namespace="com.cos.prologstart.dao.BoardDAO">
```
- 게시판 글쓰기 후 insert
```
    <insert id="addBoard" useGeneratedKeys="true" keyProperty="num"> //글번호는 쿼리에서 AUTO_INCREMENT로 자동 증가하게 함
		INSERT INTO   
	    	boardTable2
	   			(
	   				user_id,
	   				lang,
					  title,
					  contents,
				  	image
				)
	    	VALUES
	   		(
	   				#{user_id},
	   				#{lang},
	   				#{title},
	   				#{contents},
	   				#{image}	
				)
    </insert>
```
	<select id="getAllBoard" resultType="com.cos.prologstart.vo.BoardVO">
		SELECT
			user_id, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'

		FROM
			boardTable2
		ORDER BY num desc
	</select>
	
	
	<select id="getMenu" resultType="com.cos.prologstart.vo.BoardVO">
		SELECT
			 user_id, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'
		FROM
			boardTable2
		WHERE
			lang = #{lang}
	</select>
	
	
	 <select id="getBoardOne" resultType="com.cos.prologstart.vo.BoardVO">
		SELECT
			num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'
		FROM
			boardTable2
		WHERE
			num = #{num}
	</select>
	
	<update id="updateclear" parameterType="com.cos.prologstart.vo.BoardVO">
		UPDATE boardTable2
        SET 
        	lang = #{lang},
        	title = #{title},
        	image = #{image},
            contents = #{contents},
            date1 = NOW()
            
        WHERE num = #{num}

	</update>
	
	<delete id="deleteBoard" parameterType="com.cos.prologstart.vo.BoardVO">
		DELETE 
		FROM boardTable2
        WHERE num = #{num}
	</delete>
	
	<select id="goMypage" resultType="com.cos.prologstart.vo.BoardVO">
		SELECT
			user_id, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'
		FROM
			boardTable2
		WHERE
			user_id = #{user_id}
	</select>
	
	<select id="readReply" resultType="com.cos.prologstart.vo.ReplyVO">
		select 
			reply_num,
			content,
			writer,
			DATE_FORMAT(regDate, '%Y-%m-%d %T') as 'regDate'
		from replyTable   
		where num = #{num}
		
	</select>
	
	<insert id="writeReply">
		insert into 
		replyTable(num,content,writer)   
		VALUES(
	   				#{num},
	   				#{content},
	   				#{writer}	
				)
	</insert>
	
	<delete id="deleteReply" parameterType="com.cos.prologstart.vo.ReplyVO">
		DELETE 
		FROM replyTable
        WHERE reply_num = #{reply_num}
	</delete>
	
	<delete id="deleteAllReply" parameterType="com.cos.prologstart.vo.ReplyVO">
		DELETE 
		FROM replyTable
        WHERE num = #{num}
	</delete>
	
	 <update id="updateReply" parameterType="com.cos.prologstart.vo.ReplyVO">
		UPDATE replyTable
        SET 
        	content = #{content},
        	regDate = NOW()
       
        WHERE reply_num = #{reply_num}
	</update> 

	<select id="memberLogin" resultType="com.cos.prologstart.vo.LoginVO">
		select
			user_id,
			pw
		from loginTable11   
		where user_id = #{user_id}
		and pw = #{pw}
		
	</select>
	
<!-- 	<select id="getAllUser" resultType="com.cos.prologstart.vo.LoginVO">
		select 
			*
		from loginTable11   
	</select> -->
	
	<select id="getAllUser" resultType="com.cos.prologstart.domain.user.User">
		select 
		 	username,
	 		password,
	 		name,
	 		id,
	 		email,
			phone,
			gender,
			profileImageUrl,
			createDate,
			role
		
		from  user   
	</select>
	
	<delete id="deleteMember" parameterType="com.cos.prologstart.domain.user.User">
		DELETE 
		FROM user 
        WHERE username = #{username}
	</delete>
	
</mapper>

