<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
	<style>
		
		body{
			background-image:url("sunset1.jpg");
			background-size:cover;
			background-repeat:no-repeat;
			font-family:"Nanum Gothic";
			height:100%;
		}
	
		.login_box{
			
			width:400px;
			margin:auto;
			padding:40px;
			border:1px solid #e4e4e4;
			border-radius:5px;
			
		}
		a{
			transition:transform .2s;
		}
		a:hover{
			text-decoration:none;	
			font-weight:bold;		
		}
		#toJoin{
			color:black;
			text-align:center;
			font-size:15px;
			text-decoration:none;
			margin-bottom:20px;
		}
		.form-control::placeholder{
			font-size:15px;
			color:white;
		}
		.form-control{
			background:transparent;
			color:white;
		}
		.form-control:focus{
			background:transparent;
			color:white;
		}
		
		#forget_pw{
			margin-top:20px;
			text-decoration:none;
			font-size:14px;
		}
	
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="login_box">
		<form action="" method="post">
			<div class="form-group">
				<input type="email"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="이메일 주소 입력"> 
			</div>
			<div class="form-group">
				<input type="password"
					class="form-control" id="exampleInputPassword1"
					placeholder="비밀번호 입력">
			</div>
			<button type="submit" class="btn btn-primary btn-md btn-block" style="font-size:18px">로그인</button><br>
			<div id="toJoin">아직 계정이 없으신가요?&nbsp;&nbsp;&nbsp;<a href="" id="a_join" style="color:black">가입하기</a></div>
		</form>
		<hr>
		<div id="forget_pw" style="text-align:center"><a href="" style="color:black">혹시 비밀번호를 잊으셨나요?</a></div>
		</div>
	</div>
</body>
</html>