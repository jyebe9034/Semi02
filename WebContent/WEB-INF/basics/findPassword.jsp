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
<title>도움닿기 - 비밀번호 찾기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<link rel="stylesheet" href="nav_footer.css">
<style>
html, body {
   height: 89%;
}
.wrapper{
	min-height: 100%;
	margin: 0 auto -155px;
}
.push{
	height: 200px;
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
	#kakao-login-btn{
		width : 193px;
		height : 47px;
	}
	#btnInputNum, #btnUpdatePw {/* .pwBox,*/
		display: none;
	}
	#inputEmail, #inputNum {
		display: inline-block;
	}
	#pw_form, #pw_match{
		font-size: 12px;
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
	<div class="wrapper">
		<div class="login_box">
			<div class="title">
				<h3>비밀번호 찾기</h3>
				<hr></hr>
			</div>
			<form action="FindPW.members" id="findPwForm" method="post">
				<div class="form-group">
					<input type="email" class="form-control" id="inputEmail"
						name="email" aria-describedby="emailHelp"
						placeholder="이메일 주소(아이디)" required>
					<p></p>
					<input type="hidden" class="form-control" id="inputNum"
               			placeholder="*인증번호" style="width: 70%" flag="false" required>
            		<button type="button" id="btnInputNum" class="btn btn-outline-info">확인</button>
				</div>
				<div class="form-group" width="100%">
					<input type="hidden" class="form-control" width="100%" id="inputPassword"
					name="pw" placeholder="*비밀번호" required>
 					<p id="pw_form"></p>
				</div>
				<div class="form-group pwBox">
					<input type="hidden" class="form-control" id="checkPassword"
					placeholder="*비밀번호 확인" required>
					<p id="pw_match"></p>
				</div>
				<button type="button" id="btnConfirmEmail" class="btn btn-primary btn-md btn-block"
					style="font-size: 18px; font-weight: bold;">인증번호 받기</button>
				<button type="button" id="btnUpdatePw" class="btn btn-primary btn-md btn-block"
					style="font-size: 18px; font-weight: bold;">비밀번호 변경하기</button>
				<div id="toJoin">
					아직 계정이 없으신가요?&nbsp;&nbsp;&nbsp;<a href="JoinForm.members"
						id="a_join" style="color: black">가입하기</a>
				</div>
			</form>
		</div>
		<div class="push"></div>
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
	<script>
		var emailCheck;
		$("#inputEmail").on("input", function() {
	         $.ajax({
	            url : "EmailDuplCheck.members",
	            type : "post",
	            data : {
	               email : $("#inputEmail").val()
	            }
	         }).done(function(resp) {
	            if (resp == "false") {
					emailCheck = true;
	            } else {
	            	emailCheck = false;
	            }
	            console.log(emailCheck);
	         })
		});
		$("#btnConfirmEmail").on("click", function(){
			if ($("#inputNum").attr("flag") == "true") {
	            alert("이미 인증이 완료되었습니다.");
	            return;
	         }
	         if ($("#inputEmail").val() == "") {
	            alert("이메일을 입력해주세요.");
	            $("#inputEmail").focus();
	         }else if(!emailCheck){
	        	 alert("가입된 이메일이 아닙니다.");
					$("#inputEmail").focus();
					return;
	         }else {
	            $.ajax({
	               url : "SendMail.members",
	               type : "post",
	               data : {
	                  email : $("#inputEmail").val()
	               }
	            }).done(function(resp) {
	               if (resp == 0) {
	                  alert("이메일 주소가 잘못되었습니다. 다시 입력해주세요.");
	               } else { // 메일 발송을 성공했을 때
	                  alert("입력하신 이메일로 메일이 발송되었습니다. 확인하신 후 인증번호를 입력해주세요.");
	                  $("#inputNum").attr("type", "text");
	                  $("#btnInputNum").css("display", "inline-block");
	                  $("#btnInputNum").on("click", function() {
	                     var inputNum = $("#inputNum").val();
	                     if (inputNum == resp) {
	                        $("#inputNum").attr("flag", true);
	                        alert("인증되었습니다.");
	                        $("#inputEmail").attr("readonly", "true");
	                        $("#inputNum").attr("type", "hidden");
	                        $("#btnInputNum").css("display", "none");
	                        $("#btnConfirmEmail").css("display", "none");
	                        $("#btnUpdatePw").css("display", "inline-block");
	                        $("#inputPassword").attr("type", "password");
	                        $("#checkPassword").attr("type", "password");
	                     } else if (resp) {
	                        alert("인증번호가 일치하지 않습니다.");
	                        $("#inputNum").attr("flag", false);
	                        $("#inputNum").val("");
	                     }
	                  })

	               }
	            });
	         }
		});
		$("#btnUpdatePw").on("click", function(){
			if($("#pw_match").text() != "" || $("#pw_form").text() != ""){
				alert("비밀번호를 다시 확인해주세요.");
			}else{
				$("#findPwForm").submit();
			}
		})
		document.getElementById("inputPassword").oninput = function() {
	         var inputPw = document.getElementById("inputPassword").value;
	         var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/g; // 숫자+영문자+특수문자 조합, 8자리 이상
	         var result = regex.exec(inputPw);
	         if (result == null) {
	            document.getElementById("pw_form").innerHTML = "8자 이상 영문,숫자,특수문자를 사용하세요.";
	            document.getElementById("pw_form").style.color = "red";
	         } else {
	            document.getElementById("pw_form").innerHTML = "";
	         }
	      }

	      document.getElementById("checkPassword").oninput = function() {
	         var pw = document.getElementById("inputPassword").value;
	         var pw_chk = document.getElementById("checkPassword").value;
	         if (pw == pw_chk) {
	            document.getElementById("pw_match").innerHTML = "";

	         } else {
	            document.getElementById("pw_match").innerHTML = "비밀번호가 일치하지 않습니다.";
	            document.getElementById("pw_match").style.color = "red";
	         }
	      }
	</script>
</body>
</html>