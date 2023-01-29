<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- jstl 함수 사용하는 코드 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--게시판 content 부분 한줄 처리 방지 
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content, newline, '<br>')}" /> 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 게시판</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/boardCss/style.css'/>" /><!-- CSS -->
</head>
<body>
	<div class="container">
		<div class="form_container">
			<form id="frm">
				<table>
					<caption>
						<strong>게시판 등록</strong>
					</caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>제목</th>
						<td>${boardVO.title}</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>${boardVO.name}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td height="50">${boardVO.content}</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><fmt:formatDate value="${boardVO.rdate}" type="both" pattern="yyyy-MM-dd"/></td><!-- 해당 날짜 수정 -->
					</tr>
					<tr>
						<td colspan="2" align="right">
							<button type="button" 
							onclick="location.href='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
							<button type="button" 
							onclick="location.href='passWrite.do?unq=${boardVO.unq}'">삭제</button>
							<button type="button" onclick="location.href='boardList.do'">목록</button>
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
	<script type="text/javascript" src='<c:url value='/js/custom.js'/>'
		charset="UTF-8"></script>
</body>
</html>