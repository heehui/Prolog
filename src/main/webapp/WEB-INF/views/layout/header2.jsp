<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize> <!-- 시큐리티 태그랄이브러리 -->



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prolog</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/board.css">
<script src="js/jquery-3.5.1.js"></script>
<body>
	
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				
				<table id="example" class="display" style="width: 50%">
				<div id="total_btn"> 
					<a href="board"><button id="btn1">전체 게시판</button></a>
					<a href="java?lang=java&user_id=${member.user_id}"><button id="btn1">java</button></a>
					<a href="javascript?lang=javascript&user_id=${member.user_id}"><button id="btn2">javascript</button></a>
					<a href="spring?lang=spring&user_id=${member.user_id}"><button id="btn3">spring</button></a>
					<a href="html?lang=html&user_id=${member.user_id}"><button id="btn4">html</button></a>
 					<a href="notice?lang=notice&user_id=${member.user_id}"><button id="btn4">공지사항</button></a>
 				</div> <br>
 		<div align="right">	
 			<form action="getSearchList" method="get">
				<select name="type">
				  <option selected="selected" value="">선택</option>
				  <option value="title">제목</option>
				  <option value="contents">내용</option>
				  <option value="writer">작성자</option>
				</select>
					<input id="input2" type="text" name="keyword">
					 <input id="input3" type="submit" value="검색">
			</form> 	
		</div>	