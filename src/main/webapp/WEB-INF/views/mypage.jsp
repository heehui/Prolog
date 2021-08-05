<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="../css/board.css">
<title>게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
   
	function board(){
		location.href="board";
	}
</script>
</head>
<body>
<%@ include file="../views/layout/header2.jsp"%>
 	<div class="container" style="margin-top: 30px">	
 		<div class="row">	
 <c:choose>
 	<c:when test="${empty principal.user.username || principal.user.username == '비회원'}">
		
 	<script src="../js/no_member.js"></script>
 	</c:when>
 	<c:otherwise>
 			<div class="col-sm-12">			
				<h1 style="text-align: center">${principal.user.username}님의 마이페이지</h1><br>
				
				<h2>내가 작성한 글</h2>
					<table align="center">

			<tbody style="width: 50%">
			<div id="grid">
				<c:forEach var="imsi" items="${menu}"> 
		        				
					<div class='image1'><a href = 'loginboardView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}&num=${imsi.num}&date1=${imsi.date1}&user_id=${principal.user.username}&writer=${principal.user.username}'>
						 <img src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}</h6></div>
				</c:forEach>
				
					
			 </tbody>
			 </div>
			 		<button type="button" class="btn btn-primary" id="btnUpdate" onclick="history.go(-1)">뒤로가기</button>
			<button type="button" class="btn btn-primary" id="btnUpdate" onclick="board()">목록</button><br><br>
			 </table>
					
			</div>
			</div>
			</div>
	</c:otherwise>
	</c:choose>

</body>
</html>