<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../views/layout/header.jsp"%>
<link rel="stylesheet" href="../css/board.css">
<!--프로필 섹션-->
<section class="profile">
	<!--유저정보 컨테이너-->
	<div class="profileContainer">

		<!--유저이미지-->
		<div class="profile-left">
			<div class="profile-img-wrap story-border"
				onclick="popup('.modal-image')">
				
				
				<form id="userProfileImageForm">
					<input type="file" name="profileImageFile" style="display: none;"
						id="userProfileImageInput" />
				</form>


				<img class="profile-image" src="/upload/${dto.user.profileImageUrl}"
					onerror="this.src='/images/person.jpeg'" id="userProfileImage" />
			</div>
		</div>
		<!--유저이미지end-->

		<!--유저정보 및 사진등록 구독하기-->
		<div class="profile-right">
            <div class="name-group">
                <h2>${dto.user.username}<br>(${dto.user.name})</h2>

                <c:choose>
                    <c:when test="${dto.pageOwnerState}">
                    	<c:if test="${dto.user.username == 'admin_user'}">
                    		<button class="cta" onclick="location.href='adminWrite'">새 글 등록</button>
                    	</c:if>
                    	<c:if test="${dto.user.username != 'admin_user'}">
                    		      <button class="cta" onclick="location.href='write'">새 글 등록</button>
                    	</c:if>
                        <button class="cta" onclick="location.href='myReplyList?user_id=${principal.user.username}'">내가 작성한 댓글 보기</button>
                    </c:when>

                </c:choose>

                <c:choose>
                    <c:when test="${dto.pageOwnerState}">
                        <button class="modi" onclick="popup('.modal-info')">
                    <i class="fas fa-cog"></i>
                </button>
                    </c:when>

                </c:choose>

            </div>

			<div class="subscribe">
				<ul>
					<li><a href=""> 게시물<span>${fn:length(menu)}</span>
					</a></li>
					<li><a href="javascript:subscribeInfoModalOpen(${dto.user.id});"> 구독정보<span>${dto.subscribeCount}</span>
					</a></li>
				</ul>
			</div>
			<div class="state">
				<h4>${dto.user.bio}</h4>
				<h4>${dto.user.website}</h4>
			</div>
			
		</div>
		<!--유저정보 및 사진등록 구독하기-->

	</div>
</section>

<!--게시물컨섹션-->
<section id="tab-content">
	<!--게시물컨컨테이너-->
	<div class="profileContainer">
		<!--그냥 감싸는 div (지우면이미지커짐)-->
		<div id="tab-1-content" class="tab-content-item show">
			<!--게시물컨 그리드배열-->
			<div class="tab-1-content-inner">


				<!--아이템들-->

 		<div class="row">	
				
				<h2>
					<c:choose>
						<c:when test="${dto.pageOwnerState}">
							내가 작성한 글 
						</c:when>
					<c:otherwise>
						${dto.user.username}님의 게시물
					</c:otherwise>
				</c:choose> </h2>
	<c:choose>
		<c:when test="${fn:length(menu) == 0}">
		<table align="center">
		<tbody style="width: 50%;">
			<h4 style="color: gray;">등록된 게시물이 없습니다.</h4>
		</tbody>
		</c:when>
		<c:otherwise>
		<table align="center">
			<tbody style="width: 50%">
			<div id="grid">
				<c:forEach var="menu" items="${menu}"> 
					<div class='image1'><a href = 'detailView?contents=${menu.contents}&image=${menu.image}&title=${menu.title}&lang=${menu.lang}&num=${menu.num}&date1=${menu.date1}&user_id=${principal.user.username}&writer=${menu.user_id}&hit=${menu.hit}&user_num=${menu.user_num}'>
						 <img src='/upload/${menu.image}' width="200" height="200"></a><h6 id='date1'>작성일: ${menu.date1}</h6></div>
				</c:forEach>
		
			 </tbody>
			 </div>
		</c:otherwise>
	</c:choose>	
			 		<td><button type="button" class="btn btn-info" id="btnUpdate" onclick="history.go(-1)">뒤로가기</button></td>
					<td><button type="button" class="btn btn-info" id="btnUpdate" onclick="location.href='board'" style="float:right;">목록</button></td><br><br>
			 </table>
					
			</div>
			</div>
			</div>

				<!--아이템들end-->
</section>

<!--로그아웃, 회원정보변경 모달-->
<div class="modal-info" onclick="modalInfo()">
	<div class="modal">
		<button onclick="location.href='/${dto.user.id}/update'">회원정보 변경</button>
		<button onclick="location.href='/logout'">로그아웃</button>
		<button onclick="closePopup('.modal-info')">취소</button>
	</div>
</div>
<!--로그아웃, 회원정보변경 모달 end-->

<!--프로필사진 바꾸기 모달-->
<div class="modal-image" onclick="modalImage()">
	<div class="modal">
		<p>프로필 사진 바꾸기</p>
		<button onclick="profileImageUpload(${dto.user.id}, ${principal.user.id})">사진 업로드</button>
		<button onclick="closePopup('.modal-image')">취소</button>
	</div>
</div>

<!--프로필사진 바꾸기 모달end-->

<div class="modal-subscribe">
	<div class="subscribe">
		<div class="subscribe-header">
			<span>구독정보</span>
			<button onclick="modalClose()">
				<i class="fas fa-times"></i>
			</button>
		</div>

		<div class="subscribe-list" id="subscribeModalList">
		</div>
	</div>
</div>


<script src="/js/profile.js"></script>

<%@ include file="../views/layout/footer.jsp"%>