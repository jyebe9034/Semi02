<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
  src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
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
/* .top_wrapper{ */
/* 	display:flex; */
/* 	justify-content:space-around; */
/* 	height:40px; */
/* 	align-items:center; */
/* 	position:relative; */
/* 	margin:auto; */
/* } */
a {
	font-weight: bold;
}

a:hover {
	color: #000000;
}
ul{
	margin:auto;
}
#navbarNav{
	
}
li{
	width:130px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="logo">
			<a class="navbar-brand" href="Main.members"
				style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="Introduce.members">소개</a></li>
				<li class="nav-item"><a class="nav-link" href="write.board">후원해
						주세요</a></li>
				<li class="nav-item"><a class="nav-link"
					href="textList.board?currentPage=1">후원 게시판</a></li>
				<li class="nav-item"><a class="nav-link"
					href="LoginForm.members">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="JoinForm.members">회원가입</a></li>
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
						name="email" aria-describedby="emailHelp" placeholder="이메일 주소(아이디)" required>
				</div>
				<div class="form-group">
					<input type="password" class="form-control"
						id="exampleInputPassword1" name="pw"
						placeholder="비밀번호 (영문,숫자,특수문자 포함 8자 이상)" required>
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
 <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	<hr>			
				<div id="toJoin">
					아직 계정이 없으신가요?&nbsp;&nbsp;&nbsp;<a href="JoinForm.members" id="a_join"
						style="color: black">가입하기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>