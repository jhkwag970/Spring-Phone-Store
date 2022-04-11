<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1,#datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
.topp {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 48px;
	line-height: 48px;
	font-size: 11px;
	color: gray;
	display: flex;
}
.top_nav {
	background-color: #f3f3f3;
	width: 100%;
}
</style>


<div style="margin-top: 48px"></div>
		<div class="top_nav">
			<div class="topp">이벤트 > Event</div>
		</div>

<div class="topp">

<h1>이벤트 글 작성하기</h1>

<form action="/boards/eventinsert" method="post" enctype="multipart/form-data">
	<div>

		<input type ="hidden" name="mem_id" value="${user.mem_id}">
		
		<label>제목</label>
		<input type ="text" name="board_title">		
		<br><br>
		<label>메인사진</label>
		<input type ="file" name="board_titleimg2">		
		<br><br>
		<label>내용사진</label>
		<input type ="file" name="board_content2">		
		<br><br>
		<input type ="hidden" name="board_type" value="event">
		<label>
		시작날짜
        <input type="text" id="datepicker1" name="s_date" readonly>
        <br>
        종료날짜
        <input type="text" id="datepicker2" name="e_date" readonly>
        </label>
        <br><br>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        
	</div>

 
   
<button type="button" >취소</button>
<button type="submit" >등록</button>
</form>
</div>
</body>
</html>