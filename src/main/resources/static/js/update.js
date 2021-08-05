// (1) 회원정보 수정
function update(userId,event) {
	event.preventDefault(); //폼 태그 액션 x
	
	let data= $("#profileUpdate").serialize();	//key=value 
	
	console.log(data);
	
	$.ajax({
		type: "put",
		url: `/api/user/${userId}`,
		data: data,
		contetType: "application/x-www-form-urlencoded; charset=URF-8",
		dataType: "json"
	}).done(res=>{
		console.log("성공", res);
		location.href= `/${userId}`;
	}).fail(error=>{
		alert(error.responseJSON.data.name);
	});

}