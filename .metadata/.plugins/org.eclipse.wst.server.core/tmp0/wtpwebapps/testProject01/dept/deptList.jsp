<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--  jstl 확장 구조를 사용 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원목록</title>
<link href="../css/style.css" type="text/css">
</head>
<body>
	<table>
		<caption>사원목록</caption>
		<tr>
			<th>부서목록</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>	
				<td>${result.deptno}</td>
				<td>${result.dname}</td>
				<td>${result.loc}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="http://localhost:8080/testProject01/deptWrite.do">부서입력</a>
</body>
</html>