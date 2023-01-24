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
<title>일반 게시판 목록</title>
<!-- CSS -->
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/boardCss/style.css'/>" />
</head>
<body>
	<div class="boardContainer">
		<div class="boardTableContainer">
			<table>
				<caption>
					<label for="boardTitle">
							<strong>일반 게시판</strong>
					</label>
					<label for="boardTotal">
							Total : ${total}
					</label>
				</caption>
				<colgroup>
					<col width="5%"/>
					<col width="45%"/>
					<col width="20%"/><!-- 글쓴이 -->
					<col width="20%"/><!-- 등록일 -->
					<col width="15%"/>
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:set var="cnt" value="1"/><!-- 카운트할 변수를 지정 후 반복문에서 적용하기 -->
				<c:forEach var="result" items="${resultList}">
					<!-- var 해당 페이지에서 실행할 변수, items 컨트롤러에서의 불러오는 변수 -->
					<tr align="center">
						<td><c:out value="${cnt}"/></td>
						<td align="left"><c:out value="${result.title}"/></td>
						<td><c:out value="${result.name}"/></td>
						<td><c:out value="${result.rdate}"/></td><!-- 날짜형식으로만 표현해야 하므로 SQL문에서 함수를 써준다. -->
						<td><c:out value="${result.hits}"/></td>
					</tr>
					<c:set var="cnt" value="${cnt+1}"/>
				</c:forEach>
					<tr class="bottem_position">
						<td colspan="4" align="center" class="totalPage">
							<c:forEach var="i" begin="1" end="${totalPage}"><!-- 반복문으로 숫자를 차례대로 표시함. -->
								<a href="boardList.do?viewPage=${i}">[${i}]</a><!-- 각 페이지 링크. -->
							</c:forEach>
						</td>
						<td colspan="1" align="right" class="buttonWrite">
							<button type="button" onclick="location.href='boardWrite.do'">글 작성</button>
						</td>	
					</tr>
			</table>
		</div>
	</div>
</body>
</html>