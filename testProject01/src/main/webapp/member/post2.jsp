<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  jstl 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<style type="text/css">
.addressContainer {
	width: 100%;
}
.addressContainer .select{
	width:400px;
	float:left;
}
.addressContainer .btn {
	width:160px;
	float:right;
}
.addressContainer .select:after{
	content:"";
	display:block;
	clear:both;
}
.addressContainer .btn:after{
	content:"";
	display:block;
	clear:both;
}
</style>
<script type="text/javascript" src='<c:url value='/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript">
	$(function(){
		$("#btn_send").click(function(){
			var addr = $("#address").val(); // 선택된 주소 선택자
			var addr_array = addr.split(" "); // split 함수로 문자열 나누기
			var zipcode = addr_array[0].substring(1, addr_array[0].length-1); // zipcode 우편번호 숫자만 가져옴.
			var address = addr.replace(addr_array[0], "");  
			address = $.trim(address);
			
			opener.document.frm.zipcode.value = zipcode;
			opener.document.frm.address.value = address;
			
			self.close();
		});
	});
</script>
</head>
<body>
	<div class="addressContainer">
		<div class="select">
			<select name="address" id="address">
				<c:forEach var="result" items="${resultList}">
					<!-- [123456] 대구광역시 수성구 봉명동 12 -->
					<option value="${result.addr}">${result.addr}</option>
				</c:forEach>
			</select>
		</div>
		<div class="btn">
			<button type="button" id="btn_send">적용하기</button>
		</div>
	</div>
</body>
</html>