<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>재능기부게시판</title>
        <link
              href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
              rel="stylesheet">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
        <style>
            #wrapper *{
                text-align: center;
            }
            .title{
                font-family: "Do Hyeon";
                font-size: 50px;
                color: darkslategray;
                margin-top: 200px;
                margin-bottom: 50px;
            }
            .contents{
                font-family: "Nanum Gothic";
                font-size: 18px;
                color: gray;
                margin: auto;
            }
            .btnArea{
                text-align: center;
                margin: auto;
            }
            #goMainBtn {
                background-color: #1ebdd8;
                border-color: #1ebdd8;
                color: #FFF;	
                margin-top: 30px;
            }
            #goMainBtn:hover {
                border-color: #28a39f;
                background-color: #28a39f;
                color: #FFF;
            }
        </style>
        <script>
            $(function(){
                $("#goMainBtn").on("click",function(){
                    location.href="Main.members";
                })
            })
        </script>
    </head>
    <body>
        <div id=wrapper>
            <p class="title">서비스 준비중입니다.</p>
            <p class="contents">이용에 불편을 드려 죄송합니다.</p> 
            <p class="contents">보다 나은 서비스 제공을 위하여 준비중입니다.</p>
            <p class="contents">빠른 시일내에 준비하여 찾아뵙겠습니다.</p>
        </div>
        <div class=btnArea>
             <button class="btn" id=goMainBtn>메인으로 가기</button>	
        </div>
    </body>
</html>