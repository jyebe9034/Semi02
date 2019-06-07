<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기 - ${result.title }</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="nav_footer.css">
<style>
.progress {
	width: 400px;
	height: 30px;
}
.progress-bar {
	background-color: orange;
	width: ${percentage}%;
}
.hope {
	text-align: center;
	margin-bottom: 20px;
}
.nav_link {
	font-family: "Nanum Gothic";
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
.btn-outline-primary {
	border-color: #1ebdd8;
	color: #1ebdd8;
}
.btn-outline-primary:hover {
	background-color: #1ebdd8;
	border-color: #1ebdd8;
	color: #FFF;
}
.header{
	text-align: center;
	background-image: url(photo_image/titleBackground.PNG);
	background-size: cover;
	background-position: center center;
}
.header div{
	color: #00000080;
}
.contents{
	border: 0.5px solid #00000030;
}
.btnBox{
    text-align: center;
}
.btnBox2{
	text-align: right;
}
.btnBox2 a{
	margin: 5px;
}
#inputComment{
    border: 0.5px solid #00000030;
    height: 100px;
}
#commentBtnBox{
    text-align: center;
}
#commentBtn{
	width: 100%;
	height: 100%;
}
.commentsBox>div{
	border: 0.5px solid #00000030;
}
.deleteCommentBtn, .modifyCommentBtn, .modifyCompleteBtn{
	cursor: pointer;
}
.page-item{
	width: 30px;
	text-align: center;
}
.page-link{
	color: #1ebdd8;
}
.fixedMenu{
	position: fixed;
	width: 100%;
	height: 80px;
	bottom: 0px;
	background-color: #00000090;
	text-align: center;
	display: none;
}
.fixedMenu span{
	color: white;
}
.progressBox{
	padding: none;
	display: flex;
	justify-content: center;
	line-height: 80px;
	
}
#percentage span{
	color: white;
	background-color: #00000030;
}
/*
    div{
        border: 1px solid black;
    }
*/

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
				<li class="nav-item nav-li mr-3"><a id="logos" class="nav-link anker" href="TalentDonations.board">재능기부 게시판</a></li>
				<li class="nav-item nav-li ml-3"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&&searchOption=allPages&&searchWord=allPages">후원 게시판</a></li>
	
				<c:choose>
					<c:when test="${sessionScope.loginEmail != null || navercontents.name != null || realcontents.email != null}">
						<li class="nav-item nav-li ml-3"><a id="logos" class="nav-link anker" href="myPage.members">마이 페이지</a></li>
						<li class="nav-item nav-li ml-4"><a class="nav-link anker" href="Logout.members">로그아웃</a></li>
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
<!-- 	<div class="header row"> -->
<!-- 		<div class="banner col-md-12 d-none d-md-block m-3"></div> -->
<!-- 	</div> -->
	<div class="container">
		<div class="header row justify-content-center m-3 p-3">
			<div><h2>${result.title }</h2></div>
		</div>
		<div class="wrapper row">
			<div class="col-lg-6 col-12"><img src="${titleImg }" alt="..." width="100%"></div>
			<div class="info row col-lg-6 col-12">
				<div class="col-lg-6 col-12">작성자</div>
				<div class="col-lg-6 col-12">${result.writer }<hr></div>
				<div class="col-lg-6 col-12">후원기간</div>
				<div class="col-lg-6 col-12">${result.formedDate }<hr></div>
				<div class="col-lg-6 col-12">목표모금액</div>
				<div class="col-lg-6 col-12">${amount } 원<hr></div>
				<div class="col-lg-6 col-12">현재모금액</div>
				<div class="col-lg-6 col-12">${sumAmount } 원<hr></div>
			</div>
			<div class="btnBox col-12">
				<button type="button" class="btn btn-primary donateBtn">후원하기</button>
				<input type="button" class="btn btn-primary recommendBtn" value="추천하기">
				<span class="recommend">${result.recommend }</span>
			</div>
			<div class="contents col-12 m-3 p-3">${result.contents }</div>
			<div class="btnBox col-md-9 col-sm-7 d-none d-sm-block"></div>
			<div class="btnBox2 col-md-3 col-sm-5 col-12">
				<a class="btn btn-primary" href="List.board?currentPage=${currentPage}&&searchOption=allPages&&searchWord=allPages">목록</a>
				<a class="btn btn-primary" href="Main.members">메인</a>
				<c:if test="${sessionScope.loginEmail == result.email }">
					<a class="btn btn-primary" href="Main.members">수정</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="container comments">
	    <div class="row col-12 p-3 m-0">
	        <div id="inputComment" class="col-9" contenteditable="true"></div>
	        <div id="commentBtnBox" class="col-3">
	            <input type="button" id="commentBtn" class="btn btn-outline-primary" value="응원">
	       </div>
	    </div>
	    <div class="commentsBox row col-12">
	   		<c:forEach var="com" items="${comments }">
	   			<div class="row col-12 p-3 m-3">
	    			<div class="col-md-7 col-9 comment">${com.comment }</div>
	    			<div class="col-md-2 col-2">${com.name }</div>
	    			<c:choose>
	    				<c:when test="${sessionScope.loginEmail == com.email }">
	    					<div class="col-md-2 d-none d-md-block">${com.formedTime }</div>
	    					<div class="col-1">
	    						<span class="modifyCommentBtn" writeDate="${com.writeDate }">✎</span>
	    						<span class="modifyCompleteBtn" writeDate="${com.writeDate }"></span>
	    						<span class="deleteCommentBtn" writeDate="${com.writeDate }">✗</span> <!-- ✕ ✖ × ✗ -->
	    					</div>
	    				</c:when>
	    				<c:otherwise>
	    					<div class="col-md-3 d-none d-md-block">${com.formedTime }</div>
	    				</c:otherwise>
	    			</c:choose>
	    		</div>
	    	</c:forEach>
	    </div>
	    <nav aria-label="Page navigation example">
			<ul class="pagination pagination-sm justify-content-center m-0">
				<c:if test="${pageNavi.needPrev == 1 }">
					<li class="page-item"><a class="page-link pageNum"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.startNavi - 1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:if test="${pageNavi.currentPage > 1 }">
					<li class="page-item"><a class="page-link"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.currentPage - 1}"
						aria-label="Previous"> <span aria-hidden="true">&lt;</span>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
					<li class="page-item"><a class="page-link pageNumber"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${i }">${i}</a></li>
				</c:forEach>
					
				<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
					<li class="page-item"><a class="page-link"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.currentPage + 1}"
						aria-label="Previous"> <span aria-hidden="true">&gt;</span>
					</a></li>
				</c:if>
				<c:if test="${pageNavi.needNext == 1 }">
					<li class="page-item"><a class="page-link"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.endNavi + 1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<div class="fixedMenu">
		<div class="progressBox col-12 justify-content-center p-0 m-0">
			<div class="progress mt-4">
				<div class="progress-bar" role="progressbar"
					aria-valuenow="80px" aria-valuemin="0"
						aria-valuemax="100">
				</div>
			</div>
			<div id="percentageDiv" class="mr-3 ml-3"><span id="percentage">${percentage }%</span></div>
			<div class="btnBox2">
				<form action="PaymentForm.board" id="payment">
					<input type="hidden" id="boardNo" name="boardNo" value=${result.boardNo }>
					<button type="button" class="btn btn-primary donateBtn">후원하기</button>
					<input type="button" class="btn btn-primary recommendBtn" value="추천하기">
					<span class="recommend">${result.recommend }</span>
				</form>
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
	
	<script>
		$(function(){
			var docHeight = $(document).height();
			var winHeight = $(window).height();
			if(docHeight != winHeight){
				$(".fixedMenu").css("display", "block");
			}
			$(".pageNumber").each(function(item){
				if(${commentPage} == $(this).text()){
					$(this).css("background-color", "#1ebdd8");
					$(this).css("color", "white");
				}
			})
		})
		$(".donateBtn").on("click", function(){
			if(${sessionScope.loginEmail == null}){
				alert("로그인 후 후원이 가능합니다.");
				location.href = "LoginForm.members";
			}else{
				$("#payment").submit();
			}
		})

		$(".recommendBtn").on("click", function(){
			if(${sessionScope.loginEmail == null}){
				if(confirm("로그인 후 추천하실 수 있습니다.\n로그인하시려면 확인을 눌러주세요.")){
					location.href = "LoginForm.members";
				}
			}else{
				$.ajax({
					url : "RecommendCheck.board",	// 추천 했었는지 체크!!
					type : "post",
					data : {
						boardNo: ${result.boardNo}
					}
				}).done(function(resp){
					if(resp == "true"){	// 추천을 안했으면
						$.ajax({
							url : "Recommend.board",
							type : "post",
							data : {
								boardNo: ${result.boardNo},
								title: "${result.title}"
							}
						}).done(function(resp){
							alert("추천 감사드려요~");
							$(".recommend").text(resp);
						});
					}else{	// 추천을 이미 했으면
						alert("이미 추천하셨습니다.");
					}
				});
			}
		});
		
		$("#commentBtn").on("click", function(){
			if(${sessionScope.loginEmail == null}){
				if(confirm("로그인 후 작성하실 수 있습니다.\n로그인하시려면 확인을 눌러주세요.")){
					location.href = "LoginForm.members";
				}
			}else{
				if($("#inputComment").html() == ""){
					alert("내용을 입력해주세요.");
				}else{
					$.ajax({
						url : "Comment.board",
						type : "post",
						dataType: "json",
						data : {
							boardNo: ${result.boardNo},
							comment: $("#inputComment").html()
						}
					}).done(function(resp){
						location.reload();
// 						$("#inputComment").html("");
// 						$(".commentsBox").prepend("<div class='row col-12 p-3 m-3'></div>");
// 						$(".commentsBox>div:first-child").prepend("<div class='col-1'><span class='modifyCommentBtn' writeDate='" + resp.writeDate + "'>✎ </span><span class='modifyCompleteBtn' writeDate='" + resp.writeDate + "'></span><span class='deleteCommentBtn' writeDate='" + resp.writeDate +"'>✗</span></div>");
// 						$(".commentsBox>div:first-child").prepend("<div class='col-md-2 d-none d-md-block'>방금 전</div>");
// 					    $(".commentsBox>div:first-child").prepend("<div class='col-md-2 col-2'>"+ resp.name +"</div>");
// 						$(".commentsBox>div:first-child").prepend("<div class='col-md-7 col-9 comment'>"+ resp.comment +"</div>");
					});
				}
			}
		});
		
		$(".deleteCommentBtn").on("click", function(){
			if(confirm("삭제하시겠습니까?")){
				var writeDate = $(this).attr("writeDate");
				$.ajax({
					url: "DeleteComment.board",
					type: "post",
					data:{
						writeDate: writeDate
					}
				}).done(function(resp){
					if(resp == "1"){
						alert("삭제되었습니다.");
// 						$(".commentsBox>div:first-child").css("display", "none");
						location.reload();
					}else{
						alert("삭제하실 수 없습니다.");
					}
				});
			}
		});
		
		$(".modifyCommentBtn").on("click", function(){
			var writeDate = $(this).attr("writeDate");
			var comment = $(this).parent().siblings(".comment");
			var btn = $(this);
			var modifyComplete = btn.siblings(".modifyCompleteBtn");
			btn.text("");	// ✓✔
			modifyComplete.text("✓");
			comment.attr("contenteditable", true);
			comment.focus();
			btn.siblings(".modifyCompleteBtn").on("click", function(){
				$.ajax({
					url: "ModifyComment.board",
					type: "post",
					data: {
						comment: comment.text(),
						writeDate: writeDate
					}
				}).done(function(){
					comment.attr("contenteditable", false);
					btn.text("✎");
					modifyComplete.text("");
				});
				return;
			});
		})
		
		$(window).scroll(function() {
			var scrollHeight = $(document).height();
			var scrollPosition = $(window).height() + $(window).scrollTop();
			if ((scrollHeight - scrollPosition) / scrollHeight == 0) {
				$(".fixedMenu").css("display","none");
			} else {
				$(".fixedMenu").css("display","block");
			}
		});
	</script>
</body>
</html>