<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움닿기 - 후원 신청</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<link rel="stylesheet" href="nav_footer.css">
<style>
	.wrapper{
		display: inline-block;
	}
	#image{
		max-height: 700px;
	}
	#wrapper{
 		max-width: 750px; 
		margin: auto;
		margin-top: 50px;
		min-width: 300px;
	}
	#all-btns{
		height: 50px;
	}
	.form-group{
		text-align: center;
	}
	.noti{
		font-size: 20px;
		color: #195190;
	}
	.btns{
        text-align: right;
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right: 10px;
        float: right;
    }
    hr{
    	border : thin solid #19519050;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    .issue{
    	color: #ef3621;
    	font-size: 13px;
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
	<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
		    <div class="carousel-item active">
		        <img id="image" src="photo_image/foryou.jpg" class="d-block w-100" alt="이미지를 찾을 수 없습니다.">
		    </div>
		</div>
	</div>
	<div id="wrapper" class="container">	
		<form action="writer.board" method="post" id="myform" enctype="multipart/form-data" accept-charset="UTF-8">
			<div class="form-group">
				<div class="noti mb-2">제목은 한눈에 쏙 들어오게!</div>
				<input id="myTitle" type="text" class="form-control" name="title" placeholder="제목은 최대 22자 까지만 가능합니다 :)" required>
			</div>
			<div class="form-group">
				<div id="wrongTitle" class="issue"></div>
			</div>
			
			<div class="form-group"> 
				<div class="noti mb-2">대표 사진은 신중하게 골라서!</div>
				<input id="myTitleImg" type="file" name="filename" class="form-control">
			</div>
			<div class="form-group">
				<div id="wrongFile" class="issue"></div>
			</div>
			<div class="form-group">
				<div class=" noti mb-2">작성자는 실명으로!</div>
				<input id="myWriter" type="text" class="form-control" name="writer" placeholder="신뢰를 바탕으로 모금액이 모이기 때문에 실명을 입력해 주세요 :)" required>
			</div>
			<div class="form-group">
				<div id="wrongName" class="issue"></div>
			</div>
			<div class="form-group">
				<div class=" noti mb-2">목표 금액은 최소 10,000원 이상 최대 10,000,000원까지!</div>
				<input id="myAmount" type="number" class="form-control" name="amount" placeholder="한번 입력된 금액은 변경할 수 없어요 :)" min="10000" max="10000000" required>
			</div>
			<div class="form-group">
				<div id="lessAmount" class="issue"></div>
			</div>
			<div class="form-group">
				<div class=" noti mb-2">마감일은 내가 원하는 대로!</div>
				<input id="myDueDate" type="date" class="form-control" name="dueDate" required>
			</div>
			<div class="form-group">
				<div id="today" class="issue"></div>
			</div>
			<div class="form-group">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="mt-1 mr-2 noti">후원받을 계좌는 본인 계좌만 가능합니다!</label>
					</div>
				    <select class="custom-select" name="select">
					    <option value="신한" selected>신한</option>
						<option value="국민">국민</option>
						<option value="농협">농협</option>
						<option value="우리">우리</option>
						<option value="기업">기업</option>
						<option value="하나">하나</option>
						<option value="부산">부산</option>
						<option value="경남">경남</option>
						<option value="SC">SC</option>
						<option value="수협">수협</option>
						<option value="우체국">우체국</option>
						<option value="카카오">카카오</option>
				    </select>
				</div>
				<input id="myAccount" type="text" class="form-control m-0" name="account" placeholder="계좌번호 '-' 제외하고 입력" required>
			</div>
			<div class="form-group">
				<div id="wrongAccount" class="issue"></div>
			</div>
			<div class="form-group">
				<div class="mb-2 noti">내용을 자유롭게 작성해 주세요 :) 사진을 추가로 올리는 것도 가능합니다.</div>
			</div>
			<div id="content">	
				<div id="summernote" contenteditable="true"></div>
				<input id="myContent" type="hidden" name="contents">
			</div>
			<div id="all-btns">
				<div class="btns">
					<input type="button" id="sendit" class="btn btn-sm btn-primary" value="등록">
				</div>
				<div class="btns">
					<input type="button" id="cancel" class="btn btn-sm btn-primary" value="취소">
				</div>
			</div>
		</form>
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
		$("#myTitle").on("input",function(){
			var title = $("#myTitle").val();
			var regex = /^[가-힣 .,:;()!^?~0-9\"\']{5,22}$/g
			
			var result = regex.exec(title);
	        if(result == null){
	             $("#wrongTitle").html("잘못된 제목 형식입니다.");
	        }else{
	        	 $("#wrongTitle").html("");
	        }
		})
		
		$("#myTitleImg").on("change",function(){
			var file = $("#myTitleImg").val();
			console.log(file);
			var regex = /(\.png|\.jpg|\.jpeg|\.gif)/g
			
			var result = regex.exec(file);
	        if(result == null){
	             $("#wrongFile").html("잘못된 파일 형식입니다.");
	        }else{
	        	 $("#wrongFile").html("");
	        }
		})
		
		$("#myWriter").on("input", function(){
			var writer = $("#myWriter").val();
			var regex = /^[가-힣]{2,5}$/g
			
			var result = regex.exec(writer);
	        if(result == null){
	             $("#wrongName").html("잘못된 이름 형식입니다.");
	        }else{
	        	 $("#wrongName").html("");
	        }
		})
	
		$("#myAmount").on("input", function(){
			var amount = parseInt($("#myAmount").val());
			if(amount < 10000){
				$("#lessAmount").html("10,000원 이상의 금액을 입력해주세요.");
			}else if(amount > 10000000){
				$("#lessAmount").html("10,000,000원 이하의 금액을 입력해주세요.");
			}else{
				$("#lessAmount").html("");	
			}
		})
        
        $("#myDueDate").on("change",function(){
            var today = new Date();
            var dueDate = $(this).val();
            var dueArr = dueDate.split("-");
            var dateObj = new Date(dueArr[0], Number(dueArr[1])-1, dueArr[2]);
            
            var between = Math.ceil((dateObj.getTime() - today.getTime())/1000/60/60/24);
            if(between < 7){
            	$("#today").html("마감일은 일주일 이후의 날짜로 선택해주세요.");
            }else{
            	$("#today").html("");
            }
        })
        
        $("#myAccount").on("input",function(){
        	var account = $("#myAccount").val();
        	var regex = /^[\d]{12,15}$/g
    			
			var result = regex.exec(account);
	        if(result == null){
	             $("#wrongAccount").html("잘못된 계좌번호 형식입니다.");
	        }else{
	        	 $("#wrongAccount").html("");
	        }
        })
	
// 		$(window).on("beforeunload", function(){ // 새로고침 버튼, 뒤로가기 등의 상황 시
// 	    	$("img").each(function(index, item){
// 	    		var src = $(this).attr("src");
// 	    		if(src == "photo_image/foryou.jpg" || src == "photo_image/ka.png" || src == "photo_image/fa.png" || src == "photo_image/kk.png"){	
// 	    		}else if(src == null){
// 	    		}else{
// 	    			$.ajax({
// 						url: "deleteImage.board",
// 						data: {src : src},
// 						type: "POST",
// 						cache: false
// 					})	
// 	    		}
// 	    	})
// 	    });
	
		$("#sendit").on("click", function(){ // 등록 버튼을 눌렀을 때
			var title = $("#myTitle").val();
			var titleRegex = /^[가-힣 .,:;()!^?~0-9\"\']{5,22}$/g
			var result1 = titleRegex.exec(title);
			
			var writer = $("#myWriter").val();
			var writerRegex = /^[가-힣]{2,5}$/g
			var result2 = writerRegex.exec(writer);
			
			var today = new Date();
            var dueDate = $("#myDueDate").val();
            var dueArr = dueDate.split("-");
            var dateObj = new Date(dueArr[0], Number(dueArr[1])-1, dueArr[2]);
            var between = Math.ceil((dateObj.getTime() - today.getTime())/1000/60/60/24);
            
            var account = $("#myAccount").val();
        	var accountRegex = /^[\d]{12,15}$/g
			var result3 = accountRegex.exec(account);
        	
        	var file = $("#myTitleImg").val();
			var fileRegex = /(\.png|\.jpg|\.jpeg|\.gif)/g
			var result4 = fileRegex.exec(file);
			
			if($("#myTitle").val() == ""){
				alert("제목을 입력해 주세요.");
			}else if(result1 == null){
				alert("제목을 형식에 맞게 작성해 주세요.");
				$("#myTitle").val("");
				$("#wrongTitle").html("");
				
			}else if($("#myTitleImg").val() == ""){
				alert("대표사진을 입력해주세요.");
			}else if(result4 == null){
				alert("이미지 파일만 등록 가능합니다.");
				$("#myTitleImg").val("");
				$("#wrongFile").html("");
				
			}else if($("#myWriter").val() == ""){
				alert("작성자를 입력해 주세요.");
			}else if(result2 == null){
				alert("작성자를 형식에 맞게 작성해 주세요.");
				$("#myWriter").val("");
				$("#wrongName").html("");
				
			}else if($("#myAmount").val() == ""){
				alert("목표금액을 입력해 주세요.");
				$("#myAmount").val("");
			}else if(parseInt($("#myAmount").val()) < 10000 || parseInt($("#myAmount").val()) > 10000000){
				alert("목표금액으로 적절한 금액을 입력해주세요.");
				$("#myAmount").val("");
				$("#lessAmount").html("");
				
			}else if($("#myDueDate").val() == ""){
				alert("마감일을 입력해 주세요.");
			}else if(between < 7){
				alert("마감일은 최소 일주일 이후로 설정 가능합니다.");
				$("#myDueDate").val("");
				$("#today").html("");
				
			}else if($("#myAccount").val() == ""){
				alert("계좌번호를 입력해 주세요.");
			}else if(result3 == null){
				alert("계좌번호는 12~15자리의 숫자만 가능합니다.");
				$("#myAccount").val("");
				$("#wrongAccount").html("");
				
			}else if($(".note-editable").html() == "<p><br></p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p><br></p><p><br></p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p><br></p><p><br></p><p><br></p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p><br></p><p><br></p><p><br></p><p><br></p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>"){
				alert("내용을 입력해주세요.");
				
			}else if($(".note-editable").html() == "<p>&nbsp;</p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p>&nbsp;&nbsp;</p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p>&nbsp;&nbsp;&nbsp;</p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>"){
				alert("내용을 입력해주세요.");
			}else if($(".note-editable").html() == "<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>"){
				alert("내용을 입력해주세요.");
			}else{
				$("#myContent").val($(".note-editable").html());
		        $("#myform").submit();	
			}	
	    })
	     
	    $('#summernote').summernote({
			placeholder: '내용을 입력해주세요.',
		    tabsize: 2,
		    height: 500,
		      
		    callbacks: { 
		       	onImageUpload: function(files, editor, welEditable) { 
		       		for(var i = files.length - 1; i >= 0; i--){
		       			sendFile(files[i], this);
		       		}
		        },
	        		
			    onMediaDelete : function(target) {
			        deleteFile(target[0].src);
			    }
		    }
	 	});
		
		function sendFile(file, editor) {
			var data = new FormData();
	    	data.append("file", file);
	        $.ajax({
	        	url:"uploadImage.board",
	        	data: data,
	        	type:"POST",
	        	cache: false,
	        	contentType: false,
	        	enctype: "multipart/form-data",
	        	processData: false
	        }).done(function(resp){
	        	$(".note-editable").append("<img src='"+resp+"'>");
	        })
        }
        
        function deleteFile(src) {
        	if(src == "photo_image/foryou.jpg" || src == "photo_image/ka.png" || src == "photo_image/fa.png" || src == "photo_image/kk.png"){
        	}else if(src == null){
        	}else{
        		$.ajax({
                    data: {src : src},
                    type: "POST",
                    url: "deleteImage.board", 
                    cache: false,
                    success: function(resp) {
                    	if(resp == "true"){
                    		console.log("정상 삭제");
                    	}else{
                    		console.log("삭제 실패");	
                    	}
                    }
                });	
        	}
        }
        
        $("#cancel").on("click", function(){ // 취소 버튼을 눌렀을 때 서버측의 사직 삭제
        	if(confirm("작성된 글이 모두 삭제됩니다. 정말로 취소하시겠습니까?")){
        		$("img").each(function(index, item){
            		var src = $(this).attr("src");
            		if(src == "photo_image/foryou.jpg" || src == "photo_image/ka.png" || src == "photo_image/fa.png" || src == "photo_image/kk.png"){
            		}else if(src == null){
            		}else{
            			$.ajax({
            				url: "deleteImage.board",
            				data: {src : src},
            				type: "POST",
            				cache: false
            			})	
            		}
            	})
            	location.href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages&classification=ongoing";
        	}
        })
	</script>
</body>
</html>