<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${result == "true"}){
			alert("로그인에 성공했습니다.");
			location.href = "Main.members";
		}else{
			alert("이메일 또는 비밀번호를 다시 확인해주세요.");
			location.href = "LoginForm.members";
		}
	</script>
</body>
</html>