<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기</title>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Jeju+Gothic|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="nav_footer.css">
<style>
.progress {
	width: 95%;
}

.progress-bar {
	background-color: orange;
}

.wrapper {
	display: inline-block;
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
.img_carousel {
	max-height: 700px;
}
.card {
	border-radius: 10px;
	height: 500px;
    width: 90%;
    margin: auto;
    font-family: 'Jua', sans-serif;
}
.rowcard{
	margin:auto;
	width:80%;
	height: 100%;
	font-size: 20px;
}
.container_card {
	margin: auto;
}

.jumbotron {
	background-image: url("photo_image/redheartbluesky.jpg");
	background-size: cover;
	font-family: "Nanum Gothic";
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	margin-top: 40px;
	margin-bottom:0px;
	padding:2rem 2rem;
}
.imgTag{
	border-radius:10px;
}

.smTitle{
	text-align:center;
	margin-top:50px;
	margin-bottom:50px;
	font-weight: bold;
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
.percentage{
    float : left;
    position: static;
}
.amount {
    position: relative;
    right : 1px;
    top : 2px;   
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
.statement{
	text-align:center;
	margin-top:25px;
	margin-bottom:25px;
	font-weight: bold;

}
.statementAmount{
	font-size: 35px;
	margin-top:15px;
	margin-bottom:15px;
}
#footer{
	margin-top: 0;
}
.article{
	cursor: pointer;
	font-size: 20px;
}
#mainTitle{
	height: 60px;
	overflow: hidden;
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
	
	<!-- 캐러셀 -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" data-interval="5000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="photo_image/bestgift.jpg"
					class="d-block w-100 img_carousel" alt="...">
			</div>
			<div class="carousel-item">
				<img src="photo_image/hands_together.jpg"
					class="d-block w-100 img_carousel" alt="...">
			</div>
			<div class="carousel-item">
				<img src="photo_image/girls_heart_2.jpg"
					class="d-block w-100 img_carousel" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	<div><h2 class="smTitle">[  후원 안내  ]</h2></div>
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

	<hr>
	<div><h2 class="smTitle">[  마감이 임박한 후원  ]</h2></div>
		<div class="row rowcard">
			<c:choose>
				<c:when test="${listSize == 0 }"></c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${listSize-1}">
						<div class="card col-lg-3 col-md-6 col-sm-12 p-0">
							<div class="imgBox" style="height:250px;">
								<img src="${imgSrc[i] }" class="imgTag" width="100%" height="100%">
							</div>
							<div class="card-body article" boardNo="${list[i].boardNo}">
								<div id="mainTitle">
									<span class="card-title">${list[i].title}</span>
								</div>
								<hr>
								<p class="card-text" align="left">
									모금 마감일 &nbsp; &nbsp; <span>${duedate[i]}</span><p></p>
								<div class="progress">
									<div class="progress-bar" role="progressbar"
										aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${percentage[i]}%"></div>
								</div>
					     		<div class="percentage">
	                               <small class="text-muted amount">${percentage[i]}%</small>
	                            </div>
	                            <div class="amount d-flex justify-content-end">
	                               <small class="text-muted amount">${sumArr[i]}원</small>
	                            </div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	

	<div class="jumbotron">
		<h2 class="statement">[  2019년 도움닿기 후원 현황  ]</h2>
		<h2 class="statementAmount">${totalAmount }원</h2>
		<h2 class="statementAmount">${countDonors }명</h2>
	</div>
	
	<div id="footer">
		<div id="f_logo_wrap">
			<a id="f_logo" href="Main.members"
				style="font-family: Cute Font"><h1>도움닿기</h1></a>
		</div>
		<div id="f_info_wrap">
			<div id="f_info">
				행동하는 당신과 당신의 도움으로<br>다시 희망을 찾는 사람들을 응원힙니다.
			</div>
		</div>
		<div id="f_sns">
			<img id="kakao" class="sns" src="photo_image/ka.png"> <img
				class="sns" src="photo_image/fa.png"> <img id="insta"
				class="sns" src="photo_image/kk.png"> <a href="checkLogin.members"><div id="suggest">후원 신청</div></a>
		</div>
		<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	</div>
	
	<script>
		$(".article").on("click", function(){
			var boardNo = $(this).attr("boardNo");
			location.href="Read.board?boardNo="+boardNo+"&currentPage=1&commentPage=1&classification=ongoing&searchOption=allPages&searchWord=allPages";
		})
	</script>
</body>
</html>

