<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> <%--  jstl 사용 --%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서상세보기</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
</head>
<body>
	<table>
		<caption>${deptVO.dname}의 목록</caption>
		<tr>
			<th>부서목록</th>
			<td>${deptVO.deptno}</td><%-- 부서번호 --%>
		</tr>
		<tr>
			<th>부서이름</th>
			<td>${deptVO.dname}</td><%-- 부서이름 --%>
		</tr>
		<tr>
			<th>부서위치</th>
			<td>${deptVO.loc}</td><%-- 부서위치 --%>
		</tr>
		<tr>
			<th colspan="2">
				<!-- 수정버튼 -->
				<button type="button" onclick="location.href='deptModifyWrite.do?deptno=${deptVO.deptno}'">수정</button>
				<!-- 삭제버튼 -->
				<button type="button"  onclick="location.href='deptDelete.do?deptno=${deptVO.deptno}'">삭제</button>
			</th>
		</tr>
	</table>
	<a href="<c:url value='deptList.do'/>">부서목록가기</a>
</body>
</html>









