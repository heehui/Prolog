<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../views/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 상세 글</title>
<link rel="stylesheet" href="../css/loginboardrview.css">
<meta charset="utf-8"> <!-- 게시글 수정이 완료된 후 보이는 화면 -->
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
</script>
</head>
<body>
<%@ include file="../views/layout/header2.jsp"%>

<div id="container">
   <div class="second_container">

	<div class="lang">
		${lang} 게시판>
	</div>
		
	<div class="lang_two">
		작성자: ${writer}<br>
		작성일: ${menu.date1}
	</div>
 </div>		      
	
	<div class="main_title">
		제목) ${title} 
		<div>
            <img src="/upload/${image}" width="400" height="400">
         </div>
   	</div>
	 <div id="container2">
         <div class="main_textarea">
         <table>
            <tr>
               <td class="textarea">▶ 작성 내용:</td> </tr>
			<tr>
			   <td id = "contents" style='word-break:break-all'><textarea name="contents" cols="100" rows="15" readonly="readonly" wrap="hard">${contents}</textarea>
			   </td>
			</tr>
			    </table>
			<table align="left">
			<button type="button" class="btn btn-info" id="back" onclick="history.go(-1)" style="float:left;">뒤로가기</button>
			<button type="button" class="btn btn-info" id="list" onclick="board()" style="float:right;">목록</button>
			</table><br><br>
<div id="reply">
	<div align="left"> (${fn:length(reList)})개의 댓글</div>
<c:choose>
	<c:when test="${empty principal.user.username || principal.user.username == '비회원'}">

	</c:when>
	<c:otherwise>
	<section class="replyForm" align="left">
	<form action="writeReply" method="get">										
 	<p><label class="writer">작성자 :<b> ${user_id} </b></p>
 	<p><label for="content">댓글 내용</label><br>
 	<textarea id="content" name="content" rows="5" cols="100" placeholder="댓글을 입력해주세요"></textarea></p>
 		<input type="hidden" name="writer" value="${user_id}">
 		<input type="hidden" name="num" value="${num}">
  	<div style='width:150px; float: right;'>
 		<input type="submit" class="btn btn-info btn-sm" value="작성" >
	</div>
	</form>
	</section>
	</c:otherwise>
</c:choose>
 <c:forEach items="${reList}" var="list" varStatus="status">
  <pre>
  <b style="text-align: left">${list.writer}</b> 님     
  <h7 style="color: gray; text-align: right">작성일: ${list.regDate}</h7></pre>

<c:choose>
	<c:when test="${list.writer == user_id}">
		<div align="left"><textarea class="newContent" id="content" name="content" rows="5" cols="100" style="border: none; background-color:#F1FFFE ">${list.content}</textarea></div>
 	   <input type="hidden" id="reply_num" value="${list.reply_num}"><br>
       <input type="button" class="btn btn-info btn-sm" id="update1" value="수정" style="float:right;">
  	<a href="deleteReply?reply_num=${list.reply_num}"><input type="button" class="btn btn-info btn-sm" id="del" value="삭제" style="float:right;"></a><br><br>
	</c:when>
	<c:otherwise>
  		<textarea id="content" name="content" rows="5" cols="100" readonly="readonly" style="border: none; background-color:#F1FFFE ">${list.content}</textarea>
	</c:otherwise>
                  </c:choose>
               </c:forEach>
         </table>
      </div>
   </div>
</div>
				</div>
			</div><br><br>
	<%@ include file="../views/layout/footer.jsp"%>
</body>
</html>
