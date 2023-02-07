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
		// 달력 표시
		$("#birth").datepicker({
			changeMonth : true,
			changeYear : true
		});
		
		// 아이디 중복 체크 버튼 시작
		// 아이디가 중복이 되면 실행이 되지 않기 때문에 체크 여부 확인을 해준다.
		$("#btn_idCheck").click(function(){
			var userid = $("#userid").val(); // userid 에 id선택자 userid value를 가져온다.
			userid = $.trim(userid);
			// 빈칸 오류 체크
			if(userid == ""){
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return false;
			}
			$("#userid").val(userid);
			
			// ajax 체크 시작 
			$.ajax({
				// 전송 전 설정 기본 요소
				type: "POST",
				data: "userid=" + userid, // 전송 데이터 설정
				url: "idcheck.do", // 데이터베이스와 연동된 컨트롤러 idcheck.do
				dataType: "text", // 리턴 타입
				success: function(result){ // cotroller -> ok 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
					if(result == "ok"){ // controller 에서의 리턴 타입
						alert("사용 가능한 아이디입니다.");
					}else{
						alert("사용이 가능하지 않습니다. 중복되었습니다.");
					}
				},
				error: function(){ // ajax 상의 장애 발생 시 뜨는 오류입니다. 
					alert("시스템 오류입니다. 다시 시도해주세요.");
				}
			});
			// ajax 체크 끝
		});
		// 아이디 중복 체크 버튼 끝
		
		// 우편번호 팝업 버튼 시작
		$("#btn_zipcode").click(function(){
			var width = 600; // 팝업 시 넓이
			var height = 300; // 팝업 시 높이 
			var name = "zipcode";
			var option = "width = "+ width + ", height = " + height + ", top = 100, left = 200, location = yes";
			var url = "post1.do";
			window.open(url, name, option); // 팝업 명령
		});
		// 우편번호 팝업 버튼 끝
		
		// 데이터 입력 기능 시작 button type이 button으로 되어 있어야 합니다.
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
			var formData = $("#frm").serialize(); 
			
			// 폼 데이터를 압축해서 전부 가져온다.
			$.ajax({
				// 전송 전 설정 기본 요소
				type: "POST",
				data: formData, // 전송 데이터 설정
				url: "memberWriteSave.do",
				dataType: "text", // 리턴 타입
				success: function(result){ // cotroller -> ok 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
					if(result == "ok"){
						alert("저장하였습니다.");
						location = "loginWrite.do";
					}else{
						alert("저장 실패하였습니다. 다시 시도해주세요.");
					}
				},
				error: function(){ // ajax 상의 장애 발생 시 뜨는 오류입니다. 
					alert("시스템 오류입니다. 다시 시도해주세요.");
				}
			});
		});
		// 데이터 입력 기능 끝
		
	});
</script>
</head>
<body>
	<main>
		<div class="membercontainer">
			<div class="form_container">
				<%@ include file="../include/top.jsp" %>
				<form id="frm" name="frm">
					<table>
						<caption>
							<strong>회원가입 폼</strong>
						</caption>
						<tr>
							<th><label for="userid">아이디</label></th>
							<td><input type="text" name="userid" id="userid" placeholder="아이디입력" maxlength="20">
								<button type="button" id="btn_idCheck">중복체크</button></td>
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
							<td><input type="text" name="birth" id="birth" placeholder="생년월일 입력"></td>
						</tr>
						<tr>
							<th><label for="phone">연락처</label></th>
							<td><input type="text" name="phone" id="phone" placeholder="전화번호 입력" maxlength="13">(예: 010-1234-1234)
							</td>
						</tr>
						<tr>
							<th><label for="zipcode">주소</label></th>
							<td><input type="text" name="zipcode" id="zipcode" placeholder="우편번호 입력">
								<button type="button" id="btn_zipcode">우편번호찾기</button> 
								<br>
								<input type="text" name="address" id="address" placeholder="주소 입력" maxlength="50">
							</td>
						</tr>
					</table>
					<div class="btn">
						<button type="button" id="btn_submit">저장</button>
						<button type="reset">취소</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>