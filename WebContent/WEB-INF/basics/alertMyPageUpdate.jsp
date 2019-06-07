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
		alert("정보가 수정되었습니다.");
		location.href="myPage.members?currentPage=1&currentPage2=1";
	}else{
		alert("정보 수정에 실패하였습니다.");
		location.href="myPage.members?currentPage=1&currentPage2=1";
	}
	
	
	
	</script>

</body>
</html>