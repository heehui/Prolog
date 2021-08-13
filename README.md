
### spring boot와 Mybatis, JPA, MariaDB로 만든 '공유블로그 Prolog' 입니다. (수정중 입니다!!)
#### 로그인 및 회원가입, 게시판, 댓글 기능, 관리자 기능이 포함되어있습니다.
###### - 제가 맡은 게시판, 댓글, 관리자 기능 파트에 대해 작성했습니다. 
---
1. 프로젝트 개요 
###### - 공통 관심사를 가진 사람들이 모여 정보를 나누는 것이 보편화된 시대에 맞게 프로그래밍에 관심을 가진 사람들이 모여 정보를 공유할 수 있는 공간이다.
###### - 회원 가입을 한 후 로그인을 통해 카테고리 별 게시물을 작성할 수 있다. 
###### - 다른 회원들의 게시물도 공유할 수 있으며, 댓글을 통해 서로 간의 소통도 가능한 블로그이다.
###### - 관리자 모드로 로그인하면 공지사항 작성, 게시판 관리 등의 권한을 가지게 되며, 원활한 운영을 할 수 있다

#

2. 프로젝트 개발의 목적
- ###### Spring boot와 HTML, CSS, JSP 등을 사용하여 시스템을 개발하고, DB연동을 활용한다.
- ###### 커뮤니티 블로그를 구현하여 프로그래밍이라는 분야에 관심을 가진 사람들이 모여 정보를 공유할 수 있도록 한다. 
- ###### 프로그래밍 언어 별로 카테고리를 나눠 게시 글을 작성, 댓글 작성 등을 통해 회원 간의 소통이 가능하도록 한다.

#

3. 프로젝트 상세 내용
 ###### 1) 로그인/회원 가입
- ###### 로그인: 가입 시 입력한 USERNAME 과 PASSWORD 입력하여 로그인이 가능하다.
- ###### 페이스북 로그인 : 페이스북의 정보를 입력하여 페이스북 정보로 로그인이 가능하다.
- ###### 회원 가입 : USERNAME, PASSWORD, NAME, EMAIL 등 회원 정보를 입력하여 회원 가입이 가능하다.

 ###### 2) 메인 페이지
- ###### header: 우측의 세 개 아이콘을 클릭 시 [HOME], [BOARD], [PROFILE] 페이지로 이동이 가능하다.
- ###### body : 전체 게시판으로 이동 할 수 있는 메뉴가 있다.
- ###### footer

###### 3) 프로필 페이지
- ###### 유저가 지정해 놓은 프로필 이미지가 나타난다.
- ###### USERNAME과 본인 소개 글이 보인다.
- ###### 프로필 페이지의 유저가 작성한 글들이 나타난다.
- ###### 작성 글을 클릭하면 게시 글의 내용을 확인 할 수 있다.
- ###### 본인의 프로필 페이지에서는 글 작성 버튼과 회원 정보를 수정, 로그아웃을 위한 톱니바퀴 버튼이 보인다.

###### 4) 회원 정보 수정
- ###### 가입 시 기입한 USERNAME은 변경할 수 없다.
- ###### 회원 정보 수정 시 비밀번호는 반드시 입력해야 한다.
- ###### 수정 된 정보는 프로필 페이지에 반영된다.

###### 5) 게시판
- ###### 언어 별로 카테고리가 구분되어 있다.
- ###### 카테고리 별로 작성 된 게시물을 볼 수 있다.
- ###### 게시물을 클릭하면 작성 된 내용을 확인할 수 있고, 댓글 작성이 가능하다.

###### 6) 관리자 모드
- ###### 관리자 모드로 로그인을 하면 공지사항을 작성 할 수 있다.
- ###### 회원 탈퇴 등의 회원 관리가 가능하다.

#

##### - 초기시작 URL은 http://localhost:8900/auth/signin 입니다.

#

![1조_발표동영상_Trim](https://user-images.githubusercontent.com/78891624/129296817-5ca25c2e-6e71-43b6-ac79-b18ffe2ade79.gif)

4. 프로젝트 설명

###### 4.1 DB 쿼리문
- pro 권한 부여
- 게시판 테이블(boardTable2)
- 댓글 테이블(replyTable)

###### 4.2 환경설정
- pom.xml
- application.yml(포트번호, jsp적용, MariaDB 연동)
- application.properties (mybatisMapper.xml과 DAO 연결)

###### 4.3 게시판 기능
- 게시물 작성 및 등록
- 게시물 조회
- 게시물 수정
- 게시물 삭제
- 마이페이지

###### 4.4 댓글 기능
- 댓글 작성
- 댓글 조회
- 댓글 수정
- 댓글 삭제

###### 4.5 관리자 기능
- 전체 회원 정보 조회
- 회원 강제 탈퇴
- 공지사항 작성
- 모든 게시물, 댓글 접근 권한(수정, 삭제 권한)

#


4.1 DB 테이블 쿼리문

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
	`hit` INT(11) NULL DEFAULT '0', -- 조회수
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

4.2 환경설정
1) pom.xml
- JSP 
```
<dependency> <!-- tomcat-embed-jasper 가 있어야 JSP가 컴파일됨 -->
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
</dependency>		
```
- JSTL
```
<!--  JSTL -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
</dependency>
```
-  JDBC 
```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```		
- Lombok
```
<dependency>
	<groupId>org.projectlombok</groupId>
	<artifactId>lombok</artifactId>
	<optional>true</optional>
</dependency>
```
-  Mybatis
```
<dependency>
	<groupId>org.mybatis.spring.boot</groupId>
	<artifactId>mybatis-spring-boot-starter</artifactId>
	<version>2.2.0</version>
</dependency>
```		
- devtools
```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-devtools</artifactId>
	<scope>runtime</scope>
	<optional>true</optional>
</dependency>
```
- mariaDB 
```
<dependency>
	<groupId>org.mariadb.jdbc</groupId>
	<artifactId>mariadb-java-client</artifactId>
	<scope>runtime</scope>
</dependency>
```

2) application.yml(포트번호, jsp 적용, mariaDB 연동)
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
- mariaDB 연동
```
datasource:
    driver-class-name: org.mariadb.jdbc.Driver
    url: jdbc:mariadb://localhost:3306/prolog?serverTimezone=Asia/Seoul
    username: pro
    password: pro1234
```

3) application.properties
```
mybatis.mapper-locations=classpath:mapper/**/**.xml
```


4.3 게시판 기능

- BoardVO.java

```
@Data
public class BoardVO {
	
	private String user_id; //아이디
	private int num; //글번호
	private String lang; //게시판 카테고리
	private String title; //제목
	private String contents; //내용
	private String image; //이미지
	private String date1; //작성일
}
```

4.3.1 게시물 작성 및 등록
1) BoardDAO.java
```
@Mapper 
public interface BoardDAO { 
	
	public boolean addBoard(BoardVO bvo);
```	
2) BoardService1.java
```
@Service
public class BoardService1 {
	
	@Autowired 
	private BoardDAO bdao; //DAO객체를 한번에 받아서
	
	
	public boolean addBoard(BoardVO bvo) {
		return bdao.addBoard(bvo);
	}
```
3) BoardController1.java
```
@Controller
public class BoardController1 {
	
	@Autowired
	private BoardService1 bs;
	
@GetMapping("/write") //글작성 버튼을 누르면 이곳으로 이동
	public String write() {
		return "write"; 
	}
```
```
@PostMapping("/writeAfter")  //글 작성 후 '발행'을 누르면 이곳으로 이동
	public String writeAction(
			HttpServletRequest req,
			HttpSession session,
			@RequestParam("file") MultipartFile file, //이미지파일
			@RequestParam("lang") String lang, //게시판 카테고리명
			@RequestParam("title")String title, //글 제목
			@RequestParam("user_num")int user_num, //회원번호
				Model model1) throws IllegalStateException, IOException {

		
		 String contents = req.getParameter("contents"); //글 내용
		 contents = contents.replace("\r\n", "<br>"); //db에 저장할 때, 개행부분을 <br>태그로 변경해준 후 저장
		
		
		String user_id=req.getParameter("user_id"); //회원 아이디
		session.setAttribute("user_id", user_id);
	
		String path = "C:/workspace/springbootwork/upload/"; //이미지가 저장될 외부 경로 지정
		
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path + file.getOriginalFilename()));
			}
		
		bs.addBoard(new BoardVO(user_id,user_num,0,lang, title, contents, file.getOriginalFilename())); //게시물이 등록됨
		return "board/mainBoard"; //전체게시판으로 이동
	}
```	
4) write.jsp
- 게시판 카테고리명, 제목, 이미지, 내용, 회원번호, 회원아이디를 form을 통해 writerAfter Controller로 보냄
```	    
	    <form action="writeAfter" method = "post" enctype="multipart/form-data">
	        	<div class="form-group">
				  <select name="lang">
				  <option value="java">java</option>
				  <option value="javascript">javascript</option>
				  <option value="spring">spring</option>
				  <option value="html">html</option>
				  </select>
			</div>
			<div class="form-group">
				 <label for="usr">제목:</label>
				 <input type="text" class="form-control" id="title" name = "title">
			</div>
			<div class="form-group">
		   
			      <input type="file" class="form-control-file border" id="img" name="file" multiple="multiple"><br>
			    
			</div>
			    <div class="form-group">
				  <label for="comment">내용:</label>
				  <textarea class="caption" required="required" name="contents" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
			    </div>
				<input type="hidden" name="user_id" value="${principal.user.username}">
				<input type="hidden" name="user_num" value="${principal.user.id}">
			    <button type="submit" class="btn btn-info">발행</button>
		</form>
```
4.3.2 게시물 조회
1) BoardDAO.java
```
	public List<BoardVO> getAllBoard();
```
2) BoardService.java
```	
	public List<BoardVO> getAllBoard(){
		return bdao.getAllBoard();
	}
```	
3) BoardController1.java
```
@GetMapping("/boardList")
@ResponseBody public List<BoardVO> boardList(){ 
 	return bs.getAllBoard(); //전체 게시판 모두 조회 

}
```
4) detailView.jsp
5) board/mainBoard.jsp
- ajax를 이용하여 boardList를 받아 게시판 전체 조회 후 섬네일로 표시된 게시물을 클릭하면 다음과 같은 글 정보들이 /detailView 로 넘어감	
```
<script>

$(document).ready(function() {
    $.ajax({
    	
    	url: "boardList", 
    	success: function(result){         
        var html = "<div id='grid' >";
       
       result.forEach(function(item){
    
    	   html+= "<div class='image1'><a href = 'detailView?contents=" + item.contents + 
        				'&image=' + item.image + 
        				'&title=' + item.title +
        				'&user_id=${principal.user.username}' +
        				'&writer=' + item.user_id +
        				'&user_num=' + item.user_num +
        				'&num=' + item.num +
        				'&reply_cnt=' + item.reply_cnt +
        				'&hit=' + item.hit +
        				'&date1=' + item.date1 +
        				'&lang=' + item.lang + "'>" + "<img id='hov1' src='/upload/" + item.image + "' width='200'  height='200'></a><h6 id='date1'>작성일: " + item.date1 
        						+ '<br><img src="../images/click.png">' + item.hit + ' 댓글수:' + item.reply_cnt + "</h6></div>";
       })    
       $("#listArea").append(html);
     }});
} ); 

</script>
</head>
<body>
			
					<tbody id="listArea" style="width: 50%">
					</tbody>
```					
6) board/html.jsp (java,javascript, spring 게시판도 동일)

4.3.3 게시물 수정
1) BoardDAO.java
2) BoardService.java
3) BoardController1.java
4) updateView.jsp
5) view.jsp

4.3.4 게시물 삭제
1) BoardDAO.java
2) BoardService.java
3) BoardController1.java

4.3.5 마이페이지
1) BoardDAO.java
2) BoardService.java
3) BoardController1.java 
4) mypage.jsp


4.4 댓글 기능
- ReplyVO.java
```
@Data
public class ReplyVO {
	private int num; //게시글 번호
	private int reply_num; //댓글 번호
	private String content; //댓글 내용
	private String writer; //작성자
	private String regDate; //작성일	
}
```

4.4.1 댓글 작성
1) BoardDAO.java
2) BoardService.java
3) BoardController1.java
4) write.jsp
4.4.2 댓글 조회
4.4.3 댓글 수정
4.4.4 댓글 삭제

4.5 관리자 기능
4.5.1 전체 회원 정보 조회
4.5.2  회원 강제 탈퇴
4.5.3  공지사항 작성
4.5.4  모든 게시물, 댓글 접근 권한(수정, 삭제 권한)


4) mybatismapper.xml
- 게시판 글쓰기 후 insert
```
<mapper namespace="com.cos.prologstart.dao.BoardDAO">
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
- 모든 게시물 조회
```
<select id="getAllBoard" resultType="com.cos.prologstart.vo.BoardVO"> <!-- 매핑하려는 자바 클래스의 전체 경로(BoardVO)를 입력-->
	SELECT
		user_id, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1' <!-- 날짜를 2021-08-04 19:49:58 형태로 -->
	FROM
		boardTable2
	ORDER BY num desc
</select>
```	
- 각 카테고리별 게시판에 게시물 조회
```
<select id="getMenu" resultType="com.cos.prologstart.vo.BoardVO">
	SELECT
		 user_id, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'
	FROM
		boardTable2
	WHERE
		lang = #{lang} <!-- lang은 게시판 카테고리명 -->
</select>
```
- 게시물 상세내용 보여주기
```
 <select id="getBoardOne" resultType="com.cos.prologstart.vo.BoardVO"> 
	SELECT
		num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'
	FROM
		boardTable2
	WHERE
		num = #{num}
</select>
```
- 게시글 수정
```
<update id="updateclear" parameterType="com.cos.prologstart.vo.BoardVO">
	UPDATE boardTable2
        SET 
        	lang = #{lang},
        	title = #{title},
        	image = #{image},
            	contents = #{contents},
            	date1 = NOW()
	WHERE 
		num = #{num}
</update>
```
- 게시글 삭제
```
<delete id="deleteBoard" parameterType="com.cos.prologstart.vo.BoardVO">
	DELETE 
	FROM 
		boardTable2
        WHERE 
		num = #{num} <!-- 글번호를 불러와 삭제 -->
</delete>
```
- 마이페이지에서 내가쓴 글 보여주기
```
<select id="goMypage" resultType="com.cos.prologstart.vo.BoardVO">
	SELECT
		user_id, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1'
	FROM
		boardTable2
	WHERE
		user_id = #{user_id} <!-- 로그인한 id로 조회 -->
	</select>
```
- 댓글 작성
```
<insert id="writeReply">
	INSERT INTO
		replyTable(num,content,writer)   
	VALUES(
	   		#{num},
	   		#{content},
	   		#{writer}	
		)
</insert>
```
- 댓글 조회
```
<select id="readReply" resultType="com.cos.prologstart.vo.ReplyVO">
	SELECT 
		reply_num,
		content,
		writer,
		DATE_FORMAT(regDate, '%Y-%m-%d %T') as 'regDate'
	FROM 
		replyTable   
	WHERE 
		num = #{num}
</select>
```	
- 댓글 수정
```
<update id="updateReply" parameterType="com.cos.prologstart.vo.ReplyVO">
	UPDATE replyTable
        SET 
        	content = #{content},
        	regDate = NOW()
       
        WHERE 
		reply_num = #{reply_num}
</update>
```
- 댓글 삭제	
```	
<delete id="deleteReply" parameterType="com.cos.prologstart.vo.ReplyVO">
	DELETE 
	FROM 
		replyTable
        
	WHERE 
		reply_num = #{reply_num}
</delete>
```
- 모든 댓글 삭제(관리자 권한)
```
<delete id="deleteAllReply" parameterType="com.cos.prologstart.vo.ReplyVO">
	DELETE 
	FROM 
		replyTable
        WHERE 
		num = #{num}
</delete>
```	
	 
- 회원 정보 조회(관리자 권한)	
```	
<select id="getAllUser" resultType="com.cos.prologstart.domain.user.User">
	SELECT 
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
		
	FROM
		user   
</select>
```
- 회원 강제 탈퇴(관리자 권한)
```
<delete id="deleteMember" parameterType="com.cos.prologstart.domain.user.User">
	DELETE 
	FROM 
		user 
        WHERE 
		username = #{username}
</delete>	
</mapper>
```
4. VO (lombok 이용)

(1) BoardVO 
```
@Data
public class BoardVO {
	
	private String user_id; //아이디
	private int num; //글번호
	private String lang; //게시판 카테고리
	private String title; //제목
	private String contents; //내용
	private String image; //이미지
	private String date1; //작성일
	
	public BoardVO() {} 
	
	public BoardVO(String user_id,int num, String lang, String title,String contents,String image) {
		this.user_id =user_id; 
		this.num =num;
		this.lang =lang;
		this.title =title;
		this.contents =contents;
		this.image =image;
		
	}
}
```
(2) ReplyVO 


5. BoardDAO
```
@Mapper //
public interface BoardDAO { 
	
	public boolean addBoard(BoardVO bvo); //게시물 등록 시 추가
	public List<BoardVO> getAllBoard();//모든 게시물 조회
	public BoardVO getBoardOne(int num); //글번호로 해당 게시물 조회
	public List<BoardVO> getMenu(String lang); //카테고리명으로 게시물 조회
	public int updateclear(int num,String lang,String title,String image, String contents);//게시물 수정
	public int deleteBoard(int num); //게시물 삭제
	public List<BoardVO> goMypage(String user_id); //마이페이지

	public List<ReplyVO> readReply(int num)throws Exception; //댓글 조회
	public boolean writeReply(int num, String writer,String content)throws Exception; //댓글 작성
	public int updateReply(int reply_num, String content)throws Exception; //댓글 수정
	public int deleteReply(int reply_num)throws Exception; //댓글 삭제
	public int deleteAllReply(int num)throws Exception; //모든 댓글 삭제(관리자 권한)
	public ArrayList<UserUpdateDto> getAllUser(); //모든 회원정보 조회(관리자 권한)
	public int deleteMember(String user_id); //회원 강제 탈퇴(관리자 권한)

}
```

6. BoardService
```
@Service // 
public class BoardService1 {
	
	@Autowired 
	private BoardDAO bdao;
	
	
	public boolean addBoard(BoardVO bvo) { //게시물 등록 시 추가
		return bdao.addBoard(bvo);
	}

	public List<BoardVO> getAllBoard(){ //모든 게시물 조회
		return bdao.getAllBoard();
	}
	
	
	public BoardVO getBoardOne(int num){ //게시물 상세페이지
		return bdao.getBoardOne(num);
	}
	
	public int updateclear(int num, String lang,String title,String image, String contents) { //게시물 수정
		return bdao.updateclear(num, lang, title, image,contents);
	}
	
	public List<BoardVO> getMenu(String lang){ //카테고리명별 게시물 조회
		return bdao.getMenu(lang);
	}

	
	public int deleteBoard(int num) {//게시물 삭제
		return bdao.deleteBoard(num);
	}
	
	public List<BoardVO> goMypage(String user_id){ //마이페이지
		return bdao.goMypage(user_id);
	}
	
	public List<ReplyVO> readReply(int num)throws Exception{ //댓글 조회
		return bdao.readReply(num);
	}
	
	public boolean writeReply(int num,String writer,String content)throws Exception{ //댓글 작성
		return bdao.writeReply(num, writer,content);
	}
	
	public int updateReply(int reply_num, String content)throws Exception{ //댓글 수정
		return bdao.updateReply(reply_num, content);
	}
	
	public int deleteReply(int reply_num)throws Exception{ //댓글 삭제
		return bdao.deleteReply(reply_num);
	}
	
	public int deleteAllReply(int num)throws Exception{ //모든 댓글 삭제
		return bdao.deleteAllReply(num);
	}
	
	
	public ArrayList<UserUpdateDto> getAllUser(){ //모든 회원정보 조회(관리자권한)
		return bdao.getAllUser();
	}
	
	
	public int deleteMember(String user_id) {//회원 강제 탈퇴(관리자권한)
		return bdao.deleteMember(user_id);
	}
	
}
```

7. BoardController1
```

@Controller
public class BoardController1 {
	
	@Autowired
	private BoardService1 bs;
			

	@GetMapping("/admin_index")
		public String index() {
			return "admin/admin_index";
		}

	 
		@GetMapping("adminMain")
		public String adminMain() {
			return "admin/admin_index";
	}
		 

	@GetMapping("/board")
	public String board2() {
		
		return "board/mainBoard";
	}
	
	
	@GetMapping("/write")
	public String write() {
		return "write3"; //css 수정한 글쓰기 화면
	}
	
	
	@GetMapping("/adminWrite") //공지사항(notice)도 작성할 수 있도록 한 글쓰기 화면
	public String adminWrite() {
		return "admin/adminWrite";
	}
	
	@GetMapping("/loginboardView") //게시글 상세보기를 누르면 보이는 화면
	public String loginview(
			HttpServletRequest req, HttpSession session,
			 		   @RequestParam("num")int num,
					   @RequestParam("title")String title,
					   @RequestParam("image")String image,
					   @RequestParam("lang")String lang,
					//  @RequestParam("reply_num")int reply_num,
					   @RequestParam("writer")String writer,
					   @RequestParam("date1")String date1,
			/* @RequestParam("contents")String contents, */
					   Model model1) throws Exception{
		
		 String contents = req.getParameter("contents"); 
		 contents = contents.replace("<br>", "\r\n");
		
		model1.addAttribute("num", num);
		model1.addAttribute("title", title);
		model1.addAttribute("image", image);
		model1.addAttribute("lang", lang);
		model1.addAttribute("contents", contents);
		model1.addAttribute("date1", date1);
		model1.addAttribute("writer", writer);

		String user_id =req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		List<ReplyVO> reList = bs.readReply(num);//댓글이 보이도록
		model1.addAttribute("reList", reList);//List로 넘김
		
		return "loginboardView"; 
	}
	
	
	@GetMapping("/view") // /view는 수정기능 X 화면
	public String view(
					   @RequestParam("num")int num,
					   @RequestParam("title")String title,
					   @RequestParam("image")String image,
					   @RequestParam("lang")String lang,
					   @RequestParam("writer")String writer,
					   @RequestParam("contents")String contents,Model model1) throws Exception {
		model1.addAttribute("num", num);
		model1.addAttribute("title", title);
		model1.addAttribute("image", image);
		model1.addAttribute("lang", lang);
		model1.addAttribute("contents", contents);
		model1.addAttribute("writer", writer);
		
		List<ReplyVO> reList = bs.readReply(num);
		model1.addAttribute("reList", reList);
		
		return "view"; 
	}
	
	@PostMapping("/writeAfter") //게시판에서 글쓰고 '발행'누르면 여기로 온다.
	public String writeAction(
			HttpServletRequest req,
			HttpSession session,
			@RequestParam("file") MultipartFile file,
			@RequestParam("lang") String lang,
			@RequestParam("title")String title, 
				Model model1) throws IllegalStateException, IOException {

		
		 String contents = req.getParameter("contents"); 
		 contents = contents.replace("\r\n", "<br>");
		
		
		String user_id=req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
	
		String path = "C:/workspace/springbootwork/upload/"; //이미지가 저장될 외부 경로 지정
		
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path + file.getOriginalFilename()));
			}
		
		bs.addBoard(new BoardVO(user_id,0,lang, title, contents, file.getOriginalFilename())); //게시글 insert됨
		return "board/mainBoard";
	}
	
	 @GetMapping("/boardList")
	 @ResponseBody public List<BoardVO> boardList(){ 
		  	return bs.getAllBoard(); //전체 게시판 모두 조회 
	}
	 
	 @GetMapping("/userList")//관리자 화면에서 회원강제탈퇴를 누르면
	 public String userList(Model model1) {
		 model1.addAttribute("getAllUser", bs.getAllUser()); //전체 회원정보를 보여줌
		 return "admin/userList";
	 }
	
	 
	 @GetMapping("/deleteMember")//회원강제탈퇴
		public String deleteMember(
								@RequestParam("username")String username,
								Model model1) throws Exception {
	
			 bs.deleteMember(username);

				return "redirect:/userList"; //회원 전체 보여주는 userList 컨트롤러로 이동
			
		}
		

	@GetMapping("/java") //java 게시판
	public String java(@RequestParam("lang")String lang,
						HttpServletRequest req, 
						HttpSession session,
						Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
			model1.addAttribute("menu", bs.getMenu(lang)); //lang이 java인 모든 게시글을 조회
		
		return "board/java";

	}
	@GetMapping("/javascript")//
	public String script(@RequestParam("lang")String lang,
						HttpServletRequest req, 
						HttpSession session,
						Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		
		return "board/javascript";

	}
	@GetMapping("/spring")//
	public String spring(@RequestParam("lang")String lang,
						 HttpServletRequest req, 
						 HttpSession session,
						 Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		return "board/spring";

	}
	@GetMapping("/html")//
	public String html(@RequestParam("lang")String lang,
					   HttpServletRequest req, 
					   HttpSession session,
					   Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		
		return "board/html";

	}
	
	
	@GetMapping("/notice")
	public String notice(@RequestParam("lang")String lang,
					   HttpServletRequest req, 
					   HttpSession session,
					   Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		
		return "board/notice";

	}
	
	
	  @GetMapping("/updateForm") //게시글 수정버튼을 누르면
	  public String updateForm( @RequestParam("num")int num,
			  					@RequestParam("title")String title,
			  					@RequestParam("image")String image,
			  					@RequestParam("lang")String lang,
			  					@RequestParam("writer")String writer,
			  					@RequestParam("contents")String contents,
			  					@RequestParam("date1")String date1,
			  					Model model1) {
		  
		  
		  
		  model1.addAttribute("num", num);
		  model1.addAttribute("title", title);
		  model1.addAttribute("image", image);
		  model1.addAttribute("lang", lang);
		  model1.addAttribute("writer", writer);
		  model1.addAttribute("contents", contents);
		  model1.addAttribute("date1", date1);
		  
		  return "updateView"; //게시글 수정화면
		
	  }
	  
	  
	  @GetMapping("/updateclear")//수정완료가 되면
	  public String updateclear( 
			  					@RequestParam("num")int num,
			  					@RequestParam("title")String title,
			  					@RequestParam("image")String image,
								@RequestParam("lang")String lang,
								@RequestParam("writer")String writer,
								/*@RequestParam("contents")String contents*/
								HttpServletRequest req,
								Model model1) throws Exception {
		 
		  model1.addAttribute("num", num);
		  model1.addAttribute("title", title);
		  model1.addAttribute("lang", lang);
		  model1.addAttribute("image", image);
		  model1.addAttribute("writer", writer);
		 
		  String contents = req.getParameter("contents"); 
		contents = contents.replace("\r\n", "<br>");
		
		bs.updateclear(num,lang,title,image,contents);
		
		model1.addAttribute("menu", bs.getBoardOne(num));
		
		  contents = contents.replace("<br>", "\r\n");
		
		 model1.addAttribute("contents", contents);
		  
		  List<ReplyVO> reList = bs.readReply(num);
		  model1.addAttribute("reList", reList);
			
		  return "view"; //이 화면에서 수정된 화면을 바로 보여줌
	  }
	  @GetMapping("/delete")//게시글 삭제
	  public String delete(@RequestParam("num")int num) throws Exception {
		  bs.deleteBoard(num); //글번호로 게시글 삭제
		  bs.deleteAllReply(num); //삭제한 게시글에 있는 댓글도 삭제
		  return "board/mainBoard";
	  }
	  
	  
	  @GetMapping("/mypage") //user_id 받아서 마이페이지 버튼 누르면 이곳으로 이동
		public String mypage(
							 Model model1,
							 HttpServletRequest req, 
							 HttpSession session) {
		  
		  String user_id = req.getParameter("user_id");
		  session.setAttribute("user_id", user_id);
		  
			model1.addAttribute("menu", bs.goMypage(user_id)); //해당 user_id를 가진 게시글을 모두 조회
		
			return "mypage";

		}
	  
	  
		@GetMapping("/writeReply") //댓글 작성
		public String replyWrite(
								@RequestParam("num")int num,
								@RequestParam("writer")String writer,
								@RequestParam("content")String content,
								Model model1) throws Exception {
	
				bs.writeReply(num,writer,content); //댓글번호, 작성자, 댓글내용 insert
				
				return "board/mainBoard";
			
		}
		
		@GetMapping("/deleteReply")//댓글 삭제
		public String deleteReply(
								@RequestParam("reply_num")int reply_num,
								Model model1) throws Exception {
	
				bs.deleteReply(reply_num);//해당 댓글 번호를 가져와서 댓글 삭제
			
				return "board/mainBoard";
			
		}
		
		@GetMapping("/updateReply")//댓글 수정
		public String updateReply(
								@RequestParam("reply_num")int reply_num,
								@RequestParam("content")String content,
								Model model1) throws Exception {
	
				bs.updateReply(reply_num, content); //댓글 내용 수정
			
				return "board/mainBoard";
			
		}
		
		

}
```

