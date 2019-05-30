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
	#text01{
		position: absolute;
		top: 33%;
		left: 40%;
		color: #fcfcfc;
	}
	#text02{
		position: absolute;
		top: 55%;
		left: 33%;
		color: #fcfcfc;
	}
	.card-title{
		font-size: 30px;
        font-weight: bold;
	}
    .card-text{
        padding-left: 400px;
        padding-right: 400px;
        font-size: 20px;
    }
    #lastmenu1{
        float: left;
        margin: 120px;
        padding-left: 500px;
        font-family: 'Poiret One', cursive;
    }
    #lastmenu2{
        float: left;
        margin: 50px;
        padding-left: 50px;
        font-family: 'Poiret One', cursive;
    }
    #lastmenu3{
        float: left;
        margin: 120px;
        padding-left: 50px;
        font-family: 'Poiret One', cursive;
    }
    #footer{
        height: 250px;
        width: 100%;
        background-color: #2d3f53;
        align-items: center;
        position: relative;
	}
    .sublast1{
        list-style: none;
        position: absolute;
        top: 40px;
        padding: 10px;
    }
    .sublast2{
        list-style: none;
        position: absolute;
        top: 40px;
        padding: 10px;
    }
    .sublast3{
        list-style: none;
        position: absolute;
        top: 40px;
        padding: 10px;
    }
    .sub-last{
    	width: 200px;
    	font-weight: light;
    }
    .sub-last:hover{
    	color : #fa7268;
    }
    .sub-last1{
    	width: 200px;
        padding: 10px;
        font-size: 20px;
        color: #95afbf;
    }
    .sub-last2{
        padding: 5px;
    }
    .sub-last3{
        padding: 10px;
    }
    #footerMenu01{
    	color: #fcfcfc;
    }
    #footerMenu02{
    	color: #fcfcfc;
    }
    #footerMenu03{
    	color: #fcfcfc;
    }
    #footerMenu04{
    	color: #fcfcfc;
    }
    #footerMenu05{
    	color: #fcfcfc;
    }
    #footerMenu06{
    	color: #fcfcfc;
    }
    #footerMenu07{
    	color: #fcfcfc;
    }
    #footerMenu08{
    	color: #fcfcfc;
    }
    #footerMenu09{
    	color: #fcfcfc;
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
			<div id="mainPhoto" class="container">
				<div class="row">
					<div id="wrap" class="col-12">
						<img src="giveyou01.jpg" class="introMain p-0 m-0">
						<h1 id="text01">도움닿기란?</h1>
						<h3 id="text02">"도움닫기 + 닿다" 의 합성어</h3>
					</div>
				</div>
			</div>
			
			<div class="card text-center">
			  <div class="card-body">
			    <h5 class="card-title">도움닿기는</h5><br>
			    
			    <p class="card-text text-center">여러분의 기부가 도움이 필요한 사람들에게 닿아<br>
				그들이 도움닫기 하여 더 높이 더 멀리 나아갈 수 있도록 하고 싶은 마음들이 모여 만들어진<br> 열린 기부 공간입니다.</p>
				
				<p class="card-text text-center">후원 요청 글은 회원에 한해 자유롭게 게시판에 올릴 수 있습니다.<br> 
				기부된 금액은 100% 대상자에게 전달됩니다.<br> 후원 금액은 마감일까지 모금된 뒤 마감일에 대상자에게 전달됩니다.</p>
			  </div>
			</div>
			
			<div id="footer">
	            <div id="lastmenu1">
	                <ul class="sublast1">
	                    <li class="sub-last1"> Hello, Getaway </li>
	                    <li id="footerMenu01" class="sub-last"><a href=""> About </a></li>
	                    <li id="footerMenu02" class="sub-last"><a href=""> FAQ </a></li>
	                    <li id="footerMenu03" class="sub-last"><a href=""> Contact Us </a></li>
	                </ul>
	            </div>
	            <div id="lastmenu2">
	                <ul class="sublast2">
	                    <li class="sub-last1"> Ways to Escape </li>
	                    <li id="footerMenu04" class="sub-last"><a href=""> Multi-Night Packs </a></li>
	                    <li id="footerMenu05" class="sub-last"><a href=""> Student Program </a></li>
	                    <li id="footerMenu06" class="sub-last"><a href=""> Artist Fellowships </a></li>
	                </ul>
	            </div>
	            <div id="lastmenu3">
	                <ul class="sublast3">
	                    <li class="sub-last1"> The Getaway Way </li>
	                    <li id="footerMenu07" class="sub-last"><a href=""> The Journal </a></li>
	                    <li id="footerMenu08" class="sub-last"><a href=""> The Getaway Podcast </a></li>
	                    <li id="footerMenu09" class="sub-last"><a href=""> The Book </a></li>
	                </ul>
	            </div>
	        </div>
		</div>
	</div>
</body>
</html>