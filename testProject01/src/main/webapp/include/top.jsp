<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/memberCSS/style.css'/>" />
<%
	String USERID = (String)session.getAttribute("SessionUserID");
	
%>
<main>
		<div class="membercontainer">
			<div class="form_container">
				<table>
					<thead>
					<tr>
						<th width="25%" class="select1">홈</th>
						<th width="25%" class="select2"><a href="<c:url value='/boardList.do'/>">게시판</a></th>
<%
	if(USERID == null){
%>
				<th width="25%" class="select3"><a href="<c:url value='/memberWrite.do'/>">회원가입</a></th>
				<th width="25%" class="select4"><a href="<c:url value='/loginWrite.do'/>">로그인</a></th>
<%
	}else{
%>
				<th width="25%" class="select3"><a href="<c:url value='/memberModify.do'/>">회원정보</a></th>
				<th width="25%" class="select4"><a href="<c:url value='/logout.do'/>"><%=USERID%> 로그아웃</a></th>
<%}%>				
					</tr>
				</thead>
			</table>
		</div>
	</div>
</main>
