<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../views/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판</title> <!-- 게시글 상세보기 화면 -->
<link rel="stylesheet" href="../css/loginboardrview.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-3.5.1.js"></script>
<style>
 #contents{
      background-color: #e2f5fb;
      width: 100%;
      position: "center";
       border-radius: 15px;
   }
 #back{ float: left;}
 #list{ float: right; }
   
/*   #contents{
	white-space:pre-line; /* 수정 */
	} */
</style>


<%@ include file="../views/layout/header2.jsp"%>

<script>
   
   $(document).on('click','#update1', function () {

      var content = $('.newContent').val();
      var reply_num = $('#reply_num').val();
      location.href="updateReply?reply_num=" + reply_num + "&content=" + content;
   }); 
   
   function board(){
      location.href="board";
   }


</script>
</head>
<body>

<div id="container">
   <div class="second_container">
      <div class="jumbotron-text">
           (${user_id}님 환영합니다♥)
      </div>
      
       <div class="lang"> 
               ▶ ${lang} 게시판>
       </div>
       
      <div class="lang_two">
         작성자: <a href="/${user_num}?user_id=${writer}" >${writer}</a><br>
         작성일: ${date1}
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
               <td class="textarea">▶ 작성 내용:</td>
            </tr>

            <tr>
               <td id="contents" >
               <textarea rows="20" cols="100" id="contents" name="contents" readonly style="word-wrap:break-word; white-space: pre-line;">
                  ${contents}
               </textarea>
               </td>

            <table align="left">
                <button type="button" class="btn btn-info" id="back" onclick="history.go(-1)">뒤로가기</button>
                  <button type="button" class="btn btn-info" id="list" onclick="board()" >목록</button><br><br>
      
   
         <c:choose>
            <c:when test="${writer == user_id || user_id == 'admin_user' && user_id != '비회원'}">
             
                 <form action="updateForm" method="get" enctype="multipart/form-data">
                   <input type="hidden" name="title" value="${title}">
                   <input type="hidden" name="image" value="${image}">
                   <input type="hidden" name="contents" value="${contents}">
                   <input type="hidden" name="lang" value="${lang}">
                   <input type="hidden" name="num" value="${num}">
                   <input type="hidden" name="writer" value="${writer}">
                   <input type="hidden" name="date1" value="${date1}">
      
               <a href="delete?num=${num}"><input type="button" value="삭제" class="btn btn-info"  style="float: right"></a>
                  <input type="submit" value="수정" class="btn btn-info" style="float: right;">
                     </form>
                  </c:when>
               </c:choose>
            </table><br>
            
            <div id="reply">
               <div align="left">
                  (${fn:length(reList)})개의 댓글
               </div>
               
               <c:choose>
                  <c:when
                     test="${empty principal.user.username || principal.user.username == '비회원'}">

                  </c:when>
                  
                  <c:otherwise>
                     <section class="replyForm" align="left">
                        <form action="writeReply" method="get">
                           <p>
                              <!-- <label for="content">댓글 내용</label><br> -->
                              <textarea id="content" name="content" rows="5" cols="100"
                                 placeholder="댓글을 입력해주세요"></textarea>
                           </p>
                           <input type="hidden" name="writer" value="${user_id}">
                           <input type="hidden" name="num" value="${num}">
                          <div style='width:150px; float: right;'>
 							<input type="submit" class="btn btn-info btn-sm" value="작성" >
						  </div>
                        </form>
                     </section>
                  </c:otherwise>
               </c:choose>
               <br> <br>
               <c:forEach items="${reList}" var="list" varStatus="status">
                  <pre>
     <b style="text-align: left">${list.writer}</b> 님     
     <h7 style="color: gray; text-align: right">작성일: ${list.regDate}</h7> </pre>
                  <c:choose>
                     <c:when test="${list.writer == user_id || user_id == 'admin_user' }">
                        <div align="left"><textarea class="newContent" id="content" name="content"
                           rows="5" cols="100"
                           style="border: none; background-color: #F1FFFE;">${list.content}</textarea></div>
                        <input type="hidden" id="reply_num" value="${list.reply_num}"><br>
                        <input type="button" class="btn btn-info btn-sm" id="update1" style="float:right;" value="수정">
                        <a href="deleteReply?reply_num=${list.reply_num}"><input type="button" class="btn btn-info btn-sm" id="del" style="float:right;" value="삭제"></a>
                        <br>
                        <br>
                     </c:when>
                     <c:otherwise>
                        <textarea id="content" name="content" rows="5" cols="100"
                           readonly="readonly"
                           style="border: none; background-color: #F1FFFE">${list.content}</textarea>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
         </table>
      </div>
   </div>
</div>
      <br><br>
      <%@ include file="../views/layout/footer.jsp"%>
</body>
</html>