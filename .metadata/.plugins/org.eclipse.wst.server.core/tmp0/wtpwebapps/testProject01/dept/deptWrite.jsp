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
<title>부서관리 테스트 및 데이터 전달 테스트</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
</head>
<body>
	<!-- 전송할 곳을 작성하는 폼 -->
	<form name="frm" method="post" action="deptWriteSave.do">
		<table>
			<tr>
				<th>부서번호</th>
				<td><input type="text" name="deptno"></td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td><input type="text" name="dname"></td>
			</tr>
			<tr>
				<th>부서위치</th>
				<td><input type="text" name="Loc"></td>
			</tr>
		</table>
		<input type="submit" value="저장">
		<input type="reset" value="다시작성">
	</form>
	<a href="deptList.do">부서목록</a>
</body>
</html>