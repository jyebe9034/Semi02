<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>도움닿기 - 회원 정보 수정</title>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link
              href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
              rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">

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
            .title {
                margin-bottom: 30px;
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
                margin-top:20px;
            }

            #inputZip {
                display: inline-block;
            }

            .helper {
                font-size: 12px;
            }
            #pw_form, #pw_match, #emailCheck{
                font-size:12px;
            }
            #divBtnJoin{
                text-align:center;
            }
            #checkPassword{
                margin-bottom:5px;
            }
            #inputEmail,#inputPassword,#inputPasswordCheck,#phone{
                display:inline-block;
                width: auto;
            }
            ul {
                margin: auto;
            }
            .myhr1{
                border: 0;
                height: 1px;
                background-color: white;
            }
            .first{
                letter-spacing: 1px;
                margin-left: 3em;
                display: block;
                color: gray;
                line-height: 21px;
                min-width: 70px;
            }
            .first-pw{
                letter-spacing: 1px;
                margin-left: 3em;
                display: block;
                color: gray;
                line-height: 35px;
            }
            .first-phone{
                letter-spacing: 1px;
                margin-left: 3em;
                display: block;
                color: gray;
                line-height: 35px;
            }
            .second{
                font-weight: 600;
                margin-left: 1em;
            }
            .white{
                border: 0px;
                margin-right: 2em;
                height: 30px;
                font-weight: 600;
            }
            .wrap{
                border: 3px solid #c4c4c490;
                border-radius: 10px;
                padding: 50px;
            }
            hr{
                border-color: #c4c4c490;
            }
            #top{
                border-color: whitesmoke
            }
            .update{
                position: relative;
                top: 40px;
                left: 45%;
            }
            #address1,#address2{
                width: 270px;
            }
            #zipcode{
                background-color: #c4c4c450;
                border-color: #c4c4c470;
            }
            #addressbt{
                position: relative;
            }
            small{
            }
        </style>
    </head>
    <body>
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
				<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&&searchOption==null&&searchWord==null">후원 게시판</a></li>
				<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="myPage.members?currentPage=1&currentPage2=1">마이 페이지</a></li>
				<li class="nav-item nav-li"><a class="nav-link anker" href="Logout.members">로그아웃</a></li>
			</ul>
		</div>
	</nav>
      
       <hr style="margin:0px; bordercolor:whitesmoke;">
        <br><br><br>

        <form action="myPageUpdate.members" method="post">
            <div class="container wrap">
                <h3>내 정보 관리</h3>
                <br>
                <hr  class="myhr1">
                <div class="row">
                    <div class="col-2 d-md-block d-none"><span class="first">이메일</span></div>
                    <div class="col-10 "><span class="second">${dto.email }</span></div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-2 d-md-block d-none"><span class="first">이름</span></div>
                    <div class="col-10"><span class="second">${dto.name }</span></div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-2 d-md-block d-none"><span class="first-phone first">연락처</span></div>

                    <div class="col-10"><span><span class="form-inline">
                        <div class="form-group">
                            <input type="text" class="form-control mx-sm-3 second" name="phone" id="phone" value="${dto.phone }" required>
                        </div>
                        </span></span></div>
                </div>
                <hr>
                <c:if test="${dto.pw != null }">
              	  <div class="row">
              	      <div class="col-2 d-md-block d-none"><span class="first-pw first">비밀번호</span></div>
              	      <div class="col-10"><span><span class="form-inline">
              	          <div class="form-group">
              	              <input type="password" id="inputPassword" class="form-control mx-sm-3 second" aria-describedby="passwordHelpInline" required>
              	              <small id="pw_form" class="text-mute">
              	              </small>
              	          </div>
              	          </span></span></div>
              	  </div>
              	  <br>
              	  <div class="row">
              	      <div class="col-2 d-md-block d-none"><span class="first-pw"></span></div>
              	      <div class="col-10"><span><span class="form-inline">
              	          <div class="form-group">
              	              <input type="password" id="inputPasswordCheck" class="second form-control mx-sm-3" aria-describedby="passwordHelpInline" name="pw" required>
              	              <small id="pw_match" class="text-mute">
              	              </small>
              	          </div>
              	          </span></span></div>
              	  </div>
              	  <hr>
                </c:if>
                <div class="row">
                    <div class="col-2"><span class="first-pw first">주소</span></div>
                    <div class="col-10"><span><span class="form-inline">
                        <div class="form-group">
                            <input type="text" id="zipcode" class="form-control mx-sm-3 second" readonly value="${dto.zipCode }" name="zipcode">
                            <button type="button" class="btn btn-info d-sm-block d-none" id="addressbt">찾기</button>
                        </div>
                        </span></span></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-2"><span class="first-pw"></span></div>
                    <div class="col-10"><span><span class="form-inline">
                        <div class="form-group">
                            <input type="text" id="address1" class="second form-control mx-sm-3" value="${dto.address1 }" name="address1">
                        </div>
                        </span></span></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-2"><span class="first-pw first d-md-block d-none">상세 주소</span></div>
                    <div class="col-10"><span><span class="form-inline">
                        <div class="form-group">
                            <input type="text" id="address2" class="second form-control mx-sm-3" name="address2" value="${dto.address2 }">

                        </div>
                        </span></span></div>
                </div>
                <div class="row"><div class="col-12">
                    <input type="submit" class="btn btn-info update" id="update" value="수정 하기"></input>
                </div>
            </div>
            </div>
        </form>
<br><br>
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


        document.getElementById("update").onclick=function(){

            pw1 = document.getElementById("inputPassword").value;
            pw2 = document.getElementById("inputPasswordCheck").value;

            if(pw1 == "" || pw2 == ""){
                alert("패스워드를 입력해주세요.")
                return false;
            }


            var inputPw = document.getElementById("inputPassword").value;
            var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/g; // 숫자+영문자+특수문자 조합, 8자리 이상
            var result = regex.exec(inputPw);
            if (result == null) {
                alert("패스워드를 확인해주세요.")
                return false;
            }
            
            if(pw1!=pw2){
                alert("패스워드를 확인해주세요");
                return false;
            }
            

        }


        document.getElementById("inputPassword").oninput = function() {
            var inputPw = document.getElementById("inputPassword").value;
            var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/g; // 숫자+영문자+특수문자 조합, 8자리 이상
            var result = regex.exec(inputPw);
            if (result == null) {
                document.getElementById("pw_form").innerHTML = "8자 이상 영문,숫자,특수문자를 사용하세요.";
                document.getElementById("pw_form").style.color = "red";
            } else {
                document.getElementById("pw_form").style.color = "green";
                document.getElementById("pw_form").innerHTML = "아래 빈칸에 한번더 입력해 주세요.";
            }
        }

        document.getElementById("inputPasswordCheck").oninput = function() {
            var pw = document.getElementById("inputPassword").value;
            var pw_chk = document.getElementById("inputPasswordCheck").value;
            if (pw == pw_chk) {
                document.getElementById("pw_match").innerHTML = "";

            } else {
                document.getElementById("pw_match").innerHTML = "비밀번호가 일치하지 않습니다.";
                document.getElementById("pw_match").style.color = "red";
            }
        }

        document.getElementById("addressbt").onclick = function() {
            new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                && /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                && data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', '
                                              + data.buildingName
                                              : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("address1").value = extraAddr;

                        } else {
                            document.getElementById("address1").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('zipcode').value = data.zonecode;
                        document.getElementById("address1").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("address2").focus();
                    }
                }).open();
        }

    </script>
    </body>
</html>