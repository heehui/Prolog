<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize> <!-- 시큐리티 태그라이브러리 -->



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="../css/board.css">
<script src="js/jquery-3.5.1.js"></script>
<title>Prolog</title>

	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Style -->
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/story.css">
	<link rel="stylesheet" href="/css/popular.css">
	<link rel="stylesheet" href="/css/profile.css">
	<link rel="stylesheet" href="/css/upload.css">
	<link rel="stylesheet" href="/css/update.css">
	<!-- <link rel="shortcut icon" href="/images/insta.svg">
 -->	
	<!-- Fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	
	<header class="header">
 				
		<div class="container">
			<a href="/" class="logo">
				Prolog
			</a>
			<nav class="navi">
				<ul class="navi-list">
					<li class="navi-item"><a href="/index">
							<i class="fas fa-home"></i>
						</a></li>
					<li class="navi-item">
					<c:choose>
						<c:when test="${principal.user.id == null}">
							<a href="/board">
						</c:when>
						<c:otherwise>
							<a href="/board/profileList">
						</c:otherwise>
					</c:choose>
							<i class="fa fa-bars"></i>
						</a></li>																		<!-- title : 마우스 올리면 로그인한 회원아이디가 뜨도록 -->
					<li class="navi-item"><a href="/${principal.user.id}?user_id=${principal.user.username}" title="${principal.user.username}(${principal.user.name})님 로그인중">
							<i class="far fa-user"></i>
						</a></li>
				</ul>
			</nav>
		</div>
		
		
	</header>
