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
</head>
<body>
	<main>
		<div class="container">
			<div class="form_container">
				<table>
					<thead>
						<tr>
							<th>홈</th>
							<th>게시판</th>
							<th>회원가입</th>
							<th>로그인</th>
						</tr>
					</thead>
				</table>
				<form id="frm">
					<table>
						<caption>회원가입 폼</caption>
						<tr>
							<th><label for="userid">아이디</label></th>
							<td><input type="text" name="userid" id="userid" placeholder="아이디입력" maxlength="20">
								<button type="button">중복체크</button></td>
						</tr>
						<tr>
							<th><label for="pass">암호</label></th>
							<td><input type="password" name="pass" id="pass" placeholder="암호입력" maxlength="20"></td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" name="name" id="name" placeholder="이름입력" maxlength="20"></td>
						</tr>
						<tr>
							<th><label for="gender">성별</label></th>
							<td>
								<input type="radio" name="gender" id="gender" value="M" checked>남
								<input type="radio" name="gender" id="gender" value="F">여
							</td>
						</tr>
						<tr>
							<th><label for="birth">생년월일</label></th>
							<td>
								<input type="text" name="birth" id="birth" readonly placeholder="생년월일 입력">
							</td>
						</tr>
						<tr>
							<th><label for="phone">연락처</label></th>
							<td>
								<input type="text" name="phone" id="phone" placeholder="전화번호 입력" maxlength="13">(예: 010-1234-1234)
							</td>
						</tr>
						<tr>
							<th><label for="zipcode">주소</label></th>
							<td>
								<input type="text" name="zipcode" id="zipcode" placeholder="우편번호 입력">
								<button type="button">우편번호찾기</button> 
								<br> <input type="text" name="address" id="address" placeholder="주소 입력">
							</td>
						</tr>
					</table>
					<div class="btn">
						<button type="submit">저장</button>
						<button type="reset">취소</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>