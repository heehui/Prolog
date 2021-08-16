
# Spring boot와 Mybatis, JPA, MariaDB로 만든 '공유블로그 Prolog'
#### - 제가 맡은 게시판, 댓글, 관리자 기능 파트에 대해 작성했습니다. 
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

![flow_all](https://user-images.githubusercontent.com/78891624/129505514-018217db-5adb-4d0a-a54a-0a05bb7644d8.jpg)

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

![1조_발표동영상_Trim](https://user-images.githubusercontent.com/78891624/129296817-5ca25c2e-6e71-43b6-ac79-b18ffe2ade79.gif)

## 4. 프로젝트 설명

### 4.1 DB 쿼리문
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

#### 4.1 DB 테이블 쿼리문

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

#### 4.2 환경설정
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


#### 4.3 게시판 기능

 * BoardVO.java
- lombok을 이용하여 @Data로 각 변수값의 setter, getter를 자동으로 생성시켜준다.

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

1)  write.jsp
- 게시판 카테고리명, 제목, 이미지, 내용, 회원번호, 회원아이디를 form을 통해 /writerAfter 로 보낸다.
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
- Service에서는 MyBatis의 addBoard로 실행시킨다.
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
- num(글번호)는 쿼리문에서 자동 수 증가를 해줬기 때문에 useGeneratedKeys="true" keyProperty="num" 를 지정해줌
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

- 글 작성 버튼을 누르면 Controller의 /write로 와서 글쓰기 페이지가 나타난다.

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

- 글쓰기 페이지에서 게시판 카테고리명, 제목, 이미지, 내용을 입력한 후 [발행]을 누르면 /writeAfter 로 오게 된다.
(입력한 값들을 @RequestParam을 통해 파라미터로 가져오고, user_id(회원아이디)는 session에 저장해둔다.)
- 첨부 이미지를 db에 저장하기 위해, 이미지가 저장될 외부 경로 path를 지정하여 이미지파일의 이름을 가져온다.
- 게시물 내용은 개행도 db에 저장될 수 있도록 replace를 이용하여 enter(즉, \r\n)를 <br> 태그로 저장되도록 한다.
- BoardService1에서 생성한 addBoard를 불러와 각 파라미터값들을 넣어 insert되도록 한다.


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

##### 4.3.2 게시물 조회
###### 4.3.2.1 전체 게시판 조회

1) board/mainBoard.jsp
- ajax를 통해 Controller에 boardList 로 요청을 보내면
컨트롤러 -> mapper 인터페이스 -> mapper.xml에서 쿼리를 실행해 이 값을 현재 mainBoard.jsp의 result에 데이터 값을 가지고 오게 된다.
- forEach문과 grid CSS를 적용하여 html을 생성해 tbody 부분에 섬네일 형식으로 append 시켜준다. (섬네일에 나타나는 것: 이미지, 작성일, 조회수) 
- 그리고 각 섬네일을 클릭하면, 그에 맞는 게시물 정보를 컨트롤러 detailView 로 보내 detailView.jsp가 실행되도록 한다.
	
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
2) BoardDAO.java
- 게시물 전체 조회에 대한 mapper 메소드를 생성한다.
```
	public List<BoardVO> getAllBoard();
```

3) BoardService.java
- Service에서는 MyBatis의 getAllBoard로 실행시킨 데이터를 List에 담아서 컨트롤러로 보낸다.
```	
	public List<BoardVO> getAllBoard(){
		return bdao.getAllBoard();
	}
```	
4) mybatismapper.xml
- 모든 값을 select하고 작성일은 2021-08-12 13:09:37 형태로 포맷한다.
- 글번호(num)을 기준으로 정렬한다.

```
<select id="getAllBoard" resultType="com.cos.prologstart.vo.BoardVO">
	SELECT
		user_id,user_num, num, lang, title, contents, image, DATE_FORMAT(date1, '%Y-%m-%d %T') as 'date1',hit, reply_cnt

	FROM
		boardTable2
	ORDER BY num desc
</select>
```


5) BoardController1.java
- Controller에서는 boardList로 받은 요청을 Service로 넘겨준다. 

```
@GetMapping("/boardList")
@ResponseBody public List<BoardVO> boardList(){ 
 	return bs.getAllBoard(); //전체 게시판 모두 조회 

}
```
- 각 게시판의 섬네일을 누르면 Controller의 @GetMapping("/detailView")로 이동한다.
- 각 파라미터 값을 Model을 이용하여 detailView.jsp로 보낸다.
- 게시물의 내용은 db에 enter(= \r\n)를 <br> 태그로 저장했기 때문에 다시 replace를 통해 \r\n로 변경하여 출력되도록 한다.

```
@GetMapping("/detailView") //게시글 상세보기를 누르면 보이는 화면
	public String loginview(
			HttpServletRequest req, HttpSession session,
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
		 contents = contents.replace("<br>", "\r\n");
		
		model1.addAttribute("num", num);
		model1.addAttribute("title", title);
		model1.addAttribute("image", image);
		model1.addAttribute("lang", lang);
		model1.addAttribute("contents", contents);
		model1.addAttribute("date1", date1);
		model1.addAttribute("writer", writer);
		model1.addAttribute("user_num", user_num);
		model1.addAttribute("hit", bs.hitCount(num));
		
		
		String user_id =req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		List<ReplyVO> reList = bs.readReply(num);//댓글이 보이도록
		model1.addAttribute("reList", reList);//List로 넘김
		
		return "detailView"; 
	}
```
6) detailView.jsp
- 각 게시판에서 섬네일을 클릭하면 위의 Controller와 같이 해당 상세페이지로 이동하게 된다.
- 클릭한 게시물의 작성자가 로그인한 회원아이디와 같다면, 게시물을 수정 및 삭제 할 수 있는 권한이 있다.
- 비회원이나, 로그인한 회원이 해당 게시물 작성자와 다르다면 수정 및 삭제 버튼이 보이지 않는다.
- [수정]을 누르면 Controller의 updateForm로 이동한다.
- [삭제]를 누르면 Controller의 delete로 이동한다.
```
<%@ include file="../views/layout/header2.jsp"%>

<script>
   
   function board(){
      location.href="board";
   }

</script>
</head>
<body>

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

            <table align="left">
                <button type="button" class="btn btn-info" id="back" onclick="history.go(-1)">뒤로가기</button>
                  <button type="button" class="btn btn-info" id="list" onclick="board()" >목록</button><br><br>
      
   
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
	

###### 4.3.2.2  java, html, javascript, spring 게시판 조회
		
1) board/html.jsp (java, javascript, spring 게시판도 동일)
- c 태그라이브러리를 이용하여 비회원, 회원 권한을 나눌 수 있도록 한다.
- 로그인 회원이라면, controller의 write(글쓰기)가 가능하도록 한다.
- 비회원이라면(아이디가 null이라면), 글쓰기 버튼은 보이지 않고 각 게시판의 게시물을 읽을 수 있는 권한만 갖게 된다. 
```
 <%@ include file="../layout/header2.jsp"%><br>
 	<h1>HTML 게시판</h1>
	<hr>
 	<c:choose>
 		<c:when test="${principal.user.username != null }"> <!-- 회원이라면 -->
 				<div align="right"><a href="write?user_id=${principal.user.username}"><button type="button" class="btn btn-info" id="writeBtn">
				<img src="../images/pencil.png" width="30"></button></a></div>
		</c:when>
	</c:choose>		
		
	<table align="center">
		<tbody style="width: 50%">
		<div id="grid">
		<c:choose>
			<c:when test="${principal.user.username == null}"> <!-- 비회원이라면 -->
			<c:forEach var="imsi" items="${menu}">        				
			<div class='image1'>
		<a href = 'detailView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}
			   &num=${imsi.num}&date1=${imsi.date1}&writer=${imsi.user_id}&hit=${imsi.hit}&user_num=${imsi.user_num}'>
		<img id='hov1' src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1} <br>조회수: ${imsi.hit}</h6> </div>
			</c:forEach>
			</c:when>
			<c:otherwise>
			<c:forEach var="imsi" items="${menu}"> 
		        	<div class='image1'>
				<a href = 'detailView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}										   &num=${imsi.num}&date1=${imsi.date1}&user_id=${principal.user.username}&writer=${imsi.user_id}&hit=${imsi.hit}
					   &user_num=${imsi.user_num}&user_num=${imsi.user_num}'>
				<img src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}<br>조회수: ${imsi.hit}</h6>				</div>
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
</body>
</html>
```
	
2) BoardDAO.java
- 각 게시판 이름(lang)에 따라 게시판 조회에 대한 mapper 메소드를 생성한다.
```
	public List<BoardVO> getMenu(String lang);
```
3) BoardService.java
- Service에서는 MyBatis의 getMenu로 실행시킨 데이터를 List에 담아서 컨트롤러로 보낸다.
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
- layout/header2.jsp에 생성된 게시판 메뉴 버튼에서 html 버튼을 클릭하면, 
html을 lang값으로 받아와서 controller의 @GetMapping("/html")-> Serivce -> 매퍼 인터페이스 -> mapper.xml에서 쿼리값을 board/html.jsp로 이동한다.

```
@GetMapping("/html")//
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
- 게시물 작성자가 로그인한 회원과 같다면 detailView.jsp에서 [수정]버튼이 생성된다.
- [수정]을 누르면 다음과 같이 Controller의 updateForm로 이동하여 수정할 수 있는 페이지로 이동하게 된다.
-- BoardController1.java
```	
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
```

1) updateView.jsp
- detailView.jsp의 값을 그대로 갖고 있지만, 수정할 수 있도록 <input>태그로 만들어 주었다.
- 게시판 카테고리, 제목, 내용을 수정할 수 있다.
- 이미지, 작성자는 바뀌지 않는다.
- 작성일은 [수정완료]를 누르면 Controller의 updateclear로 이동한다.
```
<%@ include file="../views/layout/header.jsp"%>
<script>
	function board(){
		location.href="board";
	}

</script>
</head>
<body>
<%@ include file="../views/layout/header2.jsp"%>
<div class="jumbotron text-center" style="margin-bottom:0; margin-top:0;">
  <h1>게시판 글 수정</h1>
</div>
	
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
- Service에서는 MyBatis의 updateclear를 실행시킨 후 데이터를 컨트롤러로 보낸다.
```
public int updateclear(int num, String lang,String title,String image, String contents) {
	return bdao.updateclear(num, lang, title, image,contents);
}	
```
4) mybatismapper.xml
- 글번호(num)을 조건문으로 하여 해당 게시물의 카테고리명, 제목, 이미지, 내용을 수정된다.
- 작성일은 NOW()를 통해 수정한 날짜로 업데이트 되도록 한다.
```
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
```
5) BoardController1.java
- updateView.jsp에서 게시물을 수정하고[수정완료]를 누르면 Controller의 updateclear로 이동한다.
- db에 저장된 게시물 내용을 개행 처리해주고,   
```
  @GetMapping("/updateclear")//수정완료가 되면
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
	
2) BoardDAO.java
- 글번호, 카테고리명, 제목, 이미지, 내용 값을 매개변수로 하는 mapper 메소드를 생성한다.
```
public int updateclear(int num,String lang,String title,String image, String contents);
```
3) BoardService.java
- Service에서는 MyBatis의 updateclear를 실행시킨 후 데이터를 컨트롤러로 보낸다.
```
public int updateclear(int num, String lang,String title,String image, String contents) {
	return bdao.updateclear(num, lang, title, image,contents);
}	
```
4) mybatismapper.xml
- 글번호(num)을 조건문으로 하여 해당 게시물의 카테고리명, 제목, 이미지, 내용을 수정된다.
- 작성일은 NOW()를 통해 수정한 날짜로 업데이트 되도록 한다.
```
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
```
6) view.jsp
- [수정완료]를 누르면 해당 페이지로 이동한다.
```
<%@ include file="../views/layout/header2.jsp"%>
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
		<table align="left">
			<button type="button" class="btn btn-info" id="back" onclick="history.go(-1)" style="float:left;">뒤로가기</button>
			<button type="button" class="btn btn-info" id="list" onclick="board()" style="float:right;">목록</button>
		</table>
```
4.3.4 게시물 삭제
1) BoardDAO.java
2) BoardService.java
3) BoardController1.java

4.3.5 마이페이지
1) BoardDAO.java
2) BoardService.java
3) BoardController1.java 
4) profile.jsp


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


