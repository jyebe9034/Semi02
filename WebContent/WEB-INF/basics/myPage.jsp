<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
   href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
   rel="stylesheet">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>   
   <link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<link rel="stylesheet" href="nav_footer.css">
<style>
.wrapper {
   width: 400px;
   margin: auto;
   padding: 40px;
   border: 1px solid #e4e4e4;
   border-radius: 5px;
}

.top_wrapper {
   display: flex;
   justify-content: space-between;
   height: 40px;
   align-items: center;
   position: relative;
   margin: auto;
}

a {
   font-weight: bold;
}

a:hover {
   color: #000000;
}

.title {
   margin-bottom: 30px;
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

.btn-primary:active, .btn-primary:visited, .btn-primary:active:focus,
   .btn-primary:active:hover {
   border-color: #639d34;
   background-color: #639d34;
   color: #FFF;
}

#zip {
   display: inline-block;
   margin-top: 20px;
}

#inputZip {
   display: inline-block;
}

.helper {
   font-size: 12px;
}

#pw_form, #pw_match, #emailCheck {
   font-size: 12px;
}

#divBtnJoin {
   text-align: center;
}

#checkPassword {
   margin-bottom: 5px;
}

#inputEmail, #inputPassword, #phone {
   display: inline-block;
}

.menubar ul {
   margin: auto;
}

.menubar li {
   width: 130px;
}

.myhr1 {
   border: 0;
   height: 1px;
   background-color:;
}

.first {
   letter-spacing: 1px;
   margin-left: 3em;
   display: block;
   color: gray;
   line-height: 21px;
}

.first-pw {
   letter-spacing: 1px;
   margin-left: 3em;
   display: block;
   color: gray;
   line-height: 35px;
}

.first-phone {
   letter-spacing: 1px;
   margin-left: 3em;
   display: block;
   color: gray;
   line-height: 35px;
}

.second {
   font-weight: 600;
   margin-left: 1.6em;
   background-color: white;
   border-color: white;
}

.white {
   border: 0px;
   margin-right: 2em;
   height: 30px;
   font-weight: 600;
}

.wrap {
   border: 1.5px solid #c4c4c490;
   padding: 50px;
}

#top {
   border-color: whitesmoke
}

.update {
   position: relative;
   top: 30px;
   left: 45%;
}

#address1, #address2 {
   width: 270px;
}

#zipcode {
   background-color: white
}

.head {
   font-size: 18px;
   font-weight: bold;
   text-align: center;
}

.contents {
   text-align: center;
}

.underline {
   border: solid 1px lightgrey;
   width: 150px;
   margin-top: 0px;
   margin-bottom: 40px;
}

.numBox li a {
   color: lightslategray;
}
#address1,#address2,#phone{
   background-color:"white";

}
.form-control[readonly] {
   background-color: white;
}

   .page-link{
   color : #1ebdd8;
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
            <li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages">후원 게시판</a></li>
            <li class="nav-item nav-li"><a id="logos" class="nav-link anker" href="myPage.members?currentPage=1&currentPage2=1">마이 페이지</a></li>
            <li class="nav-item nav-li"><a class="nav-link anker" href="Logout.members">로그아웃</a></li>

         </ul>
      </div>
   </nav>

      <hr style="margin:0px; bordercolor:whitesmoke;">
   
   
   
   
<br><br><br>
         <div class="container wrap">
            <h3>내 정보</h3>
            <hr class="myhr1">
            <div class="row">
               <div class="col-2">
                  <span class="first">이메일</span>
               </div>
               <div class="col-10">
                  <span class="second">${dto.email }</span>
               </div>
            </div>
            <hr>
            <div class="row">
               <div class="col-2">
                  <span class="first">이름</span>
               </div>
               <div class="col-10">
                  <span class="second">${dto.name }</span>
               </div>
            </div>
            <hr>
            <div class="row">
               <div class="col-2">
                  <span class="first-phone">연락처</span>
               </div>
               <div class="col-10">
                  <span><form class="form-inline">
                        <div class="form-group">
                           <input type="text" id="phone"
                              class="form-control mx-sm-3 second" value="${dto.phone }">
                        </div>
                     </form></span>
               </div>
            </div>

            <hr>
            <div class="row">
               <div class="col-2">
                  <span class="first-pw">주소</span>
               </div>
               <div class="col-10">
                  <span><form class="form-inline">
                        <div class="form-group">
                           <input type="text" id="zipcode"
                              class="form-control mx-sm-3 second" value="${dto.zipCode }"
                              readonly>
                        </div>
                     </form></span>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-2">
                  <span class="first-pw"></span>
               </div>
               <div class="col-10">
                  <span><form class="form-inline">
                        <div class="form-group">
                           <input type="text" id="address1"
                              class="second form-control mx-sm-3" value="${dto.address1 }">
                        </div>
                     </form></span>
               </div>
            </div>
            <br>

            <div class="row">
               <div class="col-2"></div>
               <div class="col-10">
                  <span><form class="form-inline">
                        <div class="form-group">
                           <input type="text" id="address2"
                              class="second form-control mx-sm-3" value="${dto.address2 }">

                        </div>
                     </form></span>
               </div>
            </div>
            <div class="row">
               <div class="col-12">
                  <a href="myPageUpdateLocation.members"><button type="button"
                        class="btn btn-info update">정보 수정</button></a>
               </div>
            </div>

         </div>
   <br>
   <br>
   <br>
   <div class="container wrap">
      <h3>내가 도와준 글</h3>
      <hr class="myhr1">
      <!--    <hr  class="mySupportList"> -->
      <div class="container">
         <div class="row head">
            <div class="col-xl-1 col-lg-1 col-md-4 col-sm-4 d-sm-block d-none">글
               번호</div>
            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 d-sm-block d-none">후원
               명</div>
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-sm-block d-none">후원
               금액</div>
            <div class="col-xl-2 col-lg-2 d-none d-lg-block">후원 날짜</div>
            <div class="col-xl-2 col-lg-2 d-lg-block d-none">글 작성자</div>
         </div>
         <br>
         <!--       <div class="row contents"> -->
         <!--          <div class="col-xl-1 col-lg-1 col-md-4 col-sm-4">1</div> -->
         <!--          <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4">연탄 봉사 후원</div> -->
         <!--          <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">15,000원</div> -->
         <!--          <div class="col-xl-2 col-lg-2 d-none d-lg-block">5월 31일 13시 51분</div> -->
         <!--          <div class="col-xl-2 col-lg-2 d-lg-block d-none">임창훈</div> -->
         <!--       </div> -->
         <div class="row contents">
            <c:forEach var="myDonateContents" items="${myDonateContents }">
               <div class="col-xl-1 col-lg-1 col-md-4 col-sm-4">${myDonateContents.boardNo }</div>
               <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4">${myDonateContents.boardTitle }</div>
               <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">${myDonateContents.paymentAmount }원</div>
               <div class="col-xl-2 col-lg-2 d-none d-lg-block">${myDonateContents.paymentDate }</div>
               <div class="col-xl-2 col-lg-2 d-lg-block d-none">${myDonateContents.boardWriter }</div>
               <hr>
            </c:forEach>
         </div>
         <br><br>
         <div class="row  p-0 m-0" class="numBox">
            <div class="col-12 d-flex justify-content-center">
               <nav aria-label="Page navigation example">
                  <ul class="pagination pagination-sm">${getNavi}</ul>
               </nav>
            </div>
         </div>
      </div>
   </div>
   <br>
   <br>
   <br>
   <div class="container wrap">
      <h3>내가 올린 글</h3>
      <hr class="myhr1">
      <div class="container">
         <div class="row head">
            <div class="col-xl-1 col-lg-1 col-md-4 col-sm-4 d-sm-block d-none">글 번호</div>
            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 d-sm-block d-none">글 제목</div>
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-sm-block d-none">모인 금액</div>
            <div class="col-xl-2 col-lg-2 d-none d-lg-block">작성일</div>
            <div class="col-xl-2 col-lg-2 d-lg-block d-none">조회수</div>
         </div>
         <br>
         <div class="row contents">
            <c:forEach var="myDonateContents2" items="${myDonateContents2 }">
               <div class="col-xl-1 col-lg-1 col-md-4 col-sm-4">${myDonateContents2.boardNo }</div>
               <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4">${myDonateContents2.title }</div>
               <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">${myDonateContents2.sumAmount }원</div>
               <div class="col-xl-2 col-lg-2 d-none d-lg-block">${myDonateContents2.writeDate }</div>
               <div class="col-xl-2 col-lg-2 d-lg-block d-none">${myDonateContents2.viewCount }</div>
               <hr>
            </c:forEach>
         </div>
      </div>
      <br><br>
      <div class="row  p-0 m-0" class="numBox">
         <div class="col-12 d-flex justify-content-center">
            <nav aria-label="Page navigation example">
               <ul class="pagination pagination-sm">${getNavi2}
               </ul>
            </nav>
         </div>
      </div>
   </div>
   <br>
   <br>
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
</body>
</html>