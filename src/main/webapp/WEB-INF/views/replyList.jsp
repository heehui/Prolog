<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/replyList.css">
</head>
<%@ include file="../views/layout/header.jsp"%>
<%@ include file="../views/layout/replyList_header.jsp"%>
<body>

	<table border="1" class="table" style="margin-top:50px; width: 70%; margin-left: auto; margin-right: auto;"> 
	<tr><td colspan="5"><b>댓글 수(${fn:length(myReplyList)})</b></td></tr>
	<tr>
		<th><b>No.</b></th>
		<th><b>작성일</b></th>
		<th><b>게시물 글번호</b></th>
		<th><b>댓글내용</b></th>
		<th><b>댓글 삭제</b></th>
	</tr>
	
	<c:choose>
		<c:when test="${fn:length(myReplyList) == 0}">
		<tr>
			<td colspan="5"><h2 style="color:gray;">작성된 댓글이 없습니다.</h2></td>
		</tr>
		</c:when>
		<c:otherwise>
	 	<c:forEach var="reply" items="${myReplyList}" varStatus="status" >
	 	<tr align="center">
			<td>${status.count}</td>
	 		<td>${fn:substring(reply.regDate, 0, 10)}</td>
	 		<td>${reply.num}</td>
	 		<td>${reply.content}</td>
	 		<td colspan="2"><a href="deleteReply?reply_num=${reply.reply_num}" id="del1"><button type="button" class="btn btn-primary" id="btnout1">댓글 삭제</button></a></td>
		</tr>
		</c:forEach>
	
		</c:otherwise>
	</c:choose>
	
		<td colspan="11">
			<button type="button" class="btn btn-primary" id="back" onclick="history.go(-1)">뒤로가기</button>
		</td>
	</table>
<%@ include file="../views/layout/footer.jsp"%>
</body>
</html>