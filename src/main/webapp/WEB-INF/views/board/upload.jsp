<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="../layout/header.jsp" %>

    <!--게시글 업로드페이지 중앙배치-->
        <main class="uploadContainer">
           <!--게시글업로드 박스-->
            <section class="upload">
               <div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12"><!-- ////작동안됨.. -->
	      <h2>글쓰기</h2>
	        <form action="myWriteAfter" method = "post" class="upload-form" enctype="multipart/form-data">
	        	<div class="form-group">
				  <select name="lang">
				  <option value="java">java</option>
				  <option value="javascript">javascript</option>
				  <option value="spring">spring</option>
				  <option value="html">html</option>
				  </select>
				</div>
				<div class="form-group">
				  <label for="usr">제목:</label>
				  <input type="text" class="form-control" id="title" name = "title">
				</div>
			    <div class="form-group">
               <!--게시글 업로드 로고-->
                <div class="upload-top">
                    <a href="index.jsp" class="">
                        <img src="/images/logo_t.jpg" alt="">
                    </a>
                    <p>게시글 업로드</p>
                </div>
                <!--게시글 업로드 로고 end-->
                
                <!--게시글 업로드 Form-->
               <!--  <form class="upload-form" action="/board" method="post" enctype="multipart/form-data"> -->	<!-- 여러종류의 타입을 묶어서 전송할때 쓴ㄷㅏ -->
                    <input  type="file" name="file"  onchange="imageChoose(this)"/>
                    <div class="upload-img">
                        <img src="/images/preview.jpg" alt="" id="imageUploadPreview" />
                    </div>
                    
                    <!--글 작성란 + 업로드버튼-->
                    <div class="upload-form-detail">
                   		 <textarea class="caption" name = "contents" required="required" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
                    <input type="hidden" name="user_id" value="${principal.user.username}">
                        <button class="cta blue">업로드</button>
                    </div>
                    <!--글 작성 end-->
                    
                </form>
                <!--게시글 업로드 Form-->
            </section>
            <!--게시글업로드 박스 end-->
        </main>
        <br/><br/>
	
	<script src="/js/upload.js" ></script>
    <%@ include file="../layout/footer.jsp" %>