 
 function deleteMem(){
	
	 Swal.fire({
		  title: '정말로 해당회원을\n 탈퇴시키겠습니까?',
		  text: "삭제시 복구가 불가합니다",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#0A91AB',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'OK',
		  timer: 5000
		}).then((result) => {
			if (result.isConfirmed) {
			
			Swal.fire(
     			 'Deleted!',
     		 'Your file has been deleted.',
    			  'success'
   			 ).then($("#del1").onload())
		/*	setTimeout(function() {
  			$("#del1").click();
			}, 3000);
	*/
			  }
		
		})
	 }