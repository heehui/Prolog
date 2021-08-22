
# Spring boot와 Mybatis, JPA, MariaDB로 만든 '공유블로그 Prolog'
#### - 제가 맡은 게시판, 댓글, 관리자 기능 파트를 위주로 작성했습니다. 
---
## 1. 프로젝트 개요 
- 공통 관심사를 가진 사람들이 모여 정보를 나누는 것이 보편화된 시대에 맞게 프로그래밍에 관심을 가진 사람들이 모여 정보를 공유할 수 있는 공간이다.
- 회원 가입을 한 후 로그인을 통해 카테고리 별 게시물을 작성할 수 있다. 
- 다른 회원들의 게시물도 공유할 수 있으며, 댓글을 통해 서로 간의 소통도 가능한 블로그이다.
- 관리자 모드로 로그인하면 공지사항 작성, 게시판 관리 등의 권한을 가지게 되며 원활한 운영을 할 수 있다


## 2. 프로젝트 개발의 목적
- Spring boot와 HTML, CSS, JSP 등을 사용하여 시스템을 개발하고, DB연동을 활용한다.
- 커뮤니티 블로그를 구현하여 프로그래밍이라는 분야에 관심을 가진 사람들이 모여 정보를 공유할 수 있도록 한다. 
- 프로그래밍 언어 별로 카테고리를 나눠 게시 글을 작성, 댓글 작성 등을 통해 회원 간의 소통이 가능하도록 한다.


## 3. 프로젝트 상세 내용

![0001](https://user-images.githubusercontent.com/78891624/129847746-1121b0d1-f30e-4291-a448-fa34b6cedf96.jpg)

 ### 1) 로그인/회원 가입
- 로그인: 가입 시 입력한 USERNAME 과 PASSWORD 입력하여 로그인이 가능하다.
- 페이스북 로그인 : 페이스북의 정보를 입력하여 페이스북 정보로 로그인이 가능하다.
- 회원 가입 : USERNAME, PASSWORD, NAME, EMAIL 등 회원 정보를 입력하여 회원 가입이 가능하다.

 ### 2) 메인 페이지
- header: 우측의 세 개 아이콘을 클릭 시 [HOME], [BOARD], [PROFILE] 페이지로 이동이 가능하다.
- body : 전체 게시판으로 이동 할 수 있는 메뉴가 있다.
- footer

 ### 3) 프로필 페이지
- 유저가 지정해 놓은 프로필 이미지가 나타난다.
- USERNAME과 본인 소개 글이 보인다.
- 프로필 페이지의 유저가 작성한 글들이 나타난다.
- 작성 글을 클릭하면 게시 글의 내용을 확인 할 수 있다.
- 본인의 프로필 페이지에서는 글 작성 버튼과 회원 정보를 수정, 로그아웃을 위한 톱니바퀴 버튼이 보인다.

 ### 4) 회원 정보 수정
- 가입 시 기입한 USERNAME은 변경할 수 없다.
- 회원 정보 수정 시 비밀번호는 반드시 입력해야 한다.
- 수정 된 정보는 프로필 페이지에 반영된다.

 ### 5) 게시판
- 개발언어 별로 카테고리가 구분되어 있다.
- 카테고리 별로 작성 된 게시물을 볼 수 있다.
- 게시물을 클릭하면 작성 된 내용을 확인할 수 있고, 댓글 작성이 가능하다.

 ### 6) 관리자 모드
- 관리자 모드로 로그인을 하면 공지사항을 작성 할 수 있다.
- 회원 탈퇴 등의 회원 관리가 가능하다.

#

##### - 초기시작 URL은 http://localhost:8900/auth/signin 입니다.

#

<p align="center">
<img src="https://user-images.githubusercontent.com/78891624/129853983-2454ae3d-b5ef-4a8b-b9cc-a586aa10deab.gif" width="850" height="500"/>
</p>

## 4. 프로젝트 설명

###  [1) DB 쿼리문](#db-테이블-쿼리문)
- pro 권한 부여 
- 게시판 테이블(boardTable2)
- 댓글 테이블(replyTable)

### 4.2 환경설정
- pom.xml
- application.yml(포트번호, jsp적용, MariaDB 연동)
- application.properties (mybatisMapper.xml과 DAO 연결)

### 4.3 게시판 기능
- 게시물 작성 및 등록
- 게시물 조회
- 게시물 수정
- 게시물 삭제
- 마이페이지(내가 쓴 글, 내가 쓴 댓글 모음)

### 4.4 댓글 기능
- 댓글 작성
- 댓글 조회
- 댓글 수정
- 댓글 삭제

### 4.5 관리자 기능
- 전체 회원 정보 조회
- 회원 강제 탈퇴
- 공지사항 작성
- 모든 게시물, 댓글 접근 권한(수정, 삭제 권한)

#

#### DB 테이블 쿼리문

 - pro 권한 주기
###### - MariaDB의 사용자를 root에서 'pro'로, 패스워드를 'pro1234'로 팀원들과 동일한 아이디와 패스워드를 갖도록 권한을 부여한다.

```create user 'pro'@'%' identified by 'pro1234';
GRANT ALL PRIVILEGES ON *.* TO 'pro'@'%';
create database prolog
```


- 게시판 테이블
```
CREATE TABLE `boardtable2` (
	`user_id` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci', -- 로그인한 id
	`num` INT(10) NOT NULL AUTO_INCREMENT, -- 글번호
	`lang` VARCHAR(100) NOT NULL COLLATE 'utf8mb3_general_ci', -- 게시판 명
	`title` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci', -- 게시물 제목
	`contents` VARCHAR(1000) NOT NULL COLLATE 'utf8mb3_general_ci', -- 게시물 내용
	`image` VARCHAR(200) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci', -- 첨부 이미지
	`date1` TIMESTAMP NULL DEFAULT current_timestamp(), -- 작성일
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

#

#### 4.2 환경설정
1) pom.xml
- JSP 
###### - JSP가 컴파일이 가능하도록 한다.
```
<dependency> 
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
</dependency>		
```
- JSTL
###### - JSTL(JavaServer Pages Standard Tag Liary, 자바서버 페이지 표준 태그 라이브러리)를 사용할 수 있도록 한다.
```
<!--  JSTL -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
</dependency>
```
-  JDBC 
###### - JDBC(Java Database Connectivity)를 통해 자바에서 데이터베이스에 접속할 수 있도록 한다. 
```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```		
- Lombok
###### - getter, setter, toString 등을 @Getter, @Setter, @ToString 등의 annotation으로 자동생성하도록 해주는 라이브러리이다.
```
<dependency>
	<groupId>org.projectlombok</groupId>
	<artifactId>lombok</artifactId>
	<optional>true</optional>
</dependency>
```
-  Mybatis
###### - 자바와 DB를 위한 프레임워크로써 자바객체와 SQL을 매핑하는 방식이다.
```
<dependency>
	<groupId>org.mybatis.spring.boot</groupId>
	<artifactId>mybatis-spring-boot-starter</artifactId>
	<version>2.2.0</version>
</dependency>
```		
- devtools
###### - 스프링 부트에서 제공하는 개발 편의를 위한 모듈로써 변경된 코드를 서버 또는 화면에 신속하게 반영해 결과를 확인할 수 있도록 한다.
 ```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-devtools</artifactId>
	<scope>runtime</scope>
	<optional>true</optional>
</dependency>
```
- MariaDB 
###### - MariaDB 연동
```
<dependency>
	<groupId>org.mariadb.jdbc</groupId>
	<artifactId>mariadb-java-client</artifactId>
	<scope>runtime</scope>
</dependency>
```

2) application.yml(포트번호, jsp 적용, mariaDB 연동)
- 포트번호 지정
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
###### - jsp 파일은 Springboot 의 templates 폴더안에서 작동하지 않고, webapp 아래 /WEB-INF/views/ 폴더를 만든 다음 .jsp 파일들을 넣어 실행할 수 있도록 한다.

```
spring:
  mvc:
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp
```
- MariaDB 연동
```
datasource:
    driver-class-name: org.mariadb.jdbc.Driver
    url: jdbc:mariadb://localhost:3306/prolog?serverTimezone=Asia/Seoul
    username: pro
    password: pro1234
```

3) application.properties
- Mybatis 연동
###### - mybatis mapper 파일이 생성되는 위치를 지정한다.

```
mybatis.mapper-locations=classpath:mapper/**/**.xml
```


#

#### 4.3 게시판 기능

- Spring boot에서 다음과 같은 흐름으로 웹페이지가 실행된다.

![0001 (2)](https://user-images.githubusercontent.com/78891624/129710374-38c179bb-eb64-45a5-94a4-f8f72ecc15cc.jpg)

- BoardVO.java
###### - lombok을 이용하여 @Data annotation으로 각 변수값의 setter, getter 등을 자동으로 생성시켜준다.
###### - 회원아이디, 글번호, 게시판 카테고리명, 제목, 내용, 이미지, 작성일, 조회수 변수 생성
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
	private int hit; //조회수
}
```

##### 4.3.1 게시물 작성 및 등록
- 회원의 경우, 메인페이지에서 [개발언어]를 누르면 전체게시판 및 각 개발언어 게시판이 나타난다.
- 회원은 공지사항을 제외하고 모든 게시물을 작성할 권한을 가지고 있다.
- 게시판 화면에서 오른쪽에 <img src="https://user-images.githubusercontent.com/78891624/130184068-8751dc3e-5d3b-4466-b01a-99f77cea28cc.PNG" width="30" height="30"/> 을 눌러 게시물을 작성할 수 있다.


<p align="center">
<img src="https://user-images.githubusercontent.com/78891624/129854031-a2dbccee-ff8a-4c0c-b77f-e937ebcac96b.gif" width="850" height="500"/>
</p>

1)  write.jsp
- 게시판 카테고리명, 제목, 이미지, 내용, 회원번호, 회원아이디를 <form>의 post방식을 통해 BoardController1의 writerAfter 로 보낸다.
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
				<input type="hidden" name="user_id" value="${principal.user.username}"> //시큐리티 회원 username(=회원 아이디)
				<input type="hidden" name="user_num" value="${principal.user.id}">  //시큐리티 회원 id(=회원 번호)
			    <button type="submit" class="btn btn-info">발행</button>
		</form>
```
2) BoardDAO.java
- 게시물을 등록하는 매퍼 인터페이스를 만들어 준다.
```
@Mapper 
public interface BoardDAO { 
	
	public boolean addBoard(BoardVO bvo);
```	
3) BoardService1.java
- Service에서는 MyBatis의 addBoard를 실행시킨다.
```
@Service
public class BoardService1 {
	
	@Autowired 
	private BoardDAO bdao; //DAO객체를 한번에 받아서
	
	
	public boolean addBoard(BoardVO bvo) {
		return bdao.addBoard(bvo);
	}
```

4) mybatismapper.xml
- num(글번호)는 쿼리문에서 자동 수 증가를 해줬기 때문에 useGeneratedKeys="true" keyProperty="num" 을 작성해준다.
```
 <insert id="addBoard" useGeneratedKeys="true" keyProperty="num">
		INSERT INTO 
	    	boardTable2
	   			(
	   				user_id,
	   				lang,
					title,
					contents,
					image,
					user_num
				)
	    	VALUES
	   			(
	   				#{user_id},
	   				#{lang},
	   				#{title},
	   				#{contents},
	   				#{image},
	   				#{user_num}
				)
    </insert>
```

5) BoardController1.java
- 게시판 화면에서 연필모양 버튼을 클릭하면, Controller의 write로 와서 글쓰기 페이지가 나타난다.
```
@Controller
public class BoardController1 {
	
	@Autowired
	private BoardService1 bs;
	
	@GetMapping("/write")
	public String write() {
		return "write"; 
	}
```

- 글쓰기 페이지에서 java, javascript, spring, html 중 원하는 개발언어 게시판 카테고리를 콤보박스로 선택한다.
- 제목, 이미지 첨부, 내용을 입력한 후 [발행]을 누르면 BoardController1의 writeAfter 로 이동한다.
- 입력한 값들을 @RequestParam을 통해 파라미터로 가져오고, user_id(회원아이디)는 session에 저장되도록 한다.
- 첨부한 이미지는 이미지가 저장될 외부 경로 path를 지정한 후 이미지파일의 이름을 가져올 수 있도록 한다.
- 게시물의 내용은 개행도 적용될 수 있도록 replace를 이용하여 enter(즉, \r\n)를 br 태그로 db에 저장되도록 한다.
- BoardService1에서 생성한 addBoard를 불러와 각 파라미터값들을 넣어 insert되도록 한다.
- 게시물을 등록하면 전체 게시판 화면으로 넘어갈 수 있도록 return 해준다.
 
```
@PostMapping("/writeAfter")
public String writeAction(
			HttpServletRequest req,
			HttpSession session,
			@RequestParam("file") MultipartFile file, //이미지파일
			@RequestParam("lang") String lang, //게시판 카테고리명
			@RequestParam("title")String title, //글 제목
			@RequestParam("user_num")int user_num, //회원번호
			Model model1) throws IllegalStateException, IOException {

		String contents = req.getParameter("contents"); //게시물 내용
		contents = contents.replace("\r\n", "<br>"); //db에 저장할 때, 개행부분을 br 태그로 변경해준 후 저장

		String user_id=req.getParameter("user_id"); //회원 아이디
		session.setAttribute("user_id", user_id);
	
		String path = "C:/workspace/springbootwork/upload/"; //이미지가 저장될 외부 경로 지정
		
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path + file.getOriginalFilename()));
		}
		
		bs.addBoard(new BoardVO(user_id,user_num,0,lang, title, contents, file.getOriginalFilename())); //게시물이 등록됨
		return "board/mainBoard"; //전체 게시판으로 이동
}
```	

##### 4.3.2 게시물 조회
- 메인페이지에서 [개발언어]를 누르면 전체게시판 및 각 개발언어 게시판이 나타난다.
- 등록된 게시물은 섬네일 형태로 이미지, 작성일, 조회수가 나타난다.
- 각 게시물을 클릭하면 그에 맞는 상세페이지로 이동한다.
- 게시물 작성자의 회원아이디와 로그인한 회원아이디가 같으면 게시물을 수정 및 삭제할 수 있는 권한이 주어진다.
- 그렇지않다면, [수정], [삭제] 버튼이 나타나지 않는다.


<p align="center">
<img src="https://user-images.githubusercontent.com/78891624/129853983-2454ae3d-b5ef-4a8b-b9cc-a586aa10deab.gif" width="850" height="500"/>
</p>


###### 4.3.2.1 전체 게시판 조회

1) board/mainBoard.jsp
- ajax를 통해 BoardController1에 boardList 로 요청을 보내면 BoardController1 --> BoardService1 --> mapper 인터페이스 --> mapper.xml에서 쿼리를 실행해 이 값을 현재 mainBoard.jsp의 result에 데이터 값을 가지고 오게 된다.
- forEach문과 grid CSS를 적용하여 html을 생성해 <tbody> 부분에 섬네일 형식으로 append 시켜준다. (섬네일에 나타나는 것: 이미지, 작성일, 조회수) 
- 그리고 각 섬네일을 클릭하면, 그에 맞는 게시물 정보를 BoardController1의 detailView 로 보내 상세페이지인 detailView.jsp가 실행되도록 한다.
```
<script>

$(document).ready(function() {
    $.ajax({
    	
    	url: "boardList", 
    	success: function(result){  // result    
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
        				'&lang=' + item.lang + "'>" + "<img id='hov1' src='/upload/" + item.image + "' width='200'  height='200'></a>
									<h6 id='date1'>작성일: " + item.date1 
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
2) BoardDAO.java
- 게시물 전체 조회에 대한 mapper 메소드를 생성한다.
```
	public List<BoardVO> getAllBoard();
```

3) BoardService.java
- Service에서는 MyBatis의 getAllBoard로 실행시킨 데이터를 List에 담아서 BoardController1로 보낸다.
```	
	public List<BoardVO> getAllBoard(){
		return bdao.getAllBoard();
	}
```	
4) mybatismapper.xml
- 모든 값을 select하고 작성일(date1)은 2021-08-12 13:09:37 형태로 포맷한다.
- 글번호(num)을 기준으로 내림차순 정렬한다.

```
<select id="getAllBoard" resultType="com.cos.prologstart.vo.BoardVO">
	SELECT
		user_id,user_num, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1',hit, reply_cnt
	FROM
		boardTable2
	ORDER BY num desc
</select>
```
- 조회수
###### - 해당 게시물 섬네일을 클릭할 때마다 조회수가 1씩 증가하도록 한다.

<p align="center">
<img src="https://user-images.githubusercontent.com/78891624/129853930-840d0903-6de1-49bf-acf0-18c60f95bd5f.gif" width="850" height="500"/>
</p>

##### 1. BoardDAO.java
###### - 게시물의 글번호(num)을 매개변수로 하는 mapper 메소드를 생성한다.
```
public int hitCount(int num);

```
##### 2. BoardService.java
###### - Service에서는 MyBatis의 hitCount로 실행시킨 데이터를 BoardController1로 보낸다.
```
public int hitCount(int num) {
	return bdao.hitCount(num);
}
```
##### 3. mybatismapper.xml
###### - 해당 게시물 섬네일을 클릭할 때마다 조회수(hit)가 +1씩 증가하도록 한다.
###### - IFNULL 을 이용하면 조회수(hit)가 NULL 일경우 0으로 표기하도록 한다.
```
<update id="hitCount" parameterType="com.cos.prologstart.vo.BoardVO">
	UPDATE 
		boardTable2
        SET 
        	hit = IFNULL(HIT, 0) + 1
            
        WHERE 
		num = #{num}
    
</update>
```

5) BoardController1.java
- Controller에서는 boardList로 받은 요청을 Service로 넘겨준다. 

```
@GetMapping("/boardList")
@ResponseBody public List<BoardVO> boardList(){ 
 	return bs.getAllBoard(); //전체 게시판 모두 조회 
}
```
- 각 게시판의 섬네일을 누르면 BoardController1의 detailView로 이동한다.
- 각 파라미터 값을 Model을 이용하여 detailView.jsp로 보낸다.
- 게시물의 내용은 db에 enter(= \r\n)를 br 태그로 저장했기 때문에 다시 replace를 통해 \r\n로 변경하여 개행도 출력될 수 있도록 한다.

```
@GetMapping("/detailView") //게시글 상세보기를 누르면 보이는 화면
public String loginview( HttpServletRequest req, HttpSession session,
			 	@RequestParam("num")int num,
				@RequestParam("title")String title,
				@RequestParam("image")String image,
				@RequestParam("lang")String lang,
				@RequestParam("writer")String writer,
				@RequestParam("date1")String date1,
				@RequestParam("hit")int hit,
				@RequestParam("user_num")int user_num,
				Model model1) throws Exception{
		
		String contents = req.getParameter("contents"); 
		contents = contents.replace("<br>", "\r\n"); //br 태그를 \r\n 로 변경
		
		model1.addAttribute("num", num);
		model1.addAttribute("title", title);
		model1.addAttribute("image", image);
		model1.addAttribute("lang", lang);
		model1.addAttribute("contents", contents);
		model1.addAttribute("date1", date1);
		model1.addAttribute("writer", writer);
		model1.addAttribute("user_num", user_num);
		model1.addAttribute("hit", bs.hitCount(num)); //조회수에 대한 BoardService 실행
		
		
		String user_id =req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		List<ReplyVO> reList = bs.readReply(num);//댓글이 보이도록
		model1.addAttribute("reList", reList);//reList로 댓글 List를 넘김
		
		return "detailView"; //상세페이지로 이동
	}
```
6) detailView.jsp
- 각 게시판에서 섬네일을 클릭하면 위의 해당 상세페이지로 이동하게 된다.
- 해당 게시물의 게시판 카테고리명, 제목, 이미지, 내용이 나타난다.
```
<div id="container">
   <div class="second_container">
      <div class="jumbotron-text">
           (${user_id}님 환영합니다♥)
      </div>
      
       <div class="lang"> 
               ▶ ${lang} 게시판>
       </div>
       
      <div class="lang_two">
         작성자: <a href="/${user_num}?user_id=${writer}" >${writer}</a><br>
         작성일: ${date1}
      </div>
   </div>
   
   <div class="main_title">
      제목) ${title}
         <div>
            <img src="/upload/${image}" width="400" height="400">
         </div>
   </div>

      <div id="container2">
         <div class="main_textarea">
         <table>
            <tr>
               <td class="textarea">▶ 작성 내용:</td>
            </tr>

            <tr>
               <td id="contents" >
               <textarea rows="20" cols="100" id="contents" name="contents" readonly style="word-wrap:break-word; white-space: pre-line;">
                  ${contents}
               </textarea>
               </td>
```
- 클릭한 게시물의 작성자가 로그인한 회원아이디와 같다면, 게시물을 수정 및 삭제 할 수 있는 권한이 있다.
- 비회원이나, 로그인한 회원이 해당 게시물 작성자와 다르다면 [수정], [삭제] 버튼이 나타나지 않는다.

![내가쓴 글이 아니면 수정이 안됨-1](https://user-images.githubusercontent.com/78891624/129854096-891ca57c-6abf-4ba2-91c6-a783918406e1.gif)

- [수정]을 누르면 Controller의 updateForm로 이동한다.
- [삭제]를 누르면 Controller의 delete로 이동한다.
```
         <c:choose>
            <c:when test="${writer == user_id || user_id == 'admin_user' && user_id != '비회원'}">
             
                 <form action="updateForm" method="get" enctype="multipart/form-data">
                   <input type="hidden" name="title" value="${title}">
                   <input type="hidden" name="image" value="${image}">
                   <input type="hidden" name="contents" value="${contents}">
                   <input type="hidden" name="lang" value="${lang}">
                   <input type="hidden" name="num" value="${num}">
                   <input type="hidden" name="writer" value="${writer}">
                   <input type="hidden" name="date1" value="${date1}">
      
               <a href="delete?num=${num}"><input type="button" value="삭제" class="btn btn-info"  style="float: right"></a>
                  <input type="submit" value="수정" class="btn btn-info" style="float: right;">
                     </form>
                  </c:when>
               </c:choose>
            </table><br>
```
- 회원이라면 글 작성자를 클릭하여 해당 회원의 프로필 페이지를 볼 수 있다.
		 
![작성자-프로필로-이동-_online-video-cutter com_](https://user-images.githubusercontent.com/78891624/129853949-60f3323d-8e5b-4807-bc17-d1208b784ccc.gif)	

###### 4.3.2.2  java, html, javascript, spring 게시판 조회
- java, html, javascript, spring 게시판에서 각 개발언어별 게시물이 조회되도록 한다. 
		
1) board/html.jsp (java, javascript, spring 게시판도 동일)
- <c:choose> 를 이용하여 비회원, 회원 권한을 나눈다.
- 로그인 회원이라면, Controller의 write(글쓰기)가 가능하도록 한다.
```
<h1>HTML 게시판</h1>
	<hr>
 	<c:choose>
 		<c:when test="${principal.user.username != null }"> <!-- 회원이라면 -->
 				<div align="right"><a href="write?user_id=${principal.user.username}"><button type="button" class="btn btn-info" id="writeBtn">
				<img src="../images/pencil.png" width="30"></button></a></div>
		</c:when>
	</c:choose>		
```		
- 비회원이라면(아이디가 null이라면), 글쓰기 버튼은 보이지 않고 각 게시판의 게시물을 읽을 수만 있도록 한다. 

```
	<table align="center">
		<tbody style="width: 50%">
		<div id="grid">
		<c:choose>
			<c:when test="${principal.user.username == null}"> <!-- 비회원 이라면 -->
			<c:forEach var="imsi" items="${menu}">        				
			<div class='image1'>
		<a href = 'detailView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}
			   &num=${imsi.num}&date1=${imsi.date1}&writer=${imsi.user_id}&hit=${imsi.hit}&user_num=${imsi.user_num}'>
		<img id='hov1' src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1} <br>조회수: ${imsi.hit}</h6> </div>
			</c:forEach>
			</c:when>
			<c:otherwise> <!-- 회원 이라면 -->
			<c:forEach var="imsi" items="${menu}"> 
		        	<div class='image1'>
				<a href = 'detailView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}										   &num=${imsi.num}&date1=${imsi.date1}&user_id=${principal.user.username}&writer=${imsi.user_id}&hit=${imsi.hit}
					   &user_num=${imsi.user_num}&user_num=${imsi.user_num}'>
				<img src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}<br>조회수: ${imsi.hit}</h6>				</div>
			</c:forEach>
			</c:otherwise>
		</c:choose>		
		</tbody>
```
	
2) BoardDAO.java
- 개발언어별 게시판 카테고리명(lang)에 따라 게시판 조회에 대한 mapper 메소드를 생성한다.
```
	public List<BoardVO> getMenu(String lang);
```
3) BoardService.java
- Service에서는 MyBatis의 getMenu로 실행시킨 데이터를 List에 담아서 BoardController1로 보낸다.
```	
	public List<BoardVO> getMenu(String lang){
		return bdao.getMenu(lang);
	}
```	
4) mybatismapper.xml
- 각 게시판 이름(lang)에 맞는 게시물에 대해서 전체 조회를 한다.

```
<select id="getMenu" resultType="com.cos.prologstart.vo.BoardVO">
	SELECT
		 user_id, user_num,num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1', hit, reply_cnt
	FROM
		boardTable2
	WHERE
		lang = #{lang}
</select>
```

5) BoardController1.java
- layout/header2.jsp에 생성된 게시판 카테고리 버튼 중 [html] 을 클릭하면,
- html을 lang값으로 받아와서 Controller의 html --> Serivce --> 매퍼 인터페이스 --> mapper.xml에서 데이터 값이 board/html.jsp로 이동한다.

```
@GetMapping("/html")
public String html(@RequestParam("lang")String lang,
		    HttpServletRequest req, 
		    HttpSession session,
		    Model model1) {
	
	String user_id = req.getParameter("user_id");
	session.setAttribute("user_id", user_id);
		
	model1.addAttribute("menu", bs.getMenu(lang)); ////
		
	return "board/html";
}
```
- layout/header2.jsp 는 다음과 같다.
```
<table id="example" class="display" style="width: 50%">
	<div id="total_btn"> 
		<a href="board"><button id="btn1">전체 게시판</button></a>
		<a href="java?lang=java&user_id=${member.user_id}"><button id="btn1">java</button></a>
		<a href="javascript?lang=javascript&user_id=${member.user_id}"><button id="btn2">javascript</button></a>
		<a href="spring?lang=spring&user_id=${member.user_id}"><button id="btn3">spring</button></a>
		<a href="html?lang=html&user_id=${member.user_id}"><button id="btn4">html</button></a>
 		<a href="notice?lang=notice&user_id=${member.user_id}"><button id="btn4">공지사항</button></a>
 	</div>
```

4.3.3 게시물 수정
- 게시물 작성자가 로그인한 회원과 같다면 detailView.jsp에 [수정]버튼이 나타난다.
- [수정]을 누르면 다음과 같이 Controller의 updateForm로 이동하여 수정할 수 있는 페이지(updateView.jsp)로 이동하게 된다.


![게시물수정-_online-video-cutter com_](https://user-images.githubusercontent.com/78891624/129853993-b6afcdb3-c41c-4bd8-a40c-27f1daadbb75.gif)


- BoardController1.java
```	
@GetMapping("/updateForm")
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
```

1) updateView.jsp
- detailView.jsp의 값을 그대로 가지고 있지만, 수정할 수 있도록 <input> 태그 형태로 표시된다.
- 수정페이지에서는 게시판 카테고리명, 제목, 내용을 수정할 수 있다.
- 이미지, 작성자는 바뀌지 않는다.
- 작성일은 [수정완료]를 누르면 Controller의 updateclear로 이동하여 수정된 날짜로 변경된다.
```
<h1>게시판 글 수정</h1>
	
<div id="container">
   <div class="second_container">
	<div class="lang"> ${lang} 게시판></div></h2>
	     <form action="updateclear" method="get" enctype="multipart/form-data">
	      <select name="lang">
	      	<option value="none">게시판 카테고리를 선택해주세요</option>
	      	<option value="java">java</option>
	      	<option value="javascript">javascript</option>
	      	<option value="spring">spring</option>
	      	<option value="html">html</option>
	      </select>
	      <div class="lang_two">
				작성자: ${writer}<br>
				작성일: ${date1}
	      </div>
	      	     <div class="main_title">
			   제목) <input type="text" name="title" size="40" value="${title}" style="font-size:12pt; font-weight:bold;" >
		     </div>
	<div>
	 	<img src="/upload/${image}" width="400" height="400">
	</div>
		
		</div>
	</div>	
	<div id="container2">
         <div class="main_textarea">
          <table>
	     <tr>
               	<td class="textarea">▶ 작성 내용:</td>
             </tr>
	     <tr>
		<td id = "contents" style='word-break:break-all'>
	 	<textarea name="contents" cols="100" rows="15" wrap="hard">${contents}</textarea></td></tr>
	  </table>
		<input type="hidden" name="image" value="${image}"> 
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="writer" value="${principal.user.username}">  
		<input type="submit" class="btn btn-info btn-sm" value="수정완료" style="float: center">
		</form>
			  
	<table align="left">
  		<button type="button" class="btn btn-info" id="back" onclick="history.go(-1)">뒤로가기</button>
		<button type="button" class="btn btn-info" id="list" onclick="board()">목록</button><br><br>
	</table>

<%@ include file="../views/layout/footer.jsp"%>
</body>
</html>

```

2) BoardDAO.java
- 글번호, 카테고리명, 제목, 이미지, 내용 값을 매개변수로 하는 mapper 메소드를 생성한다.
```
public int updateclear(int num,String lang,String title,String image, String contents);
```
3) BoardService.java
- Service에서는 MyBatis의 updateclear를 실행시킨 후 데이터를 BoardController1로 보낸다.
```
public int updateclear(int num, String lang,String title,String image, String contents) {
	return bdao.updateclear(num, lang, title, image,contents);
}	
```
4) mybatismapper.xml
- 글번호(num)을 조건문으로 하여 해당 게시물의 카테고리명, 제목, 내용이 수정된다.
- 작성일은 NOW()를 통해 수정한 날짜로 업데이트 되도록 한다.
```
<update id="updateclear" parameterType="com.cos.prologstart.vo.BoardVO">
	UPDATE 
		boardTable2
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
5) BoardController1.java
- updateView.jsp에서 게시물을 수정하고 [수정완료]를 누르면 Controller의 updateclear로 이동한다.
- 게시물 내용은 개행도 db에 저장될 수 있도록 replace를 이용하여 enter(즉, \r\n)를 br 태그로 업데이트가 되도록 한다.
- bs.getBoardOne(num)는 글번호를 조건문으로 해당 게시물 정보를 조회하는 메서드이다.
- view.jsp에서 수정된 게시물의 값들을 조회해야 하기 때문에 게시물의 내용을 다시 replace를 통해 \r\n로 변경하여 출력되도록 한다.
```
  @GetMapping("/updateclear")
  public String updateclear( @RequestParam("num")int num,
			     @RequestParam("title")String title,
			     @RequestParam("image")String image,
			     @RequestParam("lang")String lang,
			     @RequestParam("writer")String writer,
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
```	

6) view.jsp
- [수정완료]를 누르면 해당 페이지로 이동한다.
- 수정된 내용으로 페이지에 값이 나타난다.
```
<div id="container">
   <div class="second_container">
	<div class="lang">
		${lang} 게시판>
	</div>
		
	<div class="lang_two">
		작성자: ${writer}<br>
		작성일: ${menu.date1}
	</div>
 </div>		      
	<div class="main_title">
		제목) ${title} 
		<div>
            <img src="/upload/${image}" width="400" height="400">
         </div>
   	</div>
	<div id="container2">
         <div class="main_textarea">
         <table>
            <tr>
               <td class="textarea">▶ 작성 내용:</td></tr>
	    <tr>
		<td id = "contents" style='word-break:break-all'><textarea name="contents" cols="100" rows="15" readonly="readonly" wrap="hard">${contents}</textarea></td>
	    </tr>
	 </table>

```
4.3.4 게시물 삭제
- 게시물 작성자가 로그인한 회원과 같다면 detailView.jsp에 [삭제]버튼이 나타난다.
- [삭제]를 누르면 Controller의 delete로 이동한다.


1) BoardDAO.java
- 글번호(num)를 매개변수로 하는 mapper 메소드를 생성한다.
```
public int deleteBoard(int num);
```
2) BoardService.java
- Service에서는 MyBatis의 deleteBoard로 실행시킨 데이터를 BoardController1로 보낸다.
```
public int deleteBoard(int num) {
	return bdao.deleteBoard(num);
}
```
3)mybatismapper.xml
- 글번호(num)을 조건문으로 해당 게시물 전체가 삭제된다.
```
<delete id="deleteBoard" parameterType="com.cos.prologstart.vo.BoardVO">
	DELETE 
	FROM 
		boardTable2
        WHERE 
		num = #{num}
</delete>
```		 
4) BoardController1.java
- [삭제]를 누르면 다음과 같이 Controller의 delete로 이동하여 해당 게시물과, 댓글들이 모두 삭제된다.
```
 @GetMapping("/delete")//게시글 삭제
 public String delete(@RequestParam("num")int num) throws Exception {
	bs.deleteBoard(num); //글번호로 게시글 삭제
	bs.deleteAllReply(num); //삭제한 게시글에 있는 댓글도 삭제
	return "board/mainBoard";
}
```
		 
4.3.5 프로필페이지
- 로그인한 상태에서 layout/header.jsp의 [PROFILE]을 누르면 로그인한 회원의 프로필페이지가 나타난다.
- 로그인한 회원이 작성했던 게시물을 게시판 화면과 동일하게 섬네일 형태로 볼 수 있다.
- 내가 작성한 댓글보기를 누르면 로그인한 회원이 작성했던 댓글을 하번에 모아볼 수 있는 replyList.jsp 로 이동하게 된다.




1) BoardDAO.java
- session에 저장된 회원아이디를 매개변수로 하는 mapper 메소드를 생성한다.
```
public List<BoardVO> goMypage(String user_id);
```
2) BoardService.java
- Service에서는 MyBatis의 goMypage로 실행시킨 데이터를 UserController로 보낸다.
```
public List<BoardVO> goMypage(String user_id){
	return bdao.goMypage(user_id);
}
```
3)mybatismapper.xml
- session으로 불러온 회원아이디의 게시판 정보를 전체 조회한다.
```
<select id="goMypage" resultType="com.cos.prologstart.vo.BoardVO">
	SELECT
		user_id, user_num, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1', hit, reply_cnt
	FROM
		boardTable2
	WHERE
		user_id = #{user_id}
</select>
```
4) UserController.java
- 로그인한 상태에서 layout/header.jsp의 [PROFILE] 버튼을 누르면
- 해당 시큐리티 회원아이디(principal.user.username)와 회원번호(principal.user.id)가 넘어간다
- 이 값들이 UserController의 pageUserId로 이동하여 해당 회원에 대한 프로필페이지가 나타난다.
```
@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService userService;
	
	@Autowired
	private BoardService1 bs;
	
	@GetMapping("/{pageUserId}")					
	public String profile(@PathVariable int pageUserId, Model model, @AuthenticationPrincipal PrincipalDetails principalDetails,
			 HttpServletRequest req,  HttpSession session) {
		UserProfileDto dto = userService.회원프로필(pageUserId, principalDetails.getUser().getId());


		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);

		model.addAttribute("menu", bs.goMypage(user_id)); //해당 user_id를 가진 게시글을 모두 조회

		model.addAttribute("dto", dto);
		return "profile";
	}
```
- layout/header.jsp 은 다음과 같다. 
```
<header class="header">		
		<div class="container">
			<a href="/" class="logo">
				Prolog
			</a>
			<nav class="navi">
				<ul class="navi-list">
					<li class="navi-item"><a href="/index">
							<i class="fas fa-home"></i>
						</a></li>
					<li class="navi-item"><a href="/board">
							<i class="fa fa-bars"></i>
						</a></li>																							<!-- title : 마우스 올리면 로그인한 회원아이디가 뜨도록 -->
					<li class="navi-item"><a href="/${principal.user.id}?user_id=${principal.user.username}"  <!-- [PROFILE] 버튼 -->
								 	title="${principal.user.username}(${principal.user.name})님 로그인중">
							<i class="far fa-user"></i>
						</a></li>
				</ul>
			</nav>
		</div>
	</header>
```

5) profile.jsp
- 내가 작성한 글 개수는 fn 태그라이브러리를 이용하여 menu로 받아온 List 개수를 이용한다.
```
<li><a href=""> 게시물<span>${fn:length(menu)}</span>
```
- [새 글 등록] : 게시판에서 글을 작성한 방식과 동일하게 BoardController1의 write로 이동하여 글을 작성할 수 있다.
- [내가 작성한 댓글 보기]: 내가 작성한 댓글 리스트 화면인 replyList.jsp로 이동한다.

![내가쓴-댓글보기-_online-video-cutter com_](https://user-images.githubusercontent.com/78891624/129854012-e5859652-f83a-499c-82a3-b06ab8eb29ee.gif)

``` 
<c:choose>
                <c:when test="${dto.pageOwnerState}">
                        <button class="cta" onclick="location.href='write'">새 글 등록</button>
                        <button class="cta" onclick="location.href='myReplyList?user_id=${principal.user.username}'">내가 작성한 댓글 보기</button>
                </c:when>
                    
 </c:choose>
```
- 게시판에서 상세페이지로 게시물을 보는 것과 동일한 형태로 프로필페이지의 글도 읽을 수 있다. (detailView.jsp로 이동)
```
	<table align="center">
	<tbody style="width: 50%">
		<div id="grid">
		<c:forEach var="menu" items="${menu}"> 
		       <div class='image1'><a href = 'detailView?contents=${menu.contents}&image=${menu.image}&title=${menu.title}&lang=${menu.lang}
			&num=${menu.num}&date1=${menu.date1}&user_id=${principal.user.username}&writer=${principal.user.username}&hit=${menu.hit}&user_num=${menu.user_num}'>
			<img src='/upload/${menu.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${menu.date1}</h6></div>
		</c:forEach>			
	</tbody>
		 </div>
			<td><button type="button" class="btn btn-info" id="btnUpdate" onclick="history.go(-1)">뒤로가기</button></td>
			<td><button type="button" class="btn btn-info" id="btnUpdate" onclick="location.href='board'" style="float:right;">목록</button></td>
	</table>
```

#

4.4 댓글 기능
- ReplyVO.java
###### - lombok을 이용하여 @Data로 각 변수값의 setter, getter 등을 자동으로 생성시켜준다.
###### - 게시물 글번호, 댓글 번호, 댓글 내용, 작성자, 작성일 변수 생성
```
@Data
public class ReplyVO {
	private int num; //게시물 글번호
	private int reply_num; //댓글 번호
	private String content; //댓글 내용
	private String writer; //작성자
	private String regDate; //작성일	
}
```

4.4.1 댓글 작성

![댓글-작성_수정_-삭제-1](https://user-images.githubusercontent.com/78891624/129854054-d1856b2c-dfd9-4a15-93c7-0a0fdaf370e0.gif)

1) BoardDAO.java
- detailView.jsp 하단의 댓글창에 댓글을 작성하면 해당 게시물 글번호(num), 로그인하여 댓글을 작성한 회원아이디(writer), 댓글 내용(content)을 매개변수로 하는 mapper 메소드를 생성한다.
```
public boolean writeReply(int num, String writer,String content)throws Exception;
```
2) BoardService.java
- Service에서는 MyBatis의 writeReply로 실행시킨 데이터를 BoardController1로 보낸다.
```
public boolean writeReply(int num,String writer,String content)throws Exception{
	return bdao.writeReply(num, writer,content);
}
```
3)mybatismapper.xml
- 댓글번호는 쿼리문에서 자동 수 증사 처리를 해주었기 때문에 insert에서 생략한다.
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
4) BoardController1.java
- 
```
@GetMapping("/writeReply") 
public String replyWrite(@RequestParam("num")int num,
	  		 @RequestParam("writer")String writer,
			 @RequestParam("content")String content,
			 Model model1) throws Exception {
	
	bs.writeReply(num,writer,content); //댓글번호, 작성자, 댓글내용 insert
				
	return "board/mainBoard";
}
```	

4.4.2 댓글 조회
1) detailView.jsp 하단의 댓글창
- 
```
 <div id="reply">
            <div align="left">(${fn:length(reList)})개의 댓글</div>
               <c:choose>
                  <c:when
                     test="${empty principal.user.username || principal.user.username == '비회원'}">
                  </c:when>
                  
                  <c:otherwise>
                     <section class="replyForm" align="left">
                        <form action="writeReply" method="get">
                           <p>
                              <textarea id="content" name="content" rows="5" cols="100"
                                 placeholder="댓글을 입력해주세요"></textarea>
                           </p>
                           <input type="hidden" name="writer" value="${user_id}">
                           <input type="hidden" name="num" value="${num}">
                          <div style='width:150px; float: right;'>
 			   <input type="submit" class="btn btn-info btn-sm" value="작성" >
			  </div>
                        </form>
                     </section>
                  </c:otherwise>
               </c:choose>
               
               <c:forEach items="${reList}" var="list" varStatus="status">
               <pre>
     		<b style="text-align: left">${list.writer}</b> 님     
    		 <h7 style="color: gray; text-align: right">작성일: ${list.regDate}</h7> </pre>
                  <c:choose>
                     <c:when test="${list.writer == user_id || user_id == 'admin_user' }">
                        <div align="left"><textarea class="newContent" id="content" name="content" rows="5" cols="100"
                           style="border: none; background-color: #F1FFFE;">${list.content}</textarea></div>
                        <input type="hidden" id="reply_num" value="${list.reply_num}"><br>
                        <input type="button" class="btn btn-info btn-sm" id="update1" style="float:right;" value="수정">
                        <a href="deleteReply?reply_num=${list.reply_num}"><input type="button" class="btn btn-info btn-sm" id="del" style="float:right;" value="삭제"></a>
                        <br><br>
                     </c:when>
                     <c:otherwise>
                        <textarea id="content" name="content" rows="5" cols="100" readonly="readonly"
                           style="border: none; background-color: #F1FFFE">${list.content}</textarea>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
         </table>
      </div>
   </div>
</div><br><br>
	
      <%@ include file="../views/layout/footer.jsp"%>
```
4.4.3 댓글 수정

![댓글-작성_수정_-삭제-2](https://user-images.githubusercontent.com/78891624/129854073-4cffef34-d32a-4b77-8e69-2dd485d85011.gif)

1) BoardDAO.java
- 댓글번호, 댓글 내용을 매개변수로 하는 mapper 메소드를 생성한다.
```
public int updateReply(int reply_num, String content)throws Exception;
```
2) BoardService.java
- Service에서는 MyBatis의 updateReply로 실행시킨 데이터를 BoardController1 으로 보낸다.
```
public int updateReply(int reply_num, String content)throws Exception{
	return bdao.updateReply(reply_num, content);
}
```
3)mybatismapper.xml
```
 <update id="updateReply" parameterType="com.cos.prologstart.vo.ReplyVO">
	UPDATE 
		replyTable
        SET 
        	content = #{content},
        	regDate = NOW()
       
        WHERE 
	 	reply_num = #{reply_num}
</update>
```		 
4) BoardController1.java
- 
```
@GetMapping("/updateReply")
public String updateReply(@RequestParam("reply_num")int reply_num,
			  @RequestParam("content")String content,
			  Model model1) throws Exception {
	
	bs.updateReply(reply_num, content); //댓글 내용 수정
			
	return "board/mainBoard";
			
}
```	 
4.4.4 댓글 삭제(개별 삭제, 전체 삭제)
1) BoardDAO.java
- 개별 삭제
```
public int deleteReply(int reply_num)throws Exception;
```
- 전체 삭제
```
public int deleteAllReply(int num)throws Exception;
```
2) BoardService.java
- Service에서는 MyBatis의 deleteReply로 실행시킨 데이터를 BoardController1 으로 보낸다.
- 개별 삭제
```
public int deleteReply(int reply_num)throws Exception{
	return bdao.deleteReply(reply_num);
}
```
- 전체 삭제
```
public int deleteAllReply(int num)throws Exception{
	return bdao.deleteAllReply(num);
}
```
3)mybatismapper.xml
- 개별 삭제
```
 <delete id="deleteReply" parameterType="com.cos.prologstart.vo.ReplyVO">
	DELETE 
	FROM 
	 	replyTable
        WHERE 
	 	reply_num = #{reply_num}
</delete>
```
- 전체 삭제
```
<delete id="deleteAllReply" parameterType="com.cos.prologstart.vo.ReplyVO">
	DELETE 
	FROM 
		replyTable
        WHERE 
		num = #{num}
</delete>
```
4) BoardController1.java
- 
```
@GetMapping("/deleteReply")
public String deleteReply(@RequestParam("reply_num")int reply_num,
			  Model model1) throws Exception {
	
	bs.deleteReply(reply_num);//해당 댓글 번호를 가져와서 댓글 삭제
		
	return "board/mainBoard";
}
		
```
- 전체 삭제는 해당 게시물을 삭제했을 때, 그 게시물의 글번호에 작성된 댓글들도 모두 삭제되도록 한다.
```
@GetMapping("/delete")
public String delete(@RequestParam("num")int num) throws Exception {
	bs.deleteBoard(num); //글번호로 게시글 삭제
        bs.deleteAllReply(num); //삭제한 게시글에 있는 댓글도 삭제
	return "board/mainBoard";
 }
```

#

4.5 관리자 기능
- 로그인 페이지에서 admin_user의 아이디로 로그인하면 메인페이지에 관리자페이지 버튼이 생성된다.
- [관리자페이지]를 누르면 관리자 메인페이지로 이동하게 된다.
- 관리자 메인페이지에 [회원게시판],[회원강제 탈퇴],[공지사항] 3개의 버튼이 나타난다.
	     
![관리자-회원게시판이동1](https://user-images.githubusercontent.com/78891624/129847905-f112199a-f99d-4f68-8348-ed2f71464e4d.gif)

4.5.1 전체 회원 정보 조회
- [회원강제탈퇴]를 누르면, 회원 전체 정보 조회와 회원 아이디를 누르면 하이퍼링크로 해당 회원이 작성한 글을 프로필 페이지 형태로 조회할 수 있다.
	      
![관리자-회원관리 (online-video-cutter com)](https://user-images.githubusercontent.com/78891624/129847852-b87ebd90-b477-48a3-b52c-1d9651954cba.gif)

1)BoardDAO.java
```
public ArrayList<UserUpdateDto> getAllUser();
```
2)BoardService1.java
```
public ArrayList<UserUpdateDto> getAllUser(){
	return bdao.getAllUser();
}
```
3)mybatismapper.xml
```
<select id="getAllUser" resultType="com.cos.prologstart.domain.user.User">
	SELECT 
		*	
	FROM  
		user   
</select>
```
4)BoardController1
- 관리자 화면에서 회원강제탈퇴를 누르면, 전체 회원정보를 보여줌
```
@GetMapping("/userList")
public String userList(Model model1) {
	 model1.addAttribute("getAllUser", bs.getAllUser()); 
	 return "admin/userList";
 }
```
5)admin/userList.jsp
```
<%@ include file="../admin/header.jsp"%>
<body>

	<table border="1" align="center" class="table" style="margin-top:50px;"> 
	<caption>회원목록</caption>
	<tr><td colspan="2" align="left"><b>회원수(${fn:length(getAllUser)})</b></td> 
	<tr>
		<th><b>No.</b></th>
		<th><b>회원 아이디</b></th>
		<th><b>이름</b></th>
		<th><b>회원번호</b></th>
		<th><b>이메일</b></th>
		<th><b>사진</b></th>
		<th><b>가입일</b></th>
		<th><b>권한</b></th>
		<th><b>선택</b></th></tr>

	 	<c:forEach var="imsi" items="${getAllUser}" varStatus="status" >
	 	<tr align="center">
		<td>${status.count}</td>
	 	<td id="username"><a href="/${imsi.id}?user_id=${imsi.username}" >${imsi.username}</a></td>
	 	<td>${imsi.name}</td>
	 	<td>${imsi.id}</td>
	 	<td>${imsi.email}</td>
		<td>${imsi.profileImageUrl}</td>
		<td>${fn:substring(imsi.createDate, 0, 10)}</td>
```	 	
	 	
4.5.2  회원 강제 탈퇴
- 위의 내용에 이어서, 회원들이 작성한 게시물을 조회한다.

1)admin/userList.jsp
```
		<td>
	 	<c:choose>
	 		<c:when test="${imsi.username != 'admin_user'}">
	 		${imsi.role}</td>
	 		  <td><a href="deleteMember?username=${imsi.username}" id="del1"><button type="button" class="btn btn-primary" id="btnout1">강제탈퇴</button></a></td>
	 		</c:when>
	 	</c:choose>
		</tr>
		</c:forEach>
		<td colspan="11">
			<button type="button" class="btn btn-primary" id="back" onclick="history.go(-1)">뒤로가기</button>
			<button type="button" class="btn btn-primary" id="list" onclick="location.href='adminMain'">관리자 메인창</button><br><br>
		</td>
	</table>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>	      
```	      
4.5.3  공지사항 작성
- 관리자 메인페이지에서 [공지사항]을 누르면 notice.jsp로 이동하며 공지사항 작성 권한이 주어진다.
- 회원들은 작성할 수 없었던 notice 카테고리를 선택하여 글을 작성할 수 있다.
	
![관리자-공지사항 (online-video-cutter com)](https://user-images.githubusercontent.com/78891624/129847973-fe75bded-206c-4bf3-bf3e-5ff0ce5a8f3c.gif)
	      
1) notice.jsp
```	
<%@ include file="../layout/header2.jsp"%>
<h1>공지사항(notice)</h1>
<hr>
 	<c:choose>
 		<c:when test="${principal.user.username == 'admin_user'}"> <!-- 관리자가 로그인했을 경우, 공지사항 글작성 권한을 주기위해 -->
 			<div align="right"><a href="adminWrite?user_id=${principal.user.username}"><button type="button" class="btn btn-info" id="writeBtn">
				<img src="../images/pencil.png" width="30"></button></a></div>
		</c:when>
	</c:choose>	
	<table align="center">
		<tbody style="width: 50%">
		 <div id="grid">
		   <c:choose>
			<c:when test="${principal.user.username == null}">
			
			<c:forEach var="imsi" items="${menu}"> 
		        	<div class='image1'><a href = 'detailView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}
					&num=${imsi.num}&date1=${imsi.date1}&writer=${imsi.user_id}&hit=${imsi.hit}&user_num=${imsi.user_num}'>
				<img id='hov1' src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}<br>조회수: ${imsi.hit}</h6></div>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="imsi" items="${menu}"> 		
					<div class='image1'><a href = 'detailView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}
					&num=${imsi.num}&date1=${imsi.date1}&user_id=${principal.user.username}&writer=${imsi.user_id}&hit=${imsi.hit}&user_num=${imsi.user_num}'>
				<img src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}<br>조회수: ${imsi.hit}</h6></div>
				</c:forEach>
			</c:otherwise>
		   </c:choose>		
		</tbody>
		</div>
			 <button type="button" class="btn btn-info" id="btnUpdate" onclick="history.go(-1)">뒤로가기</button>	
		</table>		
	</div>
		</div>
			</div>
<%@ include file="../layout/footer.jsp"%>
```	
4.5.4  모든 게시물, 댓글 접근 권한(수정, 삭제 권한)

![관리자-수정,삭제권한3-1_Trim](https://user-images.githubusercontent.com/78891624/129847958-bedb06f5-1e1d-4f18-bb37-b5fe33dcaa21.gif)
![관리자-수정,삭제권한3-2_Trim](https://user-images.githubusercontent.com/78891624/129847936-f2ca1075-0552-46b4-962a-55a37064b90a.gif)



