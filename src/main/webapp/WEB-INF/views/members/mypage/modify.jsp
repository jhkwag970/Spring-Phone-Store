<<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>Title</title>
    <!-- jQuery -->
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script><!-- jQuery CDN --->
    <!-- daum 우편주소 api-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<br><br><br>

<h2>회원정보수정</h2>
<h4>기본정보</h4>

<div class="modify">
<table class="table">
    <thead>

    </thead>
    <tbody>
    <tr>
        <th scope="row">아이디</th>
        <td><input type="text" style="border:0 solid black" id="memId" value=${user.mem_id} readonly></td>
        <td>*ID는 수정이 불가능합니다</td>
    </tr>
    <tr>
        <th scope="row">이름</th>
        <td><input type="text" id="memName" value=${user.mem_name}></td>
        <td><p id="nameCheck"></p></td>
    </tr>
    <<tr>
        <th scope="row">휴대폰번호</th>
        <td><input type="text" id="memPhone" value=${user.mem_phone}></td>
        <td><p id="phoneCheck"></p></td>
    </tr>
    <tr>
        <th scope="row">이메일</th>
        <td><input type="text" id="memEmail" value=${user.mem_email}></td>
        <td><p id="emailCheck"></p></td>
    </tr>
    <tr>
        <th scope="row">생년월일</th>
        <td><input type="text" style="border:0 solid black" id="memBirth" value=${user.mem_birth} readonly></td>
        <td>*생일쿠폰 발송으로 생년월일은 가입 이후 수정이 불가능합니다</td>
    </tr>
    <tr>
        <th scope="row">주소</th>
        <td><input type="text" style="border:0 solid black" id="memPostcode" value=${user.mem_post_code} readonly><br>
            <input type="text" style="border:0 solid black" id="memAddress" size="50" value="${user.mem_address}" readonly></td>
        <td><input type="text" id="postcode" placeholder="우편번호" disabled="disabled">
            <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="address" placeholder="주소" disabled="disabled"><br>
            <input type="text" id="detailAddress" maxlength="80" placeholder="상세주소">
            <input type="text" id="extraAddress" placeholder="참고항목" disabled="disabled">
        </td>
        <td><p id="addressCheck"></p></td>
    </tr>


    </tbody>
</table>
    <button onclick="sendInfoModify()">정보수정</button>

</div>


<!-- javascript -->
<script type="text/javascript">

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //회원이름
    var memName = document.querySelector('#memName');

    //이메일
    var memEmail = document.querySelector('#memEmail');

    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    //전화번호
    var memPhone = document.querySelector('#memPhone');
    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;



    //회원이름 정보 확인
    memName.onblur = function (e) {
        if(memName.value.length == 0){
            nameCheck.innerHTML = "이름을 입력해주세요.";
        }else{
            nameCheck.innerHTML = null;
        }
    }

    //이메일 정보 확인
    memEmail.onblur = function (e) {

        if(memEmail.value.length == 0){
            emailCheck.innerHTML = "이메일을 입력해주세요";
        }else if(!regEmail.test(memEmail.value)){
            emailCheck.innerHTML = "잘못된 이메일 형식입니다.";
        }else{
            emailCheck.innerHTML = null;
        }

    }

    //전화번호 정보 확인
    memPhone.onblur = function (e) {

        if(memPhone.value.length == 0){
            phoneCheck.innerHTML = "전화번호을 입력해주세요";
        }else if(!regPhone.test(memPhone.value)){
            phoneCheck.innerHTML = "잘못된 전화번호 형식입니다.";
        }else{
            phoneCheck.innerHTML = null;
        }

    }

    //우편번호 api
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

    //정보수정
    function sendInfoModify() {


        var postCode = document.getElementById('postcode').value; //우편번호
        var address = document.getElementById("address").value + " " + document.getElementById("detailAddress").value; //주소
        var extraAddress = document.getElementById("extraAddress").value; //참고항목


        var boolName = memName.value.length == 0;
        var boolEmail = memEmail.value.length == 0 || !regEmail.test(memEmail.value);
        var boolPhone = memPhone.value.length == 0 || !regPhone.test(memPhone.value);


        if(document.getElementById("address").value.length == 0){

            alert("주소를 입력해 주세요.");

        }else if(boolName){

            alert("이름을 다시 입력해주세요");


        }else if(boolEmail){

            alert("이메일을 다시 입력해주세요.");
        }else if(boolPhone){

            alert("전화번호를 다시 입력해주세요.")
        }
        else{

            jQuery.ajax({
                "url": "/members/modify/modifyProcess",
                "type": "POST",
                "contentType": "application/json; charset=utf-8;",
                "data": JSON.stringify({
                    "mem_name": memName.value,
                    "mem_phone" : memPhone.value,
                    "mem_email": memEmail.value,
                    "mem_post_code": postCode,
                    "mem_address": address
                }),
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                "dataType": "json"
            }).done(function(data) {
                data = JSON.stringify(data);
                jsonData = JSON.parse(data);

                if(jsonData.success){
                    alert(jsonData.success);
                    location.href = "/";
                }else{
                    alert('에러. 새로고침 후 다시 수정해주세요');
                }

            });
        }
    }

</script>


</body>
</html>
