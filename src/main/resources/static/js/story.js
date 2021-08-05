/**
	2. 스토리 페이지
	(1) 스토리 로드하기
	(2) 스토리 스크롤 페이징하기
	(3) 좋아요, 안좋아요
	(4) 댓글쓰기
	(5) 댓글삭제
 */




// 현재 로그인한 사용자 아이디
let principalId = $("#principalId").val();


// (1) 스토리 로드하기

let page = 0;

function storyLoad() {
	$.ajax({
		url: `/api/board?page=${page}`,
		dataType: "json"
	}).done(res => {
		//console.log(res);
		res.data.content.forEach((board)=>{
			let storyItem = getStoryItem(board);
			$("#storyList").append(storyItem);
		});
	}).fail(error => {
		console.log("오류", error);
	});
}

storyLoad();


function getStoryItem(board) {
	let item = `<div class="story-list__item">
	<div class="sl__item__header">
		<div>
			<img class="profile-image" src="/upload/${board.user.profileImageUrl}"
				onerror="this.src='/images/jju.jpg'" />
		</div>
		<div>${board.user.username}</div>
	</div>

	<div class="sl__item__img">
		<img src="/upload/${board.postBoardUrl}" />
	</div>

	<div class="sl__item__contents">
		<div class="sl__item__contents__icon">
			<button>`;
			
				 if(board.likeState){
					item += `<i class="fas fa-heart active" id="storyLikeIcon-${board.id}" onclick="toggleLike(${board.id})"></i>`;
				}else{
					item += `<i class="far fa-heart" id="storyLikeIcon-${board.id}" onclick="toggleLike(${board.id})"></i>`;
				}
				
		
		item += `
			</button>
		</div>
		<span class="like"><b id="storyLikeCount-${board.id}">${board.likeCount} </b>likes</span>
		<div class="sl__item__contents__content">
			<p>${board.caption}</p>
		</div>

		<div id="storyCommentList-1">

			<div class="sl__item__contents__comment" id="storyCommentItem-1">
				<p>
					<b>runrun:</b> 댓글샘플
				</p>

				<button>
					<i class="fas fa-times"></i>
				</button>

			</div>

		</div>

		<div class="sl__item__input">
			<input type="text" placeholder="댓글 달기" id="storyCommentInput-1" />
			<button type="button" onClick="addComment()">게시</button>
		</div>

	</div>
</div>`;

	return item;
}

// (2) 스토리 스크롤 페이징하기
$(window).scroll(() => {
	//console.log("window scrollTop", $(window).scrollTop());
	//console.log("문서의 높이", $(document).height());
	//console.log("window 높이", $(window).height());
	
	let checkNum = $(window).scrollTop() - ( $(document).height() - $(window).height() );
	//console.log(checkNum);
	
	if(checkNum < 1 && checkNum > -1){
		page++;
		storyLoad();
	}
});

// (3) 좋아요, 안좋아요
function toggleLike(boardId) {
	let likeIcon = $(`#storyLikeIcon-${boardId}`);
							//far 빈 하트,  fas 빨간 하트
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/board/${boardId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${boardId}`).text();
			let likeCount = Number(likeCountStr) + 1;
			$(`#storyLikeCount-${boardId}`).text(likeCount);
			
			likeIcon.addClass("fas");
			likeIcon.addClass("active");
			likeIcon.removeClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		
		

	} else { // 좋아요취소 하겠다
		
		$.ajax({
			type: "delete",
			url: `/api/board/${boardId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${boardId}`).text();
			let likeCount = Number(likeCountStr) - 1;
			$(`#storyLikeCount-${boardId}`).text(likeCount);
			
			likeIcon.removeClass("fas");
			likeIcon.removeClass("active");
			likeIcon.addClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		

	}
}

// (4) 댓글쓰기
function addComment() {

	let commentInput = $("#storyCommentInput-1");
	let commentList = $("#storyCommentList-1");

	let data = {
		content: commentInput.val()
	}

	if (data.content === "") {
		alert("댓글을 작성해주세요!");
		return;
	}

	let content = `
			  <div class="sl__item__contents__comment" id="storyCommentItem-2""> 
			    <p>
			      <b>GilDong :</b>
			      댓글 샘플입니다.
			    </p>
			    <button><i class="fas fa-times"></i></button>
			  </div>
	`;
	commentList.prepend(content);
	commentInput.val("");
}

// (5) 댓글 삭제
function deleteComment() {

}







