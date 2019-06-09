<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기 - 소개</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Noto+Sans+KR|Sunflower:300|Jua|Poor+Story|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
		font-family: "Nanum Gothic"; 
		margin-top : 50px;
		text-align: center;
	}
    .runup{
    	font-size : 35px;
    	font-weight: bold;
    }
    .explain{
    	font-size : 20px;
    }
    .step{ 
 	height: 150px; 
 	border-radius: 50%; 
	font-family: "Nanum Gothic"; 
 	padding: 10px; 
 	text-align:center; 
 	display:flex; 
 	justify-content:center;
} 
.forArrow{ 
	line-height:110px;
}
.mainSteps{
	font-size: 16px;
}
.step_list{
	margin-left: 30px; 
}
#firstStep{
	padding-left: 80px;
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
				<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages&classification=ongoing">후원 게시판</a></li>

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
			
			  	<div id="wrap">
				    <p class="runup">도움닿기는<br></p><br>
				    
				    <p class="explain">여러분의 기부가 도움이 필요한 사람들에게 닿아<br>
					그들이 도움닫기 하여 더 높이 더 멀리 나아갈 수 있도록<br>하고 싶은 마음들이 모여 만들어진  열린 기부 공간입니다.</p><br>
					
					<p class="explain">후원 요청 글은 회원에 한해<br> 자유롭게 게시판에 올릴 수 있으며<br> 
					기부된 금액은 100% 대상자에게 전달됩니다.<br><br><br>
					
					<p class="runup">[  후원 안내  ]<br></p><br>
					
					<div class="container">
						<div class="row rowStep">
							<div id="firstStep" class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
								<div style="display:inline-block;">
								<img src="photo_image/write2.png">
								<p></p>
								<h4 class="mainSteps">후원 게시판에서<br>신청 글 작성</h4>
								</div>
							</div>
							<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
								<div class="forArrow"><img src="photo_image/arrow.png" style="margin-right:20px;"></div>
								<div class="step_list" style="display:inline-block;">
								<img src="photo_image/board.png">
								<p></p>
								<h4 class="mainSteps">게시판에 글 등록</h4>
								</div>	
							</div>
							<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
								<div class="forArrow"><img src="photo_image/arrow.png" style="margin-right:20px;"></div>
								<div class="step_list" style="display:inline-block;">
								<img src="photo_image/donate.png">
								<p></p>
								<h4 class="mainSteps">후원자분들의<br>기부금 결제</h4>
								</div>	
							</div>
							<div class="step col-lg-3 col-md-6 col-sm-6 col-xs-6">
								<div class="forArrow"><img src="photo_image/arrow.png" style="margin-right:20px;"></div>
								<div class="step_list" style="display:inline-block;">
								<img src="photo_image/transfer.png">
								<p></p>
								<h4 class="mainSteps">모금 마감일에<br>모금액 전액 전달</h4>
								</div>
							</div>
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
	
</body>
</html>