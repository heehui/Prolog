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
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

 	<%@ include file="../layout/header2.jsp"%>
 	<h1>Spring 게시판</h1>
					<hr>
 			<c:choose>
 				<c:when test="${principal.user.username != null}">
 						<div align="right"><a href="write?user_id=${principal.user.username}"><button type="button" class="btn btn-info" id="writeBtn"><img src="../images/pencil.png" width="30"></button></a></div>
				</c:when>
			</c:choose>		
					</table>
					<br>
					<table align="center">

			<tbody style="width: 50%">
			<div id="grid">
			<c:choose>
			<c:when test="${principal.user.username == null}">
			
			<c:forEach var="imsi" items="${menu}"> 
		        				
					<div class='image1'><a href = 'loginboardView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}&num=${imsi.num}&date1=${imsi.date1}&writer=${imsi.user_id}'>
						 <img id='hov1' src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}</h6></div>
				</c:forEach>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="imsi" items="${menu}"> 
		        				
					<div class='image1'><a href = 'loginboardView?contents=${imsi.contents}&image=${imsi.image}&title=${imsi.title}&lang=${imsi.lang}&num=${imsi.num}&date1=${imsi.date1}&user_id=${principal.user.username}&writer=${imsi.user_id}'>
						 <img src='/upload/${imsi.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${imsi.date1}</h6></div>
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