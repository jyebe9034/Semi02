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
		if(${board} > 0 && ${titleImg} > 0){
			alert("글이 성공적으로 등록되었습니다.");
			location.href = "List.board?currentPage=1&searchOption=allPages&searchWord=allPages";
		}else{
			alert("등록에 실패하였습니다. 다시 시도해주십시오.");
			location.href = "List.board?currentPage=1&searchOption=allPages&searchWord=allPages";
		}
	</script>
</body>
</html>