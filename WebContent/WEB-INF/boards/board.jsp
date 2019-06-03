<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>후원 게시판</title>

<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
body {
	font-family: "Nanum Gothic";
	height: 100%;
}

.progress {
	width: 200px;
}

.progress-bar {
	background-color: orange;
}

.wrapper {
	display: inline-block;
}

a {
	font-weight: bold;
}

a:hover {
	color: #000000;
}

.menubar {
	margin-bottom: 60px;
}

.menubar ul {
	margin: auto;
}

.menubar li {
	width: 130px;
}

.boardName {
	text-align: center;
	margin-bottom: 50px;
	font-family: "Do Hyeon";
	font-size: 50px;
	color: darkslategray;
}

/*검색*/
.dropdown {
	float: left;
}

.searchWord {
	float: left;
	width: 250px;
}

#searchBox {
	margin-right: 10px;
	margin-bottom: 10px;
}

.searchBtn {
	/*                margin-left: 1px;*/
	background-color: #1ebdd8;
	border-color: #1ebdd8;
	color: #FFF;
}

.searchBtn:hover {
	border-color: #28a39f;
	background-color: #28a39f;
	color: #FFF;
}

.listBox {
	margin-bottom: 50px;
}

.listRow {
	
}

.list {
	width: 250px;
	height: 350px;
	margin: 10px auto;
}

.list img {
	width: 250px;
	height: 200px;
	margin: auto;
}

.progress {
	width: 70%;
	float: left;
	position: static;
}

.amount {
	position: relative;
	left: 10px;
	bottom: 3px;
}

.numBox li a {
	color: lightslategray;
}

.bottonBtns {
	margin-bottom: 100px;
}

#goMainBtn {
	background-color: #1ebdd8;
	border-color: #1ebdd8;
	color: #FFF;
	margin: 0 5px;
}

#goMainBtn:hover {
	border-color: #28a39f;
	background-color: #28a39f;
	color: #FFF;
}

#writeBtn {
	background-color: #1ebdd8;
	border-color: #1ebdd8;
	color: #FFF;
}

#writeBtn:hover {
	border-color: #28a39f;
	background-color: #28a39f;
	color: #FFF;
}
</style>
<script>
	$(function(){
		$.ajax({
			url : "Fund",
			type : "post",
		}).done(function(resp) {
			$("#card1").css("width", resp + "%");
			$("#card1_span").text(resp + "%");
		})
		
		$("#goMainBtn").on("click",function(){
			location.href="Main.members";
		})
		
		$(".searchBtn").on("click",function(){
	       
		})
		
		
			
			
	
	})
</script>
</head>
<body>
	<!--상단 메뉴바-->
	<nav
		class="navbar navbar-expand-md navbar-light navbar-fixed-top menubar">
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
				<li class="nav-item"><a class="nav-link"
					href="Introduce.members">소개</a></li>
				<li class="nav-item"><a class="nav-link" href="TalentDonations.board">재능기부 게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="write.board">후원해
						주세요</a></li>
				<li class="nav-item"><a class="nav-link"
					href="List.board?currentPage=1">후원 게시판</a></li>
<!-- 				<li class="nav-item"><a class="nav-link" -->
<!-- 							href="Mypage.members">마이 페이지</a></li> -->
			<li class="nav-item"><a class="nav-link"
							href="Mypage.members?currentPage=1">마이 페이지</a></li>
<!-- 							나중에수정하기 나중에수정하기 나중에수정하기 -->
							
				<li class="nav-item"><a class="nav-link" href="Logout.members">로그아웃</a></li>
			</ul>
		</div>
	</nav>

	<div class="boardName">
		<p>게시판</p>
	</div>



	<div id="wrapper" class="container listBox">

		<!--검색창-->
		<div class="row d-flex justify-content-end">
<!-- 			<form action="List.board?currentPage=1" method=post id=searchBox> -->
	<form action="List.board" method=post id=searchBox>
			<input type=hidden flag=search> 
				<select name="searchOption" id="dropdownforSearch">
<!-- 					<option>==검색방법==</option> -->
					<option name="searchOption" value="title">제목</option>
					<option name="searchOption" value="contents">내용</option>
					<option name="searchOption" value="all">제목+내용</option>
				</select> 
<!-- 				<input type="text" class="form-control searchWord" -->
<!-- 					placeholder="검색할 내용 입력" aria-label="Username" -->
<!-- 					aria-describedby="basic-addon1"> -->
				<input type="text" name="searchWord" class="searchWord" placeholder="검색할 내용 입력">
				<button type="submit" class="btn searchBtn">검색</button>
			</form>
			</div>

		</div>

		<!--글목록-->
		<div class="row listRow">
			<c:forEach var="list" items="${board }">
				<div class="col-lg-3 col-md-6 col-sm-12">
					<div class="card list">
<!-- 						<img src=${list.filePath}>  -->
								이미지
<!-- 							사진꺼내는거 나중에 지혜꺼 완성되면 다시 테스트 해보기!! -->
						<div class="card-body">
							<h5 class="card-title">${list.title }</h5>
							<p class="card-text">${list.writer }</p>
							<div class="progress">
								<div id="card1" class="progress-bar" role="progressbar"
									aria-valuenow="${percentage }" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<div class="amount">
								<small class="text-muted amount">${list.amount }</small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!--페이지네비게이터 -->
<nav aria-label="Page navigation example" class="pageNavi">
            <ul class="pagination pagination-sm justify-content-center m-0">
               <c:if test="${getNavi.needPrev == 1 }">
                  <li class="page-item"><a class="page-link"
                     boardPage="${getNavi.startNavi - 1}"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>
               </c:if>
               <c:if test="${getNavi.currentPage > 1 }">
                  <li class="page-item"><a class="page-link"
                     boardPage="${getNavi.currentPage - 1}"
                     aria-label="Previous"> <span aria-hidden="true">&lt;</span>
                  </a></li>
               </c:if>

               <c:forEach var="i" begin="${getNavi.startNavi}"
                  end="${getNavi.endNavi}">
                  <li class="page-item"><a class="page-link pageNumber"
                     boardPage="${i}">${i}</a></li>
               </c:forEach>
               
               <c:if test="${getNavi.currentPage < getNavi.pageTotalCount }">
                  <li class="page-item"><a class="page-link"
                     boardPage="${getNavi.currentPage + 1}"
                     aria-label="Previous"> <span aria-hidden="true">&gt;</span>
                  </a></li>
               </c:if>

               <c:if test="${getNavi.needNext == 1 }">
                  <li class="page-item"><a class="page-link"
                     boardPage="${getNavi.endNavi + 1}"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>
               </c:if>
            </ul>
         </nav>
	<!--하단 버튼들 -->
	<div class="row p-0 m-0" id="bottom">
		<div class="col-12 bottonBtns d-flex justify-content-center">
			<button type="button" class="btn" id="goMainBtn">메인으로</button>
			<button type="button" class="btn" id="writeBtn">글쓰기</button>
		</div>
	</div>

</body>
</html>