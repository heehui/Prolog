<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/nav_style.css">     
</head>

<body> 
	<div class="container" align="center">
		<div> 
			<ul class="list">
				<li ><pre><b><h1>        ADMIN PAGE</h1></b></li></pre> 		
				<li><a href="board"><h3>회원용게시판</h3></a></li>
				<li><a href="userList"><h3>회원강제탈퇴</h3></a></li>
				<li><a href="notice?user_id=${user_id}&lang=notice"><h3>공지사항</h3></a></li> 
			</ul>
		</div> 
	</div>
	<br><br><br>  
	
</body>
</html>