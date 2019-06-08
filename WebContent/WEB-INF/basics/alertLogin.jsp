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
		if(${resultLogin == "login"}){
			alert("이미 로그인중인 계정입니다.");
			location.href = "Main.members";
		}
		if(${result == "true"}){
			alert("로그인에 성공했습니다.");
			location.href = "Main.members";
		}else if(${result == "false"}){
			alert("이메일 또는 비밀번호를 다시 확인해주세요.");
			location.href = "LoginForm.members";
		}
	</script>
</body>
</html>