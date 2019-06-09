<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>도움닿기 - 후원 게시판</title>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Noto+Sans+KR|Sunflower:300|Jua|Poor+Story|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="nav_footer.css">

<style>
   .progress {
      width: 200px;
   }
   .progress-bar {
      background-color: orange;
   }
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
   .boardName {
      text-align: center;
      margin: 50px;
      font-family: "Nanum Gothic";
      font-size: 50px;
      font-weight: bold;
      color: darkslategray;
   }
   /*분류*/
   #top{
	width: 85%;
	margin: auto;
	margin-bottom: -50px;
   }
  
   .classificationCol{
   		margin : auto;
    	float:left; 
   }
  .classificationCol a{
   		width: 100px;
   		height: 40px;
  		text-align: center;
  		line-height: 90%;
   }
  
   /*검색*/
      #dropdownforSearch {
      	float: left;
        height: 40px;
        border: solid lightgrey 1px;
        border-top-left-radius: 15px;
        border-bottom-left-radius: 15px;
        padding-left: 9px;
   }
   
   .searchWord {
      width: 300px;
        height: 40px;
        border: solid lightgrey 1px;
        border-top-right-radius: 15px;
        border-bottom-right-radius: 15px;
        padding-left: 10px;
   }
   
   .searchBtn {
      background-color: #1ebdd8;
      border-color: #1ebdd8;
      color: #FFF;
      height:40px;
        border-radius:15px;
        margin-left: 3px;
   }
   
   .searchBtn:hover {
      border-color: #28a39f;
      background-color: #28a39f;
      color: #FFF;
   }
     
   .noneListRow div{
      margin: auto;
      text-align: center;
      font-family: "Do Hyeon";
      font-size: 20px;
   }
   
   .searchBox {
    margin-bottom: 50px;
    width: 100%;
	margin-right: 190px;
   }
   .search{
   	min-width: 500px;
   }
   .listRow{
       width: 90%;
       margin: auto;
       font-family: 'Jua', sans-serif;
   }
   
   .list {
      width: 250px;
      height: 370px;
      margin: 30px auto;
      border : none; 
   }
   .card-title{
       height: 50px;
   }
   .article .writer {
  	 color : grey;
  	 margin-top: -10px;
   }
   .list img {
      width: 240px;
      height: 200px;
      margin: auto;
      border-radius:15px;
      border : 1px solid lightgrey; 
   }
   
   .progress {
      width: 100%;
      margin-top: -10px;
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
   
   .page-item a {
      color: #1ebdd8;
   }
   .page-item a:hover{
      color: #1ebdd8;
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
   
   #writeBtn,#deleteBtn {
      background-color: #1ebdd8;
      border-color: #1ebdd8;
      color: #FFF;
   }
   
   #writeBtn:hover,#deleteBtn:hover {
      border-color: #28a39f;
      background-color: #28a39f;
      color: #FFF;
   }
   .article{
      cursor: pointer; 
   }
   .check{
      margin-left:auto;
   }
   
</style>
<script>
   $(function(){
      if(${fail == 1}){
         alert("수정에 실패했습니다. 다시 시도해 주세요.");
      }
		$("#goMainBtn").on("click",function(){
			location.href="Main.members";
		})
		
		$("#writeBtn").on("click", function(){
			if(${loginEmail == null}){
				alert("로그인 후 글쓰기가 가능합니다.");
				location.href="LoginForm.members";
			}else{
				location.href="write.board";	
			}
		})
		
// 		지혜야 너꺼 여기다가 옮겼어------------------------------------------------------
		$(".article").on("click", function(){
			var boardNo = $(this).attr("boardNo");
			var currentPage ="${currentPage }";
			var classification = "${classification}";
			var searchOption = "${searchOption}";
			var searchWord = "${searchWord}";
			location.href="Read.board?boardNo=" + boardNo + "&currentPage=" + currentPage + "&commentPage=1&classification="+classification + "&searchOption="+searchOption + "&searchWord="+searchWord;
		})

//		창훈이 삭제버튼 부분--------------------------------------------------------------	
		$("#deleteBtn").on("click",function(){
				location.href="BoardWriteDelete.manager";	
		})
		

	//-----------------------------------------------------------------------------
		$(".pageNumber").each(function(item){
			if(${currentPage} == $(this).text()){
				$(this).css("background-color", "#1ebdd8");
				$(this).css("color", "white");
			}
		})
		$(".state").each(function(item){
			if("${classification }" == $(this).attr("flag")){
				$(this).css("background-color", "#1ebdd8");
				$(this).css("color", "white");
			}
		})	
		
	})
</script>
</head>
<body>
	<!--상단 메뉴바-->
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
				<li class="nav-item nav-li"><a class="nav-link anker"
					href="Introduce.members">소개</a></li>
				<li class="nav-item nav-li"><a id="logos"
					class="nav-link anker" href="TalentDonations.board">재능기부 게시판</a></li>
				<li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages&classification=ongoing">후원 게시판</a></li>


				<c:choose>
					<c:when test="${sessionScope.loginEmail != null}">
						<c:if test="${sessionScope.admin==null}">
							<li class="nav-item nav-li"><a id="logos"
								class="nav-link anker"
								href="myPage.members?currentPage=1&currentPage2=1">마이 페이지</a></li>
						</c:if>
						<c:if test="${sessionScope.admin!=null}">
							<li class="nav-item nav-li"><a class="nav-link anker"
								href="Bar.manager">대시보드</a></li>
						</c:if>
						<li class="nav-item nav-li"><a class="nav-link anker"
							href="Logout.members">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item nav-li"><a
							class="nav-link anker ml-1 pr-0" href="LoginForm.members">로그인</a></li>
						<li class="nav-item nav-li"><a class="nav-link anker pl-0"
							href="JoinForm.members">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	<hr style="margin: 0px;">
<div class="wrapper">
	<div class="boardName">
		<p>후원 게시판</p>
	</div>

<div id="top">
<!--글 분류 -->
       <div class="col-6 classificationCol d-flex justify-content-left">
            <div class="list-group list-group-horizontal-sm classification">
                <a href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages&classification=ongoing" class="list-group-item list-group-item-action ongoing state" flag="ongoing">진행중</a>
                <a href="ClosedList.board?currentPage=1&searchOption=allPages&searchWord=allPages&classification=closed" class="list-group-item list-group-item-action closed state" flag="closed">마감</a>
            </div>
   </div>
    
<!--검색창-->
	<form id="searchForm">
			<input type="hidden" name="currentPage" value="1">
			<c:choose>
				<c:when test="${classification=='ongoing' }">
					<input type="hidden" name="classification" value="ongoing">	
				</c:when>
				<c:otherwise>
					<input type="hidden" name="classification" value="closed">
				</c:otherwise>
			</c:choose>
	
				<div class="col-6 d-flex justify-content-end search searchBox">
				<select name="searchOption" id="dropdownforSearch">
					<option name="searchOption" class="searchOption" value="b_title">제목</option>
					<option name="searchOption" class="searchOption" value="b_contents">내용</option>
					<option name="searchOption" class="searchOption"
						value="b_title or b_contents">제목+내용</option>
				</select> <input type="text" name="searchWord" class="searchWord"
					placeholder="검색할 내용 입력">
				<button type="submit" class="btn searchBtn">검색</button>
				</div>
	</form>

</div>

	<!--글목록-->
	<c:choose>
		<c:when test="${totalRecordCount<1}">
			<div class="row noneListRow">
				<div class="col-12">
					<p>검색어 : ${searchWord }</p>
					<p>검색 결과가 없습니다.</p>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<form action="BoardWriteDelete.manager">
				<div class="row listRow">
					<c:forEach var="list" items="${board }" varStatus="status">
						<div class="col-lg-3 col-md-6 col-sm-12">
							<c:if test="${sessionScope.admin!=null}">
								<div class="check">
									<input type="checkbox" name="checkDelete"
										value="${list.boardNo }">
								</div>
							</c:if>
							<div class="card list">
								<img src="${list.newFilePath}">
								<div class="card-body article" boardNo="${list.boardNo}">
									<h5 class="card-title title">${list.title }</h5>
									<p class="card-text writer">${list.writer }</p>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											style="width: ${list.percentage}%;" aria-valuemin="0"
											aria-valuemax="100"></div>

									</div>
									<div class="percentage">
										<small class="text-muted amount">${list.percentage }%</small>
									</div>
									<div class="amount d-flex justify-content-end">
										<small class="text-muted amount">${sumAmount[status.index]}원</small>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
		</c:otherwise>
	</c:choose>


   <!--페이지네비게이터 -->
      <div class="row  p-0 m-0" id="num_box">
         <div class="col-12 d-flex justify-content-center">
            <nav aria-label="Page navigation example">
               <ul class="pagination pagination-sm">
                        ${getNavi }
               </ul>
            </nav>      
         </div>
      </div>
   <!--하단 버튼들 -->
   <div class="row p-0 m-0" id="bottom">
      <div class="col-12 bottonBtns d-flex justify-content-center">
         <button type="button" class="btn" id="goMainBtn">메인으로</button>
         <c:if test="${sessionScope.admin==null}">
         <button type="button" class="btn" id="writeBtn">글쓰기</button>
         </c:if>
         <c:if test="${sessionScope.admin!=null}">
         <button type="submit" class="btn" id="deleteBtn">삭제</button>
         </c:if>
      </div>
   </div>
   </form>
   <div class="push"></div>
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
</body>
</html>