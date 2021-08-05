<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>글쓰기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@ include file="../views/layout/header.jsp"%>  <!-- 글쓰기 화면  -->

<div style="margin-bottom:10px"></div>

<main class="uploadContainer">
           <!--게시글업로드 박스-->
            <section class="upload">
               
               <!--게시글 업로드 로고-->
                <div class="upload-top">
                    <a href="index.jsp" class="">
                        <img src="/images/logo_t.jpg" alt="">
                    </a>
                    <p>게시글 업로드</p>
                </div>
                <!--게시글 업로드 로고 end-->

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      
	        <form action="writeAfter" method = "post" enctype="multipart/form-data">
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
			    
			      <input type="file" class="form-control-file border" id="img" name="file" multiple="multiple"><br>
			    
			    </div>
			    <div class="form-group">
				  <label for="comment">내용:</label>
				  <textarea class="caption" required="required" name="contents" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
				</div>
				<input type="hidden" name="user_id" value="${principal.user.username}">
			    <button type="submit" class="btn btn-info">발행</button>
			  </form>
			</div>
		</div>
	</div>
  </section>
            <!--게시글업로드 박스 end-->
</main>
	
</body>
</html>
