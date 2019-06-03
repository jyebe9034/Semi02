<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Introduce</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Bitter|Dancing+Script|Inconsolata|Indie+Flower|Nanum+Pen+Script|Poiret+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
	div{
    	box-sizing: border-box;
	}
	#image{
		max-height: 700px;
	}
	.introMain{
	    max-height: 850px;
	    min-height: 400px;
	    object-fit: cover;
	    width: 100%;
	}
	body {
		font-family: "Nanum Gothic";
		height: 100%;
	}
	.wrapper {
		display: inline-block;
	}
	.navA{
		font-weight: bold;
		color: #fcfcfc;
	}
	.navA:hover {
		color: #000000;
		text-decoration: none;
	}
	ul {
		margin: auto;
	}
	li {
		width: 130px;
	}
	.nav_link {
		font-family: "Nanum Gothic";
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
	#wrap{
		position: relative;
	}
	.card-title{
		font-size: 30px;
        font-weight: bold;
	}
    .card-text{
        font-size: 20px;
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
		line-height: 50px;
		float: right;
		margin-left: 15px;
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
	<div id="root">
		<div id="wrapper">
			<nav class="navbar navbar-expand-md navbar-light navbar-fixed-top">
				<div class="logo">
					<a class="navbar-brand" href="Main.members" style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link navA" href="Introduce.members">소개</a></li>
						<li class="nav-item"><a class="nav-link navA" href="#">후원안내</a></li>
						<li class="nav-item"><a class="nav-link navA" href="to_write.board">후원해 주세요</a></li>
						<li class="nav-item"><a class="nav-link navA" href="textList.board?currentPage=1">후원 게시판</a></li>
		
						<c:choose>
							<c:when test="${sessionScope.loginEmail != null || navercontents.name != null}">
								<li class="nav-item"><a class="nav-link navA"
									href="Logout.members">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link navA" href="LoginForm.members">로그인</a></li>
								<li class="nav-item"><a class="nav-link navA" href="JoinForm.members">회원가입</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</nav>
			
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
				    <div class="carousel-item active">
				        <img id="image" src="editGiveyou.PNG" class="d-block w-100" alt="이미지를 찾을 수 없습니다.">
				    </div>
				</div>
			</div>
			
			<div class="card text-center">
			  <div class="card-body">
			  	<div id="wrap">
				    <h5 class="card-title">도움닿기는</h5><br>
				    
				    <p class="card-text text-center">여러분의 기부가 도움이 필요한 사람들에게 닿아<br>
					그들이 도움닫기 하여 더 높이 더 멀리 나아갈 수 있도록 하고 싶은 마음들이 모여 만들어진<br> 열린 기부 공간입니다.</p>
					
					<p class="card-text text-center">후원 요청 글은 회원에 한해 자유롭게 게시판에 올릴 수 있습니다.<br> 
					기부된 금액은 100% 대상자에게 전달됩니다.<br> 후원 금액은 마감일까지 모금된 뒤 마감일에 대상자에게 전달됩니다.</p>
			  	</div>
			  </div>
			</div>
			
			<div id="footer">
	            <div id="f_logo_wrap">
					<a id="f_logo" href="Main.members" style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
				</div>
				<div id="f_info_wrap">
					<div id="f_info">행동하는 당신과 당신의 도움으로<br>다시 희망을 찾는 사람들을 응원힙니다.</div>
				</div>
				<div id="f_sns">
					<img id="kakao" class="sns" src="ka.png">
					<img class="sns" src="fa.png">
					<img id="insta" class="sns" src="kk.png">
					<a href="/"><div id="suggest">후원 신청</div></a>
				</div>
				<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	        </div>
		</div>
	</div>
</body>
</html>