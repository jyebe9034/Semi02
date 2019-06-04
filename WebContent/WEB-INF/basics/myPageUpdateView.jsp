<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
	
	if(${result}>0){
		
		alert("정보가 수정되었습니다. 다시 로그인 해주세요.");
		location.href="myPageUpdateComplete.members"
	}else{
		
		alert("정보 수정에 실패하였습니다.");
		location.href="myPageUpdateComplete.members"
	}
	
	
	
	</script>

</body>
</html>