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
<link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>" />
<script type="text/javascript">
	function fn_delete(code){
		if(confirm("정말 삭제하시겠습니까?")){
			location = "codeDelete.do?code=" + code;
			// delete from codes where code = '5' 형식
		}
	}
	
	function fn_update(code){
		location = "codeModifyWrite.do?code=" + code;
		// select code, gid, name from codes where code='5' 형식
	}
</script>
</head>
<body>
	<!-- 화면 jsp 파일  -->
	<div class="codeWrite_wrap">
		<!-- 데이터 입력하는 Form -->
		<div class="codeWrite_form">
			<table>
				<caption class="cap1">
					<strong>코드 목록</strong>
				</caption>
				<caption class="cap2">
					Total : ${resultTotal} 개 
					<button type="button" onclick="location.href='codeWrite.do'">코드목록입력</button>
				</caption>
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="40%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>그룹명</th>
					<th>코드명</th>
					<th>구분</th>
				</tr>
				<c:set var="count" value="1"/>
				<!-- 변수 선언으로 count값에 1을 가지게 한다. -->
				<c:forEach var="list" items="${resultList}">
				<!-- var = list 변수 지정하여 resultList라고 선언된 데이터를 가져온다.  -->
					<tr align="center"><!-- foreach 반복문에서의 쓰임 -->
						<td><c:out value="${count}"/></td> 
						<td>${list.gidname}</td>
						<td>${list.name}</td>
						<td>
							<button type="button" onclick="fn_update('${list.code}')">수정</button>
							<button type="button" onclick="fn_delete('${list.code}')">삭제</button>
						</td>
					</tr>
					<c:set var="count" value="${count+1}"/>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>