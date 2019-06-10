<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/photo_image/favicon.ico">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${result} > 0){
			alert("비밀번호가 변경되었습니다.");
			location.href = "LoginForm.members";
		}else{
			alert("비밀번호 변경에 실패하였습니다.");
			location.href = "FindPWForm.members";
		}
	</script>
</body>
</html>