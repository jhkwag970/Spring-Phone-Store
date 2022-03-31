<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/static/css/admin/index.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/static/js/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#memberList").click(function(){
		    $(".context").load("/admin/nofragment/memberList?page=1");
		});
	});
</script>
</head>
<body>
<div class="divTable minimalistBlack">
  <div class="divTableHeading">
    <div class="divTableRow">
    <div class="divTableHead">회원관리</div>
    <div class="divTableHead">결제 및 주문</div>
    <div class="divTableHead">쿠폰 및 이벤트</div>
    <div class="divTableHead">제품 및 상담</div>
    </div>
  </div>
  <div class="divTableBody">
    <div class="divTableRow">
      <div class="divTableCell" id="memberList">회원목록 </div>
      <div class="divTableCell">결제목록</div>
      <div class="divTableCell">쿠폰생성</div>
      <div class="divTableCell">1:1상담</div>
      </div>
    <div class="divTableRow">
      <div class="divTableCell">쿠폰지급</div>
      <div class="divTableCell"></div>
      <div class="divTableCell">이벤트생성</div>
      <div class="divTableCell">제품등록</div>
    </div>
  </div>
</div>

<div class="context"></div>
</body>
</html>