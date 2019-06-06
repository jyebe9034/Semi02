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

<link rel="stylesheet" href="nav_footer.css">
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
	.wrapper {
		display: inline-block;
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
</style>
</head>
<body>
	<div id="root">
			<nav class="navbar navbar-expand-md navbar-light">
		<div class="logo">
			<a class="navbar-brand anker" href="Main.members" style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
		</div>
		<div id="toggle">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav nav-ul">
				<li class="nav-item nav-li"><a class="nav-link anker" href="Introduce.members">소개</a></li>
				<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="TalentDonations.board">재능기부 게시판</a></li>
				<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages">후원 게시판</a></li>
	
				<c:choose>
					<c:when test="${sessionScope.loginEmail != null}">
						<c:if test="${sessionScope.admin==null}">
							<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="myPage.members?currentPage=1&currentPage2=1">마이 페이지</a></li>
						</c:if>	
						<c:if test="${sessionScope.admin!=null}">
							<li class="nav-item nav-li"><a class="nav-link anker" href="Bar.manager">대시보드</a></li>
						</c:if>
						<li class="nav-item nav-li"><a class="nav-link anker" href="Logout.members">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item nav-li"><a class="nav-link anker ml-1 pr-0" href="LoginForm.members">로그인</a></li>
						<li class="nav-item nav-li"><a class="nav-link anker pl-0" href="JoinForm.members">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
		
		<hr style="margin:0px;">
		
		<div id="wrapper">
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
				    <div class="carousel-item active">
				        <img id="image" src="photo_image/editGiveyou.PNG" class="d-block w-100" alt="이미지를 찾을 수 없습니다.">
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
					<img id="kakao" class="sns" src="photo_image/ka.png">
					<img class="sns" src="photo_image/fa.png">
					<img id="insta" class="sns" src="photo_image/kk.png">
					<a href="checkLogin.members"><div id="suggest">후원 신청</div></a>
				</div>
				<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	        </div>
		</div>
	</div>
</body>
</html>