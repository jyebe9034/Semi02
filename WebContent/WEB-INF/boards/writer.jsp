<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
body {
	font-family: "Nanum Gothic";
	height: 100%;
}

a {
	font-weight: bold;
}

a:hover {
	color: #000000;
}

ul {
	margin: auto;
}

li {
	width: 130px;
}

.container {
	width: 700px;
	min-width: 400px;
}


</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light navbar-fixed-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp"><img
				src="logo/bridge_logo2.png" width="150px"></a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">소개</a></li>
				<li class="nav-item"><a class="nav-link" href="write.board">후원해
						주세요</a></li>
				<li class="nav-item"><a class="nav-link"
					href="textList.board?currentPage=1">후원 게시판</a></li>
				<c:choose>
					<c:when test="${sessionScope.loginEmail != null || navercontents.name != null}">
						<li class="nav-item"><a class="nav-link"
							href="Logout.members">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="LoginForm.members">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="JoinForm.members">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	<hr>
	<div class="container">
		<form action="supportMe.board" method="post" id="all"
			enctype="multipart/form-data">
			<div class="form-group">
				<input type="text" class="form-control" id="title" name="title"
					aria-describedby="" placeholder="제목을 입력해 주세요." required>
			</div>
			<div class="form-group">
				후원 게시판에 표시될 사진 파일을 첨부해 주세요. <input type="file" class="photo"
					name="file" value="사진 첨부">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="writer" name="writer"
					aria-describedby="" placeholder="작성자 성함" required>
			</div>
			<div class="form-group">
				<input type="number" class="form-control" id="amount"
					name="amount" aria-describedby="" placeholder="목표모금액" min="10000" max="10000000" required>
			</div>
			<div class="form-group">
				모금 마감날짜를 입력해 주세요.(모금은 후원글이 등록된 시점부터 시작됩니다.) <input type="date"
					class="form-control"  name="dueDate"
					aria-describedby="" placeholder="" required>
			</div>
			<div class="form-group">
				후원받으실 계좌의 은행명을 선택하고 계좌번호를 입력해 주세요. 
				<select name="select">
					<option value="신한">신한</option>
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
				</select>
				<input type="text"
					class="form-control" id="account" name="account"
					aria-describedby="" placeholder="계좌번호 '-' 제외하고 입력" required>
			</div>

			<div class="row">
				<div id="content" class="col-12">
					<div id="summernote" contenteditable="true"></div>
					<input id="mycontent" type="hidden" name="mycontent">
				</div>
			</div>
			<div id="footer" class="row">
				<div class="col-12">
					<div class="btns">
						<input id="sendit" class="btn btn-sm btn-outline-primary"
							type="button" value="등록">
					</div>
					<div class="btns">
						<input type="button" id="cancel"
							class="btn btn-sm btn-outline-primary" value="취소">
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- 	<input type="submit" id="reg" value="등록"> -->
</body>
<script>
	// 	$("#reg").on('click',function(){

	// 	})

	$(window).on("beforeunload", function() {
		$("img").each(function(index, item) {
			var src = $(this).attr("src");
			$.ajax({
				url : "deleteImage.board",
				data : {
					src : src
				},
				type : "POST",
				cache : false
			})
		})
	});

	$("#sendit").on("click", function() {
		$("#mycontent").val($(".note-editable").html());
		$("#all").submit();
	})

	$('#summernote').summernote({
		placeholder : '내용을 입력해주세요.',
		tabsize : 2,
		height : 500,

		callbacks : { // 값이 하나 이상이기 때문에 객체로 넣어줌.
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
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
			url : "uploadImage.board",
			data : data,
			type : "POST",
			cache : false,
			contentType : false,
			enctype : "multipart/form-data",
			processData : false
		}).done(function(resp) {
			$(".note-editable").append("<img src='"+resp+"'>");
		})
	}

	function deleteFile(src) {
		$.ajax({
			data : {
				src : src
			},
			type : "POST",
			url : "deleteImage.board", // replace with your url
			cache : false,
			success : function(resp) {
				if (resp == "true") {
					console.log("정상 삭제");
				} else {
					console.log("삭제 실패");
				}
			}
		});
	}

	$("#cancel").on("click", function() {
		$("img").each(function(index, item) {
			var src = $(this).attr("src");
			$.ajax({
				url : "deleteImage.board",
				data : {
					src : src
				},
				type : "POST",
				cache : false
			})
		})
		location.href = "textList.board?currentPage=${currentPage}";
	})

	//         $("#summernote").keyup(function(e){
	//         	if(e.keyCode == 8) { // backspace

	//         	}else if(e.keyCode == 46) { // delete key

	//         	} 
	//         })
</script>
</html>