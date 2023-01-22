/*$(function(){
	$("#title").val("제목입력"); // 제이쿼리 함수
});*/
function fn_submit(){
		/*if(document.frm.title.value == ""){
			alert("제목을 입력해주세요.");
			document.frm.title.focus();
			return false;
		}
		if(document.frm.pass.value == ""){
			alert("암호을 입력해주세요.");
			document.frm.pass.focus();
			return false;
		}
		document.frm.submit(); // 동기화 전송 방식*/
		// trim() - 앞 뒤 공백 제거
		if( $.trim($("#title").val()) == "" ){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		$("#title").val($.trim($("#title").val()));
		
		if( $.trim($("#pass").val()) == "" ){
			alert("암호을 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		$("#pass").val($.trim($("#pass").val()));
		
		if( $.trim($("#name").val()) == "" ){
			alert("글쓴이를 입력해주세요.");
			$("#name").focus();
			return false;
		}
		$("#name").val($.trim($("#name").val()));
		
		// ajax 비동기 방식인 jquery 함수이다.
		var formData = $("#frm").serialize();
		$.ajax({
			type: "POST",
			data: formData,
			url: "boardWriteSave.do",
			dataType: "text", // 리턴 타입
			success: function(data){ // cotroller -> ok 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
				if(data == "ok"){
					alert("저장하였습니다.");
					location = "boardList.do";
				}else{
					alert("저장 실패하였습니다. 다시 시도해주세요.");
				}
			},
			error: function(){ // ajax 상의 장애 발생 시 뜨는 오류입니다. 
				alert("시스템 오류입니다. 다시 시도해주세요.");
			}
		});
}