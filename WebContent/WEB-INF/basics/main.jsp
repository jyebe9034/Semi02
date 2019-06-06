<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기</title>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Jeju+Gothic|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="nav_footer.css">
<style>
body{
	min-width:375px;
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
	max-height: 700px;
	min-height: 300px;
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
	margin-bottom:0px;
	padding:2rem 2rem;
}
.text {
	vertical-align: middle;
	font-family: "Jua";
}

	.imgTag{
		border-radius:10px;
	}

.guide{
	text-align:center;
	margin-top:30px;
	margin-bottom:30px;
}
.aboveCard{
	text-align:center;
	margin-top:30px;
	margin-bottom:30px;
}
 .step{ 
 	height: 150px; 
 	border-radius: 50%; 
	font-family: "Do Hyeon"; 
 	padding: 10px; 
 	text-align:center; 
 	display:flex; 
 	justify-content:center;
} 
.forArrow{ 
	line-height:110px;
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="logo">
			<a class="navbar-brand anker" href="Main.members"
				style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
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
	<div class="guide" style="font-family:Do Hyeon"><h2>후원 안내</h2></div>
	<div class="container">
		<div class="row rowStep">
			<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
				<div style="display:inline-block;">
				<img src="photo_image/write2.png">
				<p></p>
				<h4>후원 게시판에서 후원 요청 글 작성</h4>
				</div>
			</div>
			<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
				<div class="forArrow"><img src="photo_image/arrow.png" style="margin-right:20px;"></div>
				<div style="display:inline-block;">
				<img src="photo_image/board.png">
				<p></p>
				<h4>게시판에 글 등록</h4>
				</div>	
			</div>
			<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
				<div class="forArrow"><img src="photo_image/arrow.png" style="margin-right:20px;"></div>
				<div style="display:inline-block;">
				<img src="photo_image/donate.png">
				<p></p>
				<h4>후원자분들의 기부금 결제</h4>
				</div>	
			</div>
			<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
				<div class="forArrow"><img src="photo_image/arrow.png" style="margin-right:20px;"></div>
				<div>
				<img src="photo_image/transfer.png">
				<p></p>
				<h4>모금 마감일에 모금액 전액 후원 요청자분께 전달</h4>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<div class="aboveCard" style="font-family:Do Hyeon;"><h2>여러분의 작은 도움이 그들에게 큰 힘이 됩니다.</h2></div>
	<div class="container container_card">
		<div class="row rowcard">
			<c:choose>
			<c:when test="${listSize == 0 }"></c:when>
			<c:otherwise>
				<c:forEach var="i" begin="0" end="${listSize-1}">
					<div class="card col-lg-4 col-md-12 col-sm-12">
						<div class="imgBox">
							<img src="${imgSrc[i] }" class="imgTag" width="100%">
						</div>
						<div class="card-body">
							<h6 class="card-title">
								<span>${list[i].title}</span>
							</h6>
							<hr>
							<p class="card-text" align="left">
								모금 마감일 <br> <span>${duedate[i]}</span><br> 모금현황<br>
								<span>${percentage[i]}%</span>
							<div class="progress">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${percentage[i]}%"></div>
							</div>
							<div class="forBtnDonate"><a class="btn btn-primary" href="Read.board?boardNo=${list[i].boardNo }&currentPage=1&commentPage=1">후원하기</a></div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="jumbotron" style="font-family:Do Hyeon">
		<h1 class="display-5">2019년 도움닿기 후원 현황</h1>
		<h2 class="display-4">${totalAmount }원</h2>
		<h2 class="display-4">${countDonors }명</h2>
	</div>
	<div id="footer">
		<div id="f_logo_wrap">
			<a id="f_logo" href="Main.members"
				style="font-family: Cute Font"><h1>도움닿기</h1></a>
		</div>
		<div id="f_info_wrap">
			<div id="f_info">
				행동하는 당신과 당신의 도움으로<br>다시 희망을 찾는 사람들을 응원힙니다.
			</div>
		</div>
		<div id="f_sns">
			<img id="kakao" class="sns" src="photo_image/ka.png"> <img
				class="sns" src="photo_image/fa.png"> <img id="insta"
				class="sns" src="photo_image/kk.png"> <a href="write.board"><div id="suggest">후원 신청</div></a>
		</div>
		<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	</div>
</body>
</html>

