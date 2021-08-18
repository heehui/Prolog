<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/replyList.css">
<%@ include file="../admin/header.jsp"%>
<body>

	<table border="1" class="table" style="margin-top:50px; width: 95%; margin-left: auto; margin-right: auto;"> 
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
	 	
	 	
	 	<td>
	 	<c:choose>
	 		<c:when test="${imsi.username != 'admin_user'}">
	 		${imsi.role}</td><td>
	 			<a href="deleteMember?username=${imsi.username}" id="del1"><button type="button" class="btn btn-primary" id="btnout1">강제탈퇴</button></a></td>
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