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
<title>코드 관리 수정</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>" />
<script type="text/javascript">
	// 빈 데이터 오류 방지용
	function fn_submit(){
		if(document.frm.name.value == ""){
			alert("코드명을 입력해주세요.");
			document.frm.name.focus();
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
	<!-- 화면 jsp 파일  -->
	<div class="codeWrite_wrap">
		<!-- 데이터 입력하는 Form -->
		<div class="codeWrite_form">
			<form class="codeWrite" name="frm" method="post" action="codeModifySave.do">
				<input type="hidden" name ="code" value="${vo.code}">
				<table>
					<caption><strong>코드관리수정</strong></caption>
					<tr>
						<th>분류</th>
						<td>
							<select name="gid"><!-- test 조건문에 해당, -->
								<option value="1" <c:if test="${vo.gid == '1' }" > selected</c:if> >JOB(업무)</option>
								<option value="2" <c:if test="${vo.gid == '2' }" > selected</c:if> >HOBBY(취미)</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>코드명</th>
						<td><input type="text" name="name" maxlength="20" size="40"
							placeholder="코드 이름을 적어주세요." value="${vo.name}"></td>
					</tr>
					<tr>
						<th colspan="2">
							<button type="submit" onclick="fn_submit(); return false;">수정</button>
							<button type="reset">다시작성</button>
							<button type="button" onclick="location.href='codeList.do'">코드목록보기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>