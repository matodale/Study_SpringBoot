<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 일치 여부 확인</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/boardCss/style.css'/>" />
<!-- CSS -->
</head>
<body>
	<table>
		<tr>
			<th>암호입력</th>
			<td><input type="password" name="pass" id="pass"
				placeholder="암호를 입력하세요" maxlength="20"></td>
			<td>
				<button type="button" id="delBtn">삭제</button>
				<button type="button"
					onclick="location.href='boardDetail.do?unq=${unq}'">취소</button>
			</td>
		</tr>
	</table>
	<script type="text/javascript" src='<c:url value='/js/jquery-1.12.4.js'/>'></script>
	<script type="text/javascript" src='<c:url value='/js/jquery-ui.js'/>'></script>
	<script type="text/javascript">
		//제이쿼리 문법으로 삭제 버튼 기능 추가
		$(function() {
			$("#delBtn").click(function() {
				// 패스워드 공백 체크
				var pass = $("#pass").val();
				pass = $.trim(pass);
				if (pass == "") {
					alert("암호를 입력해주세요.");
					$("#pass").focus();
					return false;
				}

				var sendData = "unq=${unq}&pass=" + pass;

				$.ajax({
					// 전송 전 설정 기본 요소
					type : "POST",
					data : sendData, // 전송 데이터 설정 json 설정 타입
					url : "boardDelete.do",
					dataType : "text", // 리턴 타입
					success : function(result) { // cotroller -> ok 를 전송하면 저장완료메시지를 띄우고 해당 페이지로 이동한다.
						if (result == "1") {
							alert("삭제하였습니다.");
							location = "boardList.do";
						} else if (result == "-1") {
							alert("암호가 일치하지 않습니다.");
							$("#pass").focus();
						} else {
							alert("삭제 실패하였습니다. \n관리자에게 연락해주세요.");
						}
					},
					error : function() { // ajax 상의 장애 발생 시 뜨는 오류입니다. 
						alert("시스템 오류입니다. 다시 시도해주세요.");
					}
				});
			});
		});
	</script>
</body>
</html>