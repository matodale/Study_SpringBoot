<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용 수정</title>
 <!-- CSS -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/boardCss/style.css'/>" />
</head>
<body>
	<div class="container">
		<div class="form_container">
			<form id="frmUpdate">
				<input type="hidden" name="unq" value="${boardVO.unq}">
				<table>
					<caption>
						<strong>게시판 수정</strong>
					</caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>
							<label for="title">제목</label>
						</th>
						<td>
							<input type="text" name="title" id="title" placeholder="제목을 입력하세요.(30자 내외)" maxlength="30"
							class="input1" value="${boardVO.title}">
						</td>
					</tr>
					<tr>
						<th>암호</th>
						<td>
							<input type="password" name="pass" id="pass" placeholder="게시판 암호를 재입력하세요.(20자 내외)" maxlength="20">
						</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>
							<input type="text" name="name" id="name" placeholder="작성자를 재입력하세요.(10자 내외)" maxlength="10" 
							value="${boardVO.name}">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="content" id="content" class="textarea" maxlength="1000" placeholder="내용을 입력하세요.">${boardVO.content}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<button type="submit" onclick="fn_submitUpdate(); return false;">수정</button>
							<button type="reset">재작성</button>
							<button type="button" onclick="location.href='boardList.do'">뒤로</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 자바스크립트 라이브러리 -->
    <!-- 제이쿼리 -->
	<script type="text/javascript" src='<c:url value='/js/jquery-1.12.4.js'/>'></script>
	<script type="text/javascript" src='<c:url value='/js/jquery-ui.js'/>'></script>
	<script type="text/javascript" src='<c:url value='/js/custom.js'/>' charset="UTF-8"></script>
</body>
</html>