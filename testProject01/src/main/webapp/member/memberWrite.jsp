<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리화면</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/memberCSS/style.css'/>" />
<!-- 자바스크립트 라이브러리 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script type="text/javascript" src='<c:url value='/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript" src='<c:url value='/js/jquery-ui.js'/>'></script>
<script type="text/javascript">
	$(function() {
		$("#birth").datepicker({
			changeMonth : true,
			changeYear : true
		});
		// 아이디와 패스워드 체크
		$("#btn_submit").click(function() {
			var userid = $("#userid").val();
			var pass = $("#pass").val();
			var name = $("#name").val();
			// trim 함수 : 앞 뒤 공백 체크 
			userid = $.trim(userid); 
			pass = $.trim(pass);
			name = $.trim(name);
			// 빈칸 오류 체크
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
			
			if(name == ""){
				alert("이름을 입력하세요.");
				$("#name").focus();
				return false;
			}
			$("#userid").val(userid); // val(입력하고자 하는 변수) 실제 화면에서 바뀐다.
			$("#pass").val(pass);
			$("#name").val(name);
			
			/* ajax 전송 타입으로 작성 */
			var formData = $("#frm").serialize(); // 폼 데이터를 압축해서 전부 가져온다.
			
			$.ajax({
				type: "POST", // 타입 전송 방식
				data: formData, // 전송할 데이터 설정
				url: "memberWriteSave.do", // url를 지정하여 컨트롤러와 연동
				dataType: "text", // 리턴 타입으로 결과 값을 text 타입으로 전송한다.
				/* 전송 후 설정 */
				success: function(result){ // 전송 성공시 다음 명령을 실행함. result 변수에 저장함.
					if(result == "ok"){
						alert("저장완료");
						location = "loginWrite.do"; // 로그인 화면으로 지정함.
					}else{
						alert("저장실패");
					}
				},
				error: function(){ // 장애 발생 시스템에서의 장애, 연결이 끊어지거나 하는 경우임.
					alert("오류발생함. 관리자에게 문의하세요.");
				}
			});
		});
	});
</script>
</head>
<body>
	<main>
		<div class="container">
			<div class="form_container">
				<table>
					<thead>
						<tr>
							<th width="25%">홈</th>
							<th width="25%"><a href="<c:url value='/boardList.do'/>">게시판</a></th>
							<th width="25%"><a href="<c:url value='/memberWrite.do'/>">회원가입</a></th>
							<th width="25%"><a href="<c:url value='/'/>">로그인</a></th>
						</tr>
					</thead>
				</table>
				<form id="frm">
					<table>
						<caption>
							<strong>회원가입 폼</strong>
						</caption>
						<tr>
							<th><label for="userid">아이디</label></th>
							<td><input type="text" name="userid" id="userid" placeholder="아이디입력" maxlength="20">
								<button type="button">중복체크</button></td>
						</tr>
						<tr>
							<th><label for="pass">암호</label></th>
							<td><input type="password" name="pass" id="pass"
								placeholder="암호입력" maxlength="20"></td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" name="name" id="name"
								placeholder="이름입력" maxlength="20"></td>
						</tr>
						<tr>
							<th><label for="gender">성별</label></th>
							<td>
								<input type="radio" name="gender" id="gender_man" value="M" checked>남 
								<input type="radio" name="gender" id="gender_female" value="F">여
							</td>
						</tr>
						<tr>
							<th><label for="birth">생년월일</label></th>
							<td><input type="text" name="birth" id="birth" readonly placeholder="생년월일 입력"></td>
						</tr>
						<tr>
							<th><label for="phone">연락처</label></th>
							<td><input type="text" name="phone" id="phone" placeholder="전화번호 입력" maxlength="13">(예: 010-1234-1234)
							</td>
						</tr>
						<tr>
							<th><label for="zipcode">주소</label></th>
							<td><input type="text" name="zipcode" id="zipcode" placeholder="우편번호 입력">
								<button type="button">우편번호찾기</button> 
								<br>
								<input type="text" name="address" id="address" placeholder="주소 입력" maxlength="50">
							</td>
						</tr>
					</table>
					<div class="btn">
						<button type="submit" id="btn_submit">저장</button>
						<button type="reset">취소</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>