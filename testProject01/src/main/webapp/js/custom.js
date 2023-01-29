/*$(function(){
	$("#title").val("제목입력"); // 제이쿼리 함수
});*/
/*function fn_update_submit(){
	if(document.frm.title.value == ""){
		alert("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
	if(document.frm.pass.value == ""){
		alert("암호을 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	document.frm.submit(); // 동기화 전송 방식 
}
*/
function fn_submit(){
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
			// 전송 전 설정 기본 요소
			type: "POST",
			data: formData, // 전송 데이터 설정
			url: "boardWriteSave.do",
			dataType: "text", // 리턴 타입
			success: function(result){ // cotroller -> ok 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
				if(result == "ok"){
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

function fn_submitUpdate(){
		// trim() - 앞 뒤 공백 제거
		if( $.trim($("#title").val()) == "" ){ // 앞뒤 공백 함수 쓰는거 정리
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
		
		var formData_update = $("#frmUpdate").serialize();
		
		$.ajax({
			// 전송 전 설정 기본 요소
			type: "POST",
			data: formData_update, // 전송 데이터 설정
			url: "boardModifySave.do", // 컨트롤러에서 맵핑한 자바코드랑 연결
			dataType: "text", // 리턴 타입
			success: function(result){ // cotroller -> 1 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
				if(result == "1"){
					alert("수정하였습니다.");
					location = "boardList.do";
				}else if(result == "-1"){
					alert("암호가 일치하지 않습니다.");
					$("#pass").focus();
				}else{
					alert("수정 실패하였습니다. \n관리자에게 연락해주세요.");
				}
			},
			error: function(){ // ajax 상의 장애 발생 시 뜨는 오류입니다. 
				alert("시스템 오류입니다. 다시 시도해주세요.");
			}
		});
		/**
			$.ajax({
  				type : `http method type`,
  				url : `url`,
  				data : `서버에 전송할 데이터`,
  				contentType : "전송할 데이터 타입",
  				//기본 값 : "application / x-www-form-urlencoded; charset = UTF-8"  
  				dataType : '서버로 부터 수신할 데이터 타입',
  				//아무것도 지정하지 않으면 jQuery는 응답의 MIME 유형을 기반으로 해석을 시도
  				error : `에러 발생시 수행할 함수`,
  				success : `성공시 수행할 함수`
			});
		 */
}















