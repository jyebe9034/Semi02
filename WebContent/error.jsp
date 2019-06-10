<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<link
href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
rel="stylesheet">
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="nav_footer.css">
<style>
   #wrapper *{
      text-align: center;
      }
      
   .title{
      font-family: "Nanum Gothic";
      font-size: 50px;
      font-weight: bold;
      color: darkslategray;
      margin-top: 200px;
      margin-bottom: 50px;
   }
   .contents{
      font-family: "Nanum Gothic";
      font-size: 18px;
      color: gray;
      margin: auto;
   }
   .btnArea{
      text-align: center;
      margin: auto;
      margin-bottom: 200px;
   }
   #goMainBtn {
      background-color: #1ebdd8;
      border-color: #1ebdd8;
      color: #FFF;   
      margin-top: 30px;
   }
   #goMainBtn:hover {
      border-color: #28a39f;
      background-color: #28a39f;
      color: #FFF;
   }
   #footer{
	   position: fixed;
	   bottom: 0;
   }
</style>
<script>
   $(function(){
      $("#goMainBtn").on("click",function(){
         location.href="Main.members";
      })
   })
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light">
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
	<div id=wrapper>
		<p class="title">에러가 발생했습니다.</p>
		<p class="contents">관리자에게 문의해 주십시오.</p>
		<p class="contents">관리자 이메일 : moonblack_@naver.com</p>
	</div>
	<div class=btnArea>
		<button class="btn" id=goMainBtn>메인으로</button>	
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
    </body>
</html>
