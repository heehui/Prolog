<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="../layout/header2.jsp"%>
<style>
	#hov1:hover{
		transform: scale(0.8);
		transition: .5s;
	}
</style>

<script>

$(document).ready(function() {
	
    $("#writeBtn").click(function(){
    	location.href ="write?user_id=${principal.user.username}";
    })
    $.ajax({
    	
    	url: "boardList", 
    	success: function(result){         
        var html = "<div id='grid' >";
       
       result.forEach(function(item){
    
    	   html+= "<div class='image1'><a href = 'detailView?contents=" + item.contents + 
        				'&image=' + item.image + 
        				'&title=' + item.title +
        				'&user_id=${principal.user.username}' +
        				'&writer=' + item.user_id +
        				'&user_num=' + item.user_num +
        				'&num=' + item.num +
        				'&reply_cnt=' + item.reply_cnt +
        				'&hit=' + item.hit +
        				'&date1=' + item.date1 +
        				'&lang=' + item.lang + "'>" + "<img id='hov1' src='/upload/" + item.image + "' width='200'  height='200'></a><h6 id='date1'>작성일: " + item.date1 
        						+ '<br><img src="../images/click.png">' + item.hit + ' 댓글수:' + item.reply_cnt + "</h6></div>";
       })    
       $("#listArea").append(html);
     }});
} ); 

</script>
</head>
<body>
			<h1>전체 게시판</h1>
 				<hr>
 			<c:choose>
 				<c:when test="${principal.user.username != null }">
 				<div align="right"><button type="button" class="btn btn-info" id="writeBtn"><img src="../images/pencil.png" width="30"></button></div><br>
				</c:when>
			</c:choose>		
					</table>
					
					<table align="center">
					<tbody id="listArea" style="width: 50%">
					
					</tbody>
					</table>
					
			</div>
		</div>
		
	</div> 
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>
