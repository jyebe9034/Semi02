<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	body {
		font-family: "Nanum Gothic";
		height: 100%;
	}
	
	.login_box {
		width: 400px;
		margin: auto;
		padding: 40px;
		border: 1px solid #e4e4e4;
		border-radius: 5px;
	}
	
	a:hover {
		text-decoration: none;
		font-weight: bold;
	}
	
	#toJoin {
		color: black;
		text-align: center;
		font-size: 15px;
		text-decoration: none;
		margin: 20px 0px 20px;
	}
	
	.form-control::placeholder {
		font-size: 15px;
	}
	
	#forget_pw {
		margin-top: 20px;
		text-decoration: none;
		font-size: 14px;
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
	
	.btn-primary:active, .btn-primary:visited, .btn-primary:active:focus,
		.btn-primary:active:hover {
		border-color: #639d34;
		background-color: #639d34;
		color: #FFF;
	}
	
	.title {
		margin-bottom: 20px;
	}
	
	.save_find {
		font-size: 13px;
		display: inline-block;
	}
	
	.find_id {
		text-align: right;
	}
	
	.wrapper{
		margin-top: 50px;
	}
	.anker{
		font-weight: bold;
	}
	.anker:hover{
		color: #000000;
	}
	.nav-li{
		width: 110px;
	}
	.navbar {
		position: relative;
		height: 60px;
	}
	#logos{
		width: 140px;
	}
	.logo {
		position: absolute;
		top: 10%;
		left: 15%;
	}
	#navbarNav {
		max-width: 500px;
		line-height: 40px;
		position: relative;
		top: 30%;
		left: 55%;
		text-align: center;
	}
	#toggle{
		position: absolute;
		top: 30%;
		right: 5%;
	}
	#kakao-login-btn{
		width : 193px;
		height : 47px;
	}
	#footer{
        height: 200px;
        width: 100%;
        background-color: #2d3f53;
        align-items: center;
        position: absolute;
        margin-top: 30px;
        bottom: 0;
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
				<li class="nav-item nav-li mr-3"><a id="logos" class="nav-link anker" href="TalentDonations.board">재능기부 게시판</a></li>
				<li class="nav-item nav-li ml-3"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&&searchOption==null&&searchWord==null">후원 게시판</a></li>
	
				<c:choose>
					<c:when test="${sessionScope.loginEmail != null}">
						<li class="nav-item nav-li"><a class="nav-link anker" href="Mypage.members">마이 페이지</a></li>
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
	<hr>
	<div class="wrapper">
		<div class="login_box">
			<div class="title">
				<h3>로그인</h3>
			</div>
			<form action="Login.members" method="post">
				<div class="form-group">
					<input type="email" class="form-control" id="exampleInputEmail1"
						name="email" aria-describedby="emailHelp"
						placeholder="이메일 주소(아이디)" required>
				</div>
				<div class="form-group">
					<input type="password" class="form-control"
						id="exampleInputPassword1" name="pw"
						placeholder="비밀번호 (영문,숫자,특수문자 포함 8자 이상)" required>
				</div>
				<div class="save_find">
					<a href="" class="find_id" style="color: black">아이디·비밀번호 찾기></a>
				</div>
				<button type="submit" class="btn btn-primary btn-md btn-block"
					style="font-size: 18px; font-weight: bold;">로그인</button>
				<%
					String clientId = "9fcJ6ehu7V7mEFnBQABz";//애플리케이션 클라이언트 아이디값";
					String redirectURI = URLEncoder.encode("http://localhost/naverLogin.members", "UTF-8");
					SecureRandom random = new SecureRandom();
					String state = new BigInteger(130, random).toString();
					String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					apiURL += "&client_id=" + clientId;
					apiURL += "&redirect_uri=" + redirectURI;
					apiURL += "&state=" + state;
					session.setAttribute("state", state);
				%>
				<a href="<%=apiURL%>" id="naver"><img height="47" width="120"
					src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
					<a id="kakao-login-btn"></a>
					<a href="http://developers.kakao.com/logout"></a>
				<div id="toJoin">
					아직 계정이 없으신가요?&nbsp;&nbsp;&nbsp;<a href="JoinForm.members"
						id="a_join" style="color: black">가입하기</a>
				</div>
			</form>
			<hr>
			<div id="forget_pw" style="text-align: center">
				<a href="" style="color: black">혹시 비밀번호를 잊으셨나요?</a>
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
			<a href="write.board"><div id="suggest">후원 신청</div></a>
		</div>
		<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	</div>
	
	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('95dd9e37f2f0e7fa6479b04e4ad29068');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {

          Kakao.API.request({
              url: '/v1/user/me',
              success: function(res) {
               
               var userID = res.id;      //유저의 카카오톡 고유 id
               var userNickName = res.properties.nickname; //유저가 등록한 별명
               
               console.log(userID);
               console.log(userNickName);
               
               location.href="kakaoLogin.members?contents="+userID+","+userNickName;

               
              },
              fail: function(error) {
               alert(JSON.stringify(error));
              }
             });
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
</body>
</html>