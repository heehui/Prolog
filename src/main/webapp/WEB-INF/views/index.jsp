<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prolog</title>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
</head>

<body>


	<script type="text/javascript">
		function kaja(bada) {
			if (bada.style.display == "none") {
				bada.style.display = "block";
			} else {
				bada.style.display = "none";
			}
		}
	</script>
<body>
	<div id="container">
		<div id="container2">
			<form action="/mainController" method="post">
				<div id="logo">
					<h1>
						<a class="a" href="/">Prolog</a>
					</h1>

					<input id="input3" type="submit" value="검색"> <input
						id="input2" type="text" name="검색">
				</div>
				<div id="nav">
					<c:choose>
						<c:when test="${principal.user.username == 'admin_user'}">

							<ul align="right">
								<a href="/admin_index">관리자페이지</a>
								<li><a>Java</a></li>
								<li><a>Javascript</a></li>
								<li><a>Spring</a></li>
								<li><a>Html</a></li>
								<li><a>Css</a></li>
							</ul>
						</c:when>
					</c:choose>

					<ul>
						<a href="/board">˘ 개발언어</a>
						<!--	<li><a>Java</a></li>
				<li><a>Javascript</a></li>
				<li><a>Spring</a></li>
				<li><a>Html</a></li>
				<li><a>Css</a></li> 		-->
					</ul>

					<ul>
						<a href="/board/popular">˘ 인기글</a>

					</ul>
				</div>

				<div id="wrapper">
					<img src="/images/main.jpg"> <img src="/images/sub1.jpg">
					<img src="/images/sub2.png"> <img src="/images/sub3.jpg">
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../views/layout/footer.jsp"%>
</body>
</html>