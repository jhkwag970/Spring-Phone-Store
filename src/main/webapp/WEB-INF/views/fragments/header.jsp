<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script
			src="https://kit.fontawesome.com/6da1745729.js"
			crossorigin="anonymous"
	></script>
	<link
			rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
	/>
	<script src="${pageContext.request.contextPath}/resources/static/js/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/bxslider.js" type="text/javascript"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/footer.css" />
	<script src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/header.js" defer></script>
	<title>SMARTDC</title>
</head>
<body>

<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

<!--현재 경로-->
<c:set var="URI" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<a href="/">HOME</a><br>
	<div class="wrapper">
	<!-- Chat button -->
	<div id="chat"></div>

	<!-- Side menu -->
	<div class="menu_bg"></div>
	<div id="sideMenu">
		<div class="close_btn">
			<i class="xi-close"></i>
		</div>
        <ul class="m1">
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/smartphone.png"><h4 class="left">스마트폰</h4></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/laptop.png"><h4 class="left">노트북</h4></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/tablet.png"><h4 class="left">태블릿</h4></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/watch.png"><h4 class="left">워치</h4></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/event.png"><h4 class="left">이벤트</h4></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/center.png"><h4 class="left">고객센터</h4></a></li>
        </ul>
        <hr color="#ebebeb" size="1px" width="95%" />
        <ul class="m2">
            <li><a href="/members/login"><img src="${pageContext.request.contextPath}/resources/static/img/user.png"><h4 class="left">로그인</h4></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/truck.png"><h4 class="left">주문/배송조회</h4></a></li>
        </ul>
    </div>

<a href="/spec/viewModels?product=sixPhone">SixPhone</a>
<a href="/spec/viewModels?product=sixBook">SixBook</a>
<a href="/spec/viewModels?product=sixTablet">SixTablet</a>
<a href="/spec/viewModels?product=sixWatch">SixWatch</a>


<sec:authorize access="isAuthenticated()">
    ${user.mem_id}님 환영합니다.
    <!--<sec:authentication property="principal" var="userName" scope="request"/>-->

    <form action="/members/logout" method="post" id="logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    <a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a>
    <a href="/carts/member/cart">장바구니</a>
</sec:authorize>

        <c:if test="${URI ne '/members/login'}">
            <a href="/members/login">로그인</a><br>
        </c:if>
        </sec:authorize>


	<!-- Search box -->
	<div id="mask"></div>
	<div class="window">
		<div class="win_wrap">
			<input id="h_box" class="holder" type="text" placeholder="Search" value="" />
			<div class="h_box">
				<div class="h1" style="text-align: left;">
					<ul>
						<h4>최근 검색어</h4>
						<li>워치</li>
						<li>Teamsix</li>
						<li></li>
						<li></li>
					</ul>
				</div>
				<div class="h2" style="text-align: left;">
					<ul>
						<h4>인기 검색어</h4>
						<li><span>1</span> 스마트폰</li>
						<li><span>2</span> 태블릿</li>
						<li><span>3</span> 노트북</li>
					</ul>
				</div>
            </div>
            <div style="text-align: center; padding-top: 40px">
                <button class="close" id="btn_close">
                    <i class="fa-solid fa-circle-xmark"></i>
                </button>
            </div>
		</div>
	</div>
	<!-- Header -->
	<header class="hd">
		<nav class="navbar nav_list">
			<div class="nav_logo">
				<i class="fa-brands fa-joomla"></i>
				<a href="/" class="logo">SMARTDC</a>
			</div>
			<ul class="nav_menu">
				<li>
					<a href="#">스마트폰</a>
					<ul>
						<li><a href="#">Phone1</a></li>
						<li><a href="#">Phone2</a></li>
						<li><a href="#">Phone3</a></li>
					</ul>
				</li>
				<li>
					<a href="">노트북</a>
					<ul>
						<li><a href="#">Note1</a></li>
						<li><a href="#">Note2</a></li>
						<li><a href="#">Note3</a></li>
					</ul>
				</li>
				<li>
					<a href="#">태블릿</a>
					<ul>
						<li><a href="#">Tablet1</a></li>
						<li><a href="#">Tablet2</a></li>
						<li><a href="#">Tablet3</a></li>
					</ul>
				</li>
				<li>
					<a href="#">워치</a>
					<ul>
						<li><a href="#">Watch1</a></li>
						<li><a href="#">Watch2</a></li>
						<li><a href="#">Watch3</a></li>
					</ul>
				</li>
				<li>
					<a href="#">이벤트</a>
					<ul>
						<li><a href="#">Event</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터</a>
					<ul>
						<li><a href="#">Service</a></li>
					</ul>
				</li>
			</ul>

			<ol class="nav_links">
				<li>
					<a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
				</li>
				<li>
					<a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
				</li>
				<li class="user user_menu">
					<a href="/members/login"><i class="fa-solid fa-user"></i></a>
				</li>
			</ol>

			<a href="#" class="menu_find">
				<i class="fa-solid fa-magnifying-glass"></i>
			</a>
			<a href="#" class="menu_btn">
				<i class="fa-solid fa-bars"></i>
			</a>

		</nav>
	</header>

        <script>
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            $(document).ajaxError(function myErrorHandler(event, xhr, ajaxOptions, thrownError) {
                if (xhr.status == 403) {
                    window.location.href ="/members/login";
                }
            });
        </script>
</div>
</body>
</html>