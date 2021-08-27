<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
 	<%@ include file="../layout/header2.jsp"%><br>
 	<h1>회원 프로필 리스트</h1>
		<hr>	
		<table align="center">
			<tbody style="width: 50%">
			<div id="grid">
			<c:forEach var="board" items="${menu}">
					<div id="total_btn2"><a href="/${board.id}?user_id=${board.username}">
					<img src="/upload/${board.profileImageUrl}" onError="this.src='/images/none.png'" width="200" height="200"/></a></div>
			</c:forEach>	
			 </div>
			 		<button type="button" class="btn btn-info" id="btnUpdate" onclick="history.go(-1)">뒤로가기</button>	
			 </table>
	
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>

