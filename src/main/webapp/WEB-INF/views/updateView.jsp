<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../views/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<link rel="stylesheet" href="../css/loginboardrview.css">
<meta charset="utf-8"> <!-- 게시글 상세보기에서 수정 버튼 누르면 나오는 화면 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
 #contents{
		background-color: #e2f5fb;
		width: 50%;
		position: "center";
	}
	
	#back{ float: left;}
	 #list{ float: right; }
	 
	  #contents{
	white-space:pre-line;
	}
</style>
<script>
	function board(){
		location.href="board";
	}
	
	
	function refresh(){
		location.reload();
	 }     

</script>
</head>
<body>
<%@ include file="../views/layout/header2.jsp"%>
<div class="jumbotron text-center" style="margin-bottom:0; margin-top:0;">
  <h1>게시판 글 수정</h1>
</div>
	
<div id="container">
   <div class="second_container">

	<div class="lang"> ${lang} 게시판></div></h2>
	     <form action="updateclear" method="get" enctype="multipart/form-data">
	      <select name="lang">
	      	<option value="none">게시판 카테고리를 선택해주세요</option>
	      	<option value="java">java</option>
	      	<option value="javascript">javascript</option>
	      	<option value="spring">spring</option>
	      	<option value="html">html</option>
	      </select>
	      <div class="lang_two">
				작성자: ${writer}<br>
				작성일: ${date1}
		   </div>
	       
			     <div class="main_title">
			     	제목) <input type="text" name="title" size="40" value="${title}" style="font-size:12pt; font-weight:bold;" >
			     </div>
				
		<div>
	 		<img src="/upload/${image}" width="400" height="400">
		</div>
		
		</div>
	</div>
	
		
			
		<div id="container2">
         	<div class="main_textarea">
        	 <table>
			     <tr>
               		<td class="textarea">▶ 작성 내용:</td>
            	 </tr>
			     <tr>
			     	<td id = "contents" style='word-break:break-all'>
			       <textarea name="contents" cols="100" rows="15" wrap="hard">${contents}</textarea></td></tr>
			   </table>
			    	<%-- <input type="hidden" name="lang" value="${lang}"> --%>
			    	<input type="hidden" name="image" value="${image}"> 
			    	<input type="hidden" name="num" value="${num}">
			     	<input type="hidden" name="writer" value="${principal.user.username}">  
			    	<input type="submit" class="btn btn-info btn-sm" value="수정완료" style="float: center">
			    </form>
			  
			   <table align="left">
  				    <button type="button" class="btn btn-info" id="back" onclick="history.go(-1)">뒤로가기</button>
					<button type="button" class="btn btn-info" id="list" onclick="board()">목록</button><br><br>
				
				</table>

<%@ include file="../views/layout/footer.jsp"%>
</body>
</html>
