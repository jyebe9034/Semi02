<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/photo_image/favicon.ico">
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
	transition: width 3s;
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
	border-radius: 20px;
	margin-top: 15px;
	color: white;
}
.header div{
	color: #00000080;
}
#titleImg{
	max-height: 400px;
	max-width:100%;
}
.contents{
	border: 0.5px solid #00000030;
	overflow: auto;
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
	overflow-y: auto;
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
.comment{
	word-wrap: break-word;
}
.deleteCommentBtn, .modifyCommentBtn, .modifyCompleteBtn, .modifyCancelBtn{
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
	z-index: 1;
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
	<div class="container">
		<div class="header row justify-content-center p-3">
			<div><h2>${result.title }</h2></div>
		</div>
		<hr>
		<div class="wrapper row">
			<div id="titleImgBox" class="col-lg-6 col-12"><img src="${titleImg }" alt="..." id="titleImg"></div>
			<div class="info row col-lg-6 col-12">
				<div class="col-lg-6 col-12 p-3">작성자</div>
				<div class="col-lg-6 col-12 p-3">${result.writer }<hr></div>
				<div class="col-lg-6 col-12 p-3">후원기간</div>
				<div class="col-lg-6 col-12 p-3">${result.formedDate }<hr></div>
				<div class="col-lg-6 col-12 p-3">목표모금액</div>
				<div class="col-lg-6 col-12 p-3">${amount } 원<hr></div>
				<div class="col-lg-6 col-12 p-3">현재모금액</div>
				<div class="col-lg-6 col-12 p-3">${sumAmount } 원</div>
			</div>
			<div class="btnBox col-12">
				<button type="button" class="btn btn-primary donateBtn">후원하기</button>
				<button type="button" class="btn btn-primary recommendBtn">추천하기</button>
				<span class="recommend">${result.recommend }</span>
			</div>
			<div class="contents col-12 p-3">${result.contents }</div>
			<div class="btnBox1 col-md-6 col-sm-6 d-none d-sm-block"></div>
			<div class="btnBox2 col-md-6 col-sm-6 col-12">
				<c:choose>
					<c:when test="${classification == 'ongoing' }">
						<a class="btn btn-primary" href="List.board?currentPage=${currentPage}&classification=ongoing&searchOption=${searchOption }&searchWord=${searchWord }">목록</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="ClosedList.board?currentPage=${currentPage}&classification=closed&searchOption=${searchOption }&searchWord=${searchWord }">목록</a>
					</c:otherwise>
				</c:choose>
				
				<a class="btn btn-primary" href="Main.members">메인</a>
				<c:if test="${sessionScope.loginEmail == result.email && classification == 'ongoing'}">
					<a class="btn btn-primary" href="edit.board?boardNo=${result.boardNo}&currentPage=${currentPage}">수정</a>
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
	   			<div class="row col-12 p-3 m-3 pr-0">
	    			<div class="col-md-7 col-8 comment">${com.comment }</div>
	    			<div class="col-md-2 col-3">${com.name }</div>
	    			<c:choose>
	    				<c:when test="${sessionScope.loginEmail == com.email || sessionScope.admin!=null}">
	    					<div class="col-md-2 d-none d-md-block">${com.formedTime }</div>
	    					<div class="col-1">
	    						<span class="modifyCommentBtn" writeDate="${com.writeDate }">✎</span>
	    						<span class="modifyCompleteBtn" writeDate="${com.writeDate }"></span>
	    						<span class="modifyCancelBtn" writeDate="${com.writeDate }"></span>
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
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.startNavi - 1}&classification=${classification}&searchOption=${searchOption }&searchWord=${searchWord }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:if test="${pageNavi.currentPage > 1 }">
					<li class="page-item"><a class="page-link"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.currentPage - 1}&classification=${classification}&searchOption=${searchOption }&searchWord=${searchWord }"
						aria-label="Previous"> <span aria-hidden="true">&lt;</span>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
					<li class="page-item"><a class="page-link pageNumber"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${i }&classification=${classification}&searchOption=${searchOption }&searchWord=${searchWord }">${i}</a></li>
				</c:forEach>
					
				<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
					<li class="page-item"><a class="page-link"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.currentPage + 1}&classification=${classification}&searchOption=${searchOption }&searchWord=${searchWord }"
						aria-label="Previous"> <span aria-hidden="true">&gt;</span>
					</a></li>
				</c:if>
				<c:if test="${pageNavi.needNext == 1 }">
					<li class="page-item"><a class="page-link"
						href="Read.board?boardNo=${result.boardNo }&currentPage=${currentPage }&commentPage=${pageNavi.endNavi + 1}&classification=${classification}&searchOption=${searchOption }&searchWord=${searchWord }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<div class="fixedMenu">
		<div class="progressBox col-12 justify-content-center p-0 m-0">
			<div class="progress mt-4">
				<div class="progress-bar" role="progressbar" style="width:0;"
					aria-valuemin="0" aria-valuemax="100">
				</div>
			</div>
			<div id="percentageDiv" class="mr-3 ml-3"><span id="percentage">${percentage }%</span></div>
			<div class="btnBox2">
				<form action="PaymentForm.board" id="payment">
					<input type="hidden" id="boardNo" name="boardNo" value=${result.boardNo }>
					<button type="button" class="btn btn-primary donateBtn">후원하기</button>
					<button type="button" class="btn btn-primary recommendBtn">추천하기</button>
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
			<a href="checkLogin.members"><div id="suggest">후원 신청</div></a>
		</div>
		<div id="copyright">COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</div>
	</div>
	
	<script>
		$(document).bind('keydown',function(e){
	       if ( e.keyCode == 123 /* F12 */) {
	           e.preventDefault();
	           e.returnValue = false;
	       }
	   });
	  
	   
	   document.onmousedown=disableclick;
	   status="마우스 우클릭은 사용할 수 없습니다.";
	   
	   function disableclick(event){
	       if (event.button==2) {
	           alert(status);
	           return false;
	       }
	   }
	
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
			var email = "${result.email}";
			var loginEmail = "${sessionScope.loginEmail}";
			if(loginEmail == email){
				$(".donateBtn").prop("disabled", true);
				$(".recommendBtn").prop("disabled", true);
			}
			
			if(${classification == "closed"}){
				$(".donateBtn").prop("disabled", true);
				$(".recommendBtn").prop("disabled", true);
				$("#inputComment").attr("contenteditable", false);
				$("#commentBtn").prop("disabled", true);
			}
			$(".progress-bar").css("width","${barNum}");
		});
		
		$(".donateBtn").on("click", function(){
			if(${sessionScope.loginEmail == null}){
				alert("로그인 후 후원이 가능합니다.");
				location.href = "LoginForm.members";
			}else{
				$("#payment").submit();
			}
		});

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
							alert("추천해주셔서 감사합니다.");
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
				var inputComment = $("#inputComment").html();
				inputComment = inputComment.replace(/(&nbsp;)+/ig, "");	// 맨 앞 공백, 공백연속으로 쳤을때 &nbsp;
				inputComment = inputComment.replace(/^[ ]+/ig, "");	// &nbsp;자르고나서 또 맨앞에 오는 공백 자르기
				inputComment = inputComment.replace(/(<div><br><\/div>)+/ig, "");// 내용없이 엔터쳤을때
				inputComment = inputComment.replace(/(<div>[ ]*?<\/div>)/ig, "");// 공백만 넣고 엔터쳤을때
				if(inputComment == ""){
					alert("내용을 입력해주세요.");
					$("#inputComment").html("");
					$("#inputComment").focus();
					return;
				}else if(getByte(inputComment) > 900){
					alert("300자 이내로 작성해주세요.");
					$("#inputComment").html("");
					$("#inputComment").focus();
					return;
				}
				else{
					$.ajax({
						url : "Comment.board",
						type : "post",
						dataType: "json",
						data : {
							boardNo: ${result.boardNo},
							comment: inputComment
						}
					}).done(function(resp){
						location.reload();
					});
				}
			}
		});
		
		function getByte(str){
			var strLength = 0; 
			for (i = 0; i < str.length; i++){
				var code = str.charCodeAt(i);
				var ch = str.substr(i,1).toUpperCase();
				
				code = parseInt(code);
                 
				if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
					strLength = strLength + 3; //UTF-8 3byte 로 계산
				}else{
 					strLength = strLength + 1;
				}
            }
			console.log(strLength);
			return strLength;
		}
		
		$(".deleteCommentBtn").on("click", function(){
			if(confirm("삭제하시겠습니까?")){
				var writeDate = $(this).attr("writeDate");
				$.ajax({
					url: "DeleteComment.board",
					type: "post",
					data:{
						writeDate: writeDate,
						boardNo: ${result.boardNo}
					}
				}).done(function(resp){
					if(resp == "1"){
						alert("삭제되었습니다.");
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
			var modifyBtn = $(this);
			var modifyComplete = modifyBtn.siblings(".modifyCompleteBtn");
			
			var deleteBtn = modifyBtn.siblings(".deleteCommentBtn");
			var cancelBtn = modifyBtn.siblings(".modifyCancelBtn");
			
			
			modifyBtn.text("");
			modifyComplete.text("✓");	// ✓✔
			deleteBtn.text("");
			cancelBtn.text("✗")	// ✕ ✖ × ✗
			comment.attr("contenteditable", true);
			comment.focus();
			comment.css("border", "0.5px solid #00000030");
			comment.css("height", "100px");
	        comment.css("overflow-y", "auto");
			
			modifyComplete.on("click", function(){
				var inputComment = comment.html();
				inputComment = inputComment.replace(/(&nbsp;)+/ig, "");
				inputComment = inputComment.replace(/^[ ]+/ig, "");
				inputComment = inputComment.replace(/(<div><br><\/div>)+/ig, "");
				inputComment = inputComment.replace(/(<div>[ ]*?<\/div>)/ig, "");
				if(inputComment == ""){
					alert("내용을 입력해주세요.");
					comment.html("");
					comment.focus();
					return;
				}
				$.ajax({
					url: "ModifyComment.board",
					type: "post",
					data: {
						comment: inputComment,
						writeDate: writeDate
					}
				}).done(function(){
					location.reload();
				});
				return;
			});
			
			cancelBtn.on("click", function(){
				location.reload();
			})
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