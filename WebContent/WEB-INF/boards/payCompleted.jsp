<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <script type="text/javascript" -->
<!-- 	src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>테스트 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
<style>
body {
	font-family: "Nanum Gothic";
	height: 100%;
}
.wrapper {
	width: 400px;
	margin: auto;
	padding: 40px;
	border: 1px solid #e4e4e4;
	border-radius: 5px;
}
a {
	font-weight: bold;
}

a:hover {
	color: #000000;
}

.btn-primary {
	margin: 20px 0px 20px;
	background-color: #1ebdd8;
	border-color: #1ebdd8;
	color: #FFF;
}

.btn-primary:hover, .btn-primary:focus {
	border-color: #28a39f;
	background-color: #28a39f;
	color: #FFF;
}

#divBtn{
	text-align:center;
}
#inputEmail{
	display:inline-block;
}
ul {
	margin: auto;
}

li {
	width: 130px;
}
</style>

</head>

<body>
	<nav class="navbar navbar-expand-md navbar-light navbar-fixed-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp"><img src="logo/bridge_logo2.png"
				width="150px"></a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">소개</a></li>
				<li class="nav-item"><a class="nav-link" href="#">후원안내</a></li>
				<li class="nav-item"><a class="nav-link" href="to_write.board">후원해 주세요</a></li>
				<li class="nav-item"><a class="nav-link" href="textList.board?currentPage=1">후원 게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="Logout.members">로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<div class="wrapper">
		<div class="title">
			<h3>후원 내역</h3>
		</div>
		<div class="form-group">
			<p>후원자 : ${payment.name }</p>
		</div>
		<div class="form-group">
			<p>이메일 : ${payment.email }</p>
		</div>
		<div class="form-group">
			<p>전화번호 : ${payment.phone }</p>
		</div>
		<div class="form-group">
			<p>후원하신 금액 : ${payment.amount }원</p>
		</div>
		<div id="divBtn">
			<a id="btnMyPage" class="btn btn-primary" href="Mypage.members">마이페이지</a>
			<a id="btnBoard" class="btn btn-primary" href="Board.board">후원게시판</a>
			<a id="btnMain" class="btn btn-primary" href="Main.members">메인으로</a>
		</div>
	</div>
</body>

</html>