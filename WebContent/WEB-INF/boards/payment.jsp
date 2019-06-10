<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도움닿기 - 후원 결제</title>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Jeju+Gothic|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	margin-top: 50px;
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

.helper {
	font-size: 12px;
}
#divBtnPay{
	text-align:center;
}
#inputEmail{
	display:inline-block;
}
#footer{
	position: fixed;
	bottom: 0;
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
	
	<form action="Payment.board" id="payForm" method="post">
		<div class="wrapper">
			<div class="title">
				<h3>후원하기</h3>
			</div>
			<input type="hidden" name="boardNo" value="${boardNo }">
			<div class="form-group">
				이름
				<input type="text" class="form-control" id="inputName" name="name"
					placeholder="이름" value="${result[0] }" required>
			</div>
			<div class="form-group">
				이메일 계정(카카오고유ID)
				<input type="email" class="form-control" id="inputEmail" name="email"
					placeholder="이메일 계정(카카오고유ID)" value="${result[1] }" readonly>
			</div>
			<div class="form-group">
				전화번호
				<input type="text" class="form-control" id="phone" name="phone"value="${result[2] }">
			</div>
			<div class="form-group">
				후원 금액
				<select class="form-control" id="selectAmount">
    				<option value="0">금액 선택</option>
    				<option value="1000">1,000원</option>
    				<option value="5000">5,000원</option>
    				<option value="10000">10,000원</option>
    				<option value="20000">20,000원</option>
					<option>기타 입력</option>
				</select>
				<input type="hidden" class="form-control" id="amount" name="amount" placeholder="후원하실 금액">
			</div>
			<div id="divBtnPay"><input type="button" id="btnPay" class="btn btn-primary" value="결제하기"></div>
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
		$("#selectAmount").change(function(){
			var selected = $("#selectAmount option:selected").val();
			$("#amount").val("");
			if(selected == "기타 입력"){
				$("#amount").attr("type", "text");
			}
			else{
				$("#amount").attr("type", "hidden");
				$("#amount").val(selected);
			}
		});
		
		$("#phone").on("blur", function() {
			var phonenum = $('#phone').val();
			var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
			if ($("#phone").val() != "") {
				if (!regPhone.test(phonenum)) {
					alert('잘못된 휴대폰 번호입니다.');
					$('#phone').val("");
				}
			}
		});
		
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

		$("#btnPay").click(function() {
			var name = $("#inputName").val();
			var regex = /^[가-힣]{2,5}$/g;
			var result = regex.exec(name);
			if(result == null){
				alert("잘못된 이름 형식입니다.");
				$("#inputName").val("");
				return;
			}
			if($("#inputName").val() == ""){
				alert("이름을 입력해주세요.");
				return;
			}else if($("#phone").val() == ""){
				alert("전화번호를 입력해주세요.");
				return;
			}else if($("#amount").val() == ""){
				alert("금액을 선택해주세요");
				return;
			}
			var IMP = window.IMP; // 생략가능
			IMP.init('imp84992027'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				/* 
				    'kakao':카카오페이, 
				    html5_inicis':이니시스(웹표준결제)
				        'nice':나이스페이
				        'jtnet':제이티넷
				        'uplus':LG유플러스
				        'danal':다날
				        'payco':페이코
				        'syrup':시럽페이
				        'paypal':페이팔
				 */
				pay_method : 'card',
				/* 
				    'samsung':삼성페이, 
				    'card':신용카드, 
				    'trans':실시간계좌이체,
				    'vbank':가상계좌,
				    'phone':휴대폰소액결제 
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/* 
				    merchant_uid에 경우 
				    https://docs.iamport.kr/implementation/payment
				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				    참고하세요. 
				    나중에 포스팅 해볼게요.
				 */
				name : "${title}", //결제창에서 보여질 이름 //// 후원명 불러오기
				amount : $("#amount").val(), // 입력받은 금액
				buyer_email : "",
				buyer_name : $("#inputName").val(),
				buyer_tel : $("#phone").val(),
				m_redirect_url : ''
			/*  
			    모바일 결제시,
			    결제가 끝나고 랜딩되는 URL을 지정 
			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					alert("결제가 완료되었습니다");
					jQuery.ajax({
						url : "https://www.myservice.com/payments/complete", // 가맹점 서버
						method : "POST",
						headers : {
							"Content-Type" : "application/json"
						},
						data : {
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid
						}
					}).done(function(data) {
						
					})
					$("#payForm").submit();
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
					location.href = "Read.board?boardNo=" + ${boardNo} + "&currentPage=1&commentPage=1&classification=ongoing&searchOption=allPages&searchWord=allPages";
				}
			});
		});
	</script>
</body>

</html>