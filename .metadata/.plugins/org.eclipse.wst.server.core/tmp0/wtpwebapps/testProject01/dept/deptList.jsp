<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> <%--  jstl 사용 --%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원목록</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
</head>
<body>
	<table>
		<caption>사원목록</caption>
		<tr>
			<th>부서목록</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		<!-- JSTL forEach 반복문 items : DeptDAO resultList와 일치 -->
		<c:forEach var="result" items="${resultList}" varStatus="status"> 
			<tr>	
				<td>${result.deptno}</td><%-- 부서번호 --%>
				<td><a href="deptDetail.do?deptno=${result.deptno}">${result.dname}</a></td><%-- 부서이름 --%>
				<td>${result.loc}</td><%-- 부서위치 --%>
			</tr>
		</c:forEach>
	</table>
	<a href="<c:url value='deptWrite.do'/>">부서입력</a>
</body>
</html>






















