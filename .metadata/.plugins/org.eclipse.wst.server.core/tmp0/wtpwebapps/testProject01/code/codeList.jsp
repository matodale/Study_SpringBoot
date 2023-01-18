<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 목록</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/style.css'/>" />
</head>
<body>
	<!-- 화면 jsp 파일  -->
	<div class="codeWrite_wrap">
		<!-- 데이터 입력하는 Form -->
		<div class="codeWrite_form">
			<table>
				<caption>코드 목록</caption>
				<colgroup>
					<col width="20%" />
					<col width="40%" />
					<col width="40%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>그룹명</th>
					<th>코드명</th>
				</tr>
				<c:set var="count" value="1"/><!-- 변수 선언으로 count값에 1을 가지게 한다. -->
				<c:forEach var="list" items="${resultList}">
					<tr align="center">
						<td><c:out value="${count}"/></td> <!-- jstl예전에 많이쓰였던 방식 -->
						<td>${list.gidname}</td>
						<td>${list.name}</td>
					</tr>
					<c:set var="count" value="${count+1}"/>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>