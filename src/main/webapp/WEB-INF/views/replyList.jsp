<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../views/layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table, th, td { border: 1px solid #bcbcbc; font-size: 20; text-align: center;}
  table { width: 40%; height: 50px;}
</style>
</head>
 <style>
    .table {
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #0A91AB;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: top;}
  </style>
 <%@ include file="../views/layout/replyList_header.jsp"%>
<body>

	<table border="1" align="center" class="table" style="margin-top:50px;"> 
	<tr><td colspan="5" align="left"><b>댓글 수(${fn:length(myReplyList)})</b></td></tr>
	<tr>
		<th><b>No.</b></th>
		<th><b>작성일</b></th>
		<th><b>게시물 글번호</b></th>
		<th><b>댓글내용</b></th>
		<th><b>댓글 삭제</b></th>

	 	<c:forEach var="reply" items="${myReplyList}" varStatus="status" >
	 	<tr align="center">
			<td>${status.count}</td>
	 		<td>${fn:substring(reply.regDate, 0, 10)}</td>
	 		<td>${reply.num}</td>
	 		<td>${reply.content}</td>
	 		<td colspan="2"><a href="deleteReply?reply_num=${reply.reply_num}" id="del1"><button type="button" class="btn btn-primary" id="btnout1">댓글 삭제</button></a></td>
		</tr>
		</c:forEach>
		
		<td colspan="11">
			<button type="button" class="btn btn-primary" id="back" onclick="history.go(-1)">뒤로가기</button>
		</td>
	</table>
<%@ include file="../views/layout/footer.jsp"%>
</body>
</html>