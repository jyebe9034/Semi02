<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	body {
		font-family: "Nanum Gothic";
		height: 100%;
	}
	.progress {
		width: 200px;
	}
	.progress-bar {
		background-color: orange;
	}
	.wrapper {
		display: inline-block;
	}
	.anker{
		font-weight: bold;
	}
	.anker:hover{
		color: #000000;
	}
	.nav-li{
		width: 130px;
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
	.carousel {
		width: 100%;
		height: 100%;
		margin: auto;
	}
	.img_carousel {
		max-height: 730px;
		object-fit: cover;
	}
	.card {
		border-radius: 10px;
		min-width: 300px;
	}
	.container_card {
		margin: auto;
	}
	.jumbotron {
		background-image: url("photo_image/redheartbluesky.jpg");
		background-size: cover;
		font-family: "Jua";
		text-align: center;
		margin-top: 40px;
	}
	.step1, .step2, .step3, .step4 {
		width: 200px;
		height: 200px;
		border-radius: 10px;
		font-family: "Jua";
		padding: 10px;
	}
	.text {
		vertical-align: middle;
		font-family: "Jua";
	}
	.navbar {
		position: relative;
		height: 60px;
	}
	.logo {
		position: absolute;
		top: 10%;
		left: 15%;
	}
	#navbarNav {
		line-height: 40px;
		position: relative;
		top: 30%;
		left: 50%;
	}
	#toggle{
		position: absolute;
		top: 30%;
		right: 5%;
	}
	#footer{
        height: 200px;
        width: 100%;
        background-color: #2d3f53;
        align-items: center;
        position: relative;
        margin-top: 30px;
	}
	#f_logo{
		color: #98ddde;
        text-decoration: none;
	}
	#f_logo_wrap{
        position: absolute;
        left: 15%;
        top: 20%;
	}
	#f_info_wrap{
		position: absolute;
		right: 15%;
		top: 20%;
	}
	#f_info{
		color: gray;
		text-align: right;
		font-size: 13px;
		float: left;
		padding-top: 5px;
		margin-right: 10px;
	}
	#suggest{
		display: inline-block;
		background-color: #fa7268;
		border-radius: 10%;
		color: white; 
		width: 90px;
		height: 45px;
		text-decoration: none;
		line-height: 45px;
		float: right;
		margin-left: 15px;
		text-align: center;
	}
	#f_sns{
		position: absolute;
		right: 15%;
		top: 47%;
	}
	.sns{
		width: 30px;
		height: 30px;
		margin: 3px;
	}
	#kakao{
		width: 40px;
		height: 40px;
	}
	#insta{
		width: 32px;
		height: 32px;
		margin-left: 8px;
	}
	#copyright{
		color: gray;
		position: absolute;
		right: 15%;
		top: 70%;
		font-size: 13px;
		margin-top: 5px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light">
		<div class="logo">
			<a class="navbar-brand anker" href="Main.members" style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav nav-ul">
				<li class="nav-item nav-li"><a class="nav-link anker" href="Introduce.members">소개</a></li>
				<li class="nav-item nav-li"><a class="nav-link anker" href="TalentDonations.board">재능기부 게시판</a></li>
				<li class="nav-item nav-li"><a class="nav-link anker" href="List.board?currentPage=1&&searchOption==null&&searchWord==null">후원 게시판</a></li>
	
				<c:choose>
					<c:when test="${sessionScope.loginEmail != null}">
						<li class="nav-item nav-li"><a class="nav-link anker" href="Mypage.members">마이 페이지</a></li>
						<li class="nav-item nav-li"><a class="nav-link anker" href="Logout.members">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item nav-li"><a class="nav-link anker" href="LoginForm.members">로그인</a></li>
						<li class="nav-item nav-li"><a class="nav-link anker" href="JoinForm.members">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	<hr>

	<!-- 캐러셀 -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" data-interval="5000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="photo_image/bestgift.jpg"
					class="d-block w-100 img_carousel" alt="...">
			</div>
			<div class="carousel-item">
				<img src="photo_image/hands_together.jpg"
					class="d-block w-100 img_carousel" alt="...">
			</div>
			<div class="carousel-item">
				<img src="photo_image/girls_heart_2.jpg"
					class="d-block w-100 img_carousel" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<hr>

	<div class="container">
		<div class="row">
			<div class="step1 col-lg-3 col-md-6 col-sm-6 col-xs-6"
				style="background-color: #8be1ef">
				<h1>1</h1>
				<h4>후원 요청 글과 함께 은행명, 계좌번호를 입력하면</h4>
			</div>
			<div class="step2 col-lg-3 col-md-6 col-sm-6 col-xs-6"
				style="background-color: #60d6ea">
				<h1>2</h1>
				<h4>후원 게시판에 글이 등록이 되고</h4>
			</div>
			<div class="step3 col-lg-3 col-md-6 col-sm-6 col-xs-6"
				style="background-color: #3bd3ed;">
				<h1>3</h1>
				<h4>후원자분들이 기부금을 결제하면</h4>
			</div>
			<div class="step4 col-lg-3 col-md-6 col-sm-6 col-xs-6"
				style="background-color: #1ebdd8;">
				<h1>4</h1>
				<h4>모금 마감일에 모금액 전액이 일괄적으로 후원 요청자분께 전달됩니다.</h4>
			</div>
		</div>
	</div>

	<hr>
	<div class="container container_card">
		<div class="row rowcard">
			<div class="card col-lg-4 col-md-12 col-sm-12">
				<div id="imgBox1" class="imgBox"></div>
				<div class="card-body">
					<h6 class="card-title">
						<span id="title1">${list[0].title}</span>
					</h6>
					<hr>
					<p class="card-text" align="left">
						모금 마감일 <br> <span id="dueDate1">${duedate[0]}</span><br> 모금현황<br>
						<span id="percentage1">${percentage[0]}</span>
					<div class="progress">
						<div id="card1" class="progress-bar" role="progressbar"
							aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="forBtnDonate"><a class="btn btn-primary" href="Read.board?boardNo=1&commentPage=1">후원하기</a></div>
				</div>
			</div>
			<div class="card col-lg-4 col-md-12 col-sm-12">
				<div id="imgBox2" class="imgBox">
					<img src="" class="card-img-top" alt="...">
				</div>
				<div class="card-body">
					<h6 class="card-title">
						<span id="title2">${list[1].title}</span>
					</h6>
					<hr>
					<p class="card-text">
						모금 마감일 <br> <span id="dueDate2">${duedate[1]}</span><br> 모금현황<br>
						<span id="percentage2">${percentage[1]}</span>
					<div class="progress">
						<div id="card2" class="progress-bar" role="progressbar"
							aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="forBtnDonate"><a class="btn btn-primary" href="Read.board?boardNo=1&commentPage=1">후원하기</a></div>
				</div>
			</div>
			<div class="card col-lg-4 col-md-12 col-sm-12">
				<div id="imgBox3" class="imgBox">
					<img src="" class="card-img-top" alt="...">
				</div>
				<div class="card-body">
					<h6 class="card-title">
						<span id="title3">${list[2].title}</span>
					</h6>
					<hr>
					<p class="card-text">
						모금 마감일 <br> <span id="dueDate3">${duedate[2]}</span><br> 모금현황<br>
						<span id="percentage3">${percentage[2]}</span>
					<div class="progress">
						<div id="card3" class="progress-bar" role="progressbar"
							aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="forBtnDonate"><a class="btn btn-primary" href="Read.board?boardNo=1&commentPage=1">후원하기</a></div>
				</div>
			</div>
		</div>
	</div>
	<div class="jumbotron">
		<h1 class="display-4">2019년 도움닿기 후원 현황</h1>
		<p class="lead">
			<h2>여러분의 사랑이 이렇게 모아졌습니다.</h2><br>
			<h2><span id="amount"></span></h2><br>
			<h2>현재 후원자수 : <span id="countDonors"></span></h2>
		</p>
		<hr class="my-4">
	</div>
	
	<div id="footer">
		<div id="f_logo_wrap">
			<a id="f_logo" href="Main.members" style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
		</div>
		<div id="f_info_wrap">
			<div id="f_info">행동하는 당신과 당신의 도움으로<br>다시 희망을 찾는 사람들을 응원힙니다.</div>
		</div>
		<div id="f_sns">
			<img id="kakao" class="sns" src="photo_image/ka.png">
			<img class="sns" src="photo_image/fa.png">
			<img id="insta" class="sns" src="photo_image/kk.png">
			<a href="write.board"><div id="suggest">후원 신청</div></a>
		</div>
		<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	</div>
	
	
	<script>
		$.ajax({
			url : "totalAmountDonors.board",
			dataType : "json"
		}).done(function(resp) {
			$("#amount").text(resp.totalAmount + " 원");
			$("#countDonors").text(resp.countDonors + " 명");
		});
		
		$.ajax({
			url : "titleImagesMain.board",
			dataType : "json"
		}).done(function(resp) {
			$("#imgBox1").html(resp.imgTag1);
			$("#imgBox2").html(resp.imgTag2);
			$("#imgBox3").html(resp.imgTag3);
		});
	</script>
</body>
</html>