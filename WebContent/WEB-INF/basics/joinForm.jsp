<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기 - 회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="nav_footer.css">
<style>
.wrapper {
	width: 400px;
	margin: auto;
	padding: 40px;
	border: 1px solid #e4e4e4;
	border-radius: 5px;
}

.top_wrapper {
	display: flex;
	justify-content: space-between;
	height: 40px;
	align-items: center;
	position: relative;
	margin: auto;
}

a {
	font-weight: bold;
}

a:hover {
	color: #000000;
}

.title {
	margin-bottom: 40px;
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

#zip {
	display: inline-block;
	margin-top: 20px;
}

#inputZip {
	display: inline-block;
}

.helper {
	font-size: 12px;
}

#pw_form, #pw_match, #emailCheck {
	font-size: 12px;
}

#divBtnJoin {
	text-align: center;
}

#checkPassword {
	margin-bottom: 5px;
}

#inputEmail, #inputNum {
	display: inline-block;
}

#btnInputNum {
	display: none;
}

ul {
	margin: auto;
}

</style>
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

   <form action="Join.members" id="joinForm" method="post">
      <div class="wrapper">
         <div class="title">
            <h3>회원가입</h3>
         </div>
         <p style="font-size: 12px">*표시는 필수항목입니다.</p>
         <div class="form-group">
            <input type="email" class="form-control" id="inputEmail"
               name="email" placeholder="*이메일 계정" style="width: 70%" required>
            <button type="button" id="btnConfirmEmail"
               class="btn btn-outline-info">인증하기</button>
            <p id="emailCheck"></p>
            <input type="hidden" class="form-control" id="inputNum"
               placeholder="*인증번호" style="width: 70%" flag="false" required>
            <button type="button" id="btnInputNum" class="btn btn-outline-info">확인</button>
         </div>
         <div id="divPw" class="form-group">
            <input type="password" class="form-control" id="inputPassword"
               name="pw" placeholder="*비밀번호" required><em class="helper">영문,
               숫자, 특수문자 (!@#$%^&*+=-)를 조합한 8자 이상</em>
            <p id="pw_form"></p>
         </div>
         <div class="form-group">
            <input type="password" class="form-control" id="checkPassword"
               placeholder="*비밀번호 확인" required>
            <p id="pw_match"></p>
         </div>
         <div class="form-group">
            <input type="text" class="form-control" id="name" name="name"
               placeholder="*이름" required>
         </div>
         <div class="form-group">
            <input type="text" class="form-control" id="phone" name="phone"
               placeholder="전화번호" maxlength="13">
         </div>
         <div id="zip" class="form-group">
            <input type="text" id="inputZip" class="form-control" name="zip"
               style="width: 50%" placeholder="우편번호" readonly>
            <button type="button" id="search" class="btn btn-outline-info">찾기</button>
         </div>
         <div class="form-group">
            <input type="text" class="form-control" id="inputAddress"
               name="address1" placeholder="주소" readonly>
         </div>
         <div class="form-group">
            <input type="text" class="form-control" id="inputAddress2"
               name="address2" placeholder="상세주소" maxlength="20">
         </div>

         <div id="divBtnJoin">
            <input type="button" id="btnJoin" class="btn btn-primary"
               value="가입하기">
         </div>
      </div>
   </form>

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
   
   
    function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

var cellPhone = document.getElementById('phone');
cellPhone.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val) ;
}
   
   
   
      $("#btnConfirmEmail").on("click", function() {
         if ($("#inputNum").attr("flag") == "true") {
            alert("이미 인증이 완료되었습니다.");
            return;
         }
         if ($("#inputEmail").val() == "") {
            alert("이메일을 입력해주세요.");
         } else {
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
                     } else if (resp) {
                        alert("인증번호가 일치하지 않습니다.");
                        $("#inputNum").attr("flag", false);
                        $("#inputNum").val("");
                     }
                  })

               }
            });
         }
      })

      $("#btnJoin").on("click", function() {
         if ($("#inputEmail").val() == "") {
            alert("이메일을 입력해주세요.");
         } else if ($("#inputNum").attr("flag") == "false") {
            alert("이메일 인증을 완료해주세요.");
         }
         else if($("#pw_match").text() != "" || $("#pw_form").text() != ""){
            alert("비밀번호를 다시 확인해주세요.");
         } else if ($("#name").val() == "") {
            alert("이름을 입력해주세요.");
         } else {
            $("#joinForm").submit();
         }
      })

      $("#inputEmail").on("input", function() {
         $.ajax({
            url : "EmailDuplCheck.members",
            type : "post",
            data : {
               email : $("#inputEmail").val()
            }
         }).done(function(resp) {
            console.log(resp);
            if (resp == "false") {
               $("#emailCheck").css("color", "red");
               $("#emailCheck").text("이미 가입된 이메일입니다.");
               $("#btnConfirmEmail").prop("disabled", true);
            } else {
               $("#emailCheck").text("");
            }
         })
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

      document.getElementById("search").onclick = searchAddress;

      function searchAddress() {
         new daum.Postcode({
            oncomplete : function(data) {
               var roadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 참고 항목 변수

               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraRoadAddr += data.bname;
               }

               if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }

               if (extraRoadAddr !== '') {
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
               }

               document.getElementById('inputZip').value = data.zonecode;
               document.getElementById("inputAddress").value = roadAddr;
            }
         }).open();
      }
   </script>
</body>

</html>