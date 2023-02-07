<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/memberCSS/style.css'/>" />
<style>
</style>
<script type="text/javascript" src='<c:url value='/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript">
$(function(){
	$("#btn_submit").click(function(){
		var userid = $("#userid").val();
		var pass = $("#pass").val();
		userid = $.trim(userid);
		pass = $.trim(pass);
		if(userid == ""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		
		if(pass == ""){
			alert("패스워드를 입력하세요.");
			$("#pass").focus();
			return false;
		}
		
		// ajax 체크 시작 
		$.ajax({
			// 전송 전 설정 기본 요소
			type: "POST",
			data: "userid=" + userid + "&pass=" + pass, // 전송 데이터 설정
			url: "loginWriteSub.do", // 데이터베이스와 연동된 컨트롤러 idcheck.do
			dataType: "text", // 리턴 타입
			success: function(result){ // cotroller -> ok 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
				if(result == "ok"){ // controller 에서의 리턴 타입
					alert(userid + " 로그인 완료");
					location.href = "boardList.do";
				}else{
					alert("아이디가 잘못 되었거나 패스워드가 잘못 되었습니다.\n 다시 확인하고 입력해주세요.");
				}
			},
			error: function(){ // ajax 상의 장애 발생 시 뜨는 오류입니다. 
				alert("시스템 오류입니다. 다시 시도해주세요.");
			}
		});
		// ajax 체크 끝
	});		
	$("#btn_insert").click(function(){
		location.href="memberWrite.do"
	});
});

</script>
<title>로그인</title>
</head>
<body>
	<main>
		<div class="membercontainer">
			<div class="form_container">
				<%@ include file="../include/top.jsp" %>
				<form id="frm" name="frm">
					<table>
						<caption>
							<strong>로그인</strong>
						</caption>
						<tr>
							<th><label for="userid">아이디</label></th>
							<td>
								<input type="text" name="userid" id="userid" placeholder="아이디입력" maxlength="20">
							</td>
						</tr>
						<tr>
							<th><label for="pass">암호</label></th>
							<td>
								<input type="password" name="pass" id="pass" placeholder="암호입력" maxlength="20">
							</td>
						</tr>
					</table>
					<div class="btn">
						<button type="button" id="btn_submit">로그인</button>
						<button type="button" id="btn_insert">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>