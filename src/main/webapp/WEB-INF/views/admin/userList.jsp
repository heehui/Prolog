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
<style>
  table, th, td { border: 1px solid #bcbcbc; font-size: 20; text-align: center;}
  table { width: 40%; height: 100px;}
</style>
</head>
<script>
/* $("[id^=btn]").on('click', function(event){ 
var id = $(this).attr("id"); 
var number = id.replace("btn", ""); 
alert(number); 

}); */


</script>
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
    .table caption{caption-side: bottom; display: none;}
  </style>
<%@ include file="../admin/header.jsp"%>
<body>

	<table border="1" align="center" class="table" style="margin-top:50px;"> 
	<caption>회원목록</caption>
	<tr><td colspan="2" align="left"><b>회원수(${fn:length(getAllUser)})</b></td> 
	<tr>
		<th><b>No.</b></th>
		<th><b>회원 아이디</b></th>
		<!-- <th><b>회원비번</b></th> -->
		<th><b>이름</b></th>
		<th><b>회원번호</b></th>
		<th><b>이메일</b></th>
		<!-- <th><b>전화번호</b></th>
		<th><b>성별</b></th> -->
		<th><b>사진</b></th>
		<th><b>가입일</b></th>
		<th><b>권한</b></th>
		<th><b>선택</b></th></tr>

	 	<c:forEach var="imsi" items="${getAllUser}" varStatus="status" >
	 	<tr align="center">
		<td>${status.count}</td>
	 	<td id="username"><a href="/${imsi.id}?user_id=${imsi.username}" >${imsi.username}</a></td>
<%-- 	 	<td>${imsi.password}</td> --%>
	 	<td>${imsi.name}</td>
	 	<td>${imsi.id}</td>
	 	<td>${imsi.email}</td>
		<%-- <td>${imsi.phone}</td>
		<td>${imsi.gender}</td> --%>
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