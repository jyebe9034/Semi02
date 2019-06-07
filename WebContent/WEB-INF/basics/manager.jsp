<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Serif+KR:700|Do+Hyeon|Sunflower:300|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
   type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<style>
.bg-gradient-myColor {
   background-color: #1ebdd8; /*사이드 컬러*/
}
#f_logo{
   text-decoration: none;
   background-color: #1ebdd8;
   color: #1ebdd8;
}
</style>
</head>

    
<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">
      <!-- Sidebar -->
      <ul
         class="navbar-nav bg-gradient-myColor sidebar sidebar-dark accordion"
         id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <a
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="Main.members">
            <div class="sidebar-brand-icon rotate-n-15">
            </div>
            <div class="sidebar-brand-text mx-3" style="font-family: 'Cute Font', cursive;" ><h3>도움닿기</h3></div>
         </a>

         <!-- Divider -->
         <hr class="sidebar-divider my-0">
         
         <!-- Nav Item - Dashboard -->
         <li class="nav-item active"><a class="nav-link"
            href="Bar.manager"> <i class="fas fa-fw fa-tachometer-alt"></i>
               <span>Dashboard</span></a></li>

         <!-- Divider -->
         <hr class="sidebar-divider">

         <!-- Heading -->
         <div class="sidebar-heading">Interface</div>

         <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item"><a class="nav-link collapsed" href="#"
            data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo"> <i
               class="fas fa-fw fa-cog"></i>
            <!--왼쪽 그림--> <span>바로가기</span>
         </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"   data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">페이지 바로가기</h6>
                  <a class="collapse-item" href="start.html">홈페이지</a> 
                  <a class="collapse-item" href="Introduce.members">소개 페이지</a>
                  <a class="collapse-item" href="TalentDonations.board">재능기부 게시판</a>
                  <a class="collapse-item" href="List.board?currentPage=1&searchOption=allPages&searchWord=allPages">후원 게시판 페이지</a>
                  <a class="collapse-item" href="#">회원 정보 페이지</a>
               </div>
            </div></li>

         <!-- Divider -->
         <hr class="sidebar-divider d-none d-md-block">

         <!-- Sidebar Toggler (Sidebar) -->
         <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
         </div>

      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">

            <div class="container-fluid">

               <!-- Page Heading -->
               <div
                  class="d-sm-flex align-items-center justify-content-between mb-4">
                  <h1 class="h3 mb-0 text-gray-800"><br>Dashboard</h1>
                  <!--<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Geneasdasdrate Report</a>-->
               </div>
            

               <div class="row">

                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-primary text-uppercase mb-1">오늘의
                                    방문자 수</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">${visitPerson}명</div>
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-calendar fa-2x text-gray-300"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-success text-uppercase mb-1">총 모금액</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">${totalMoney}원</div>
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-info text-uppercase mb-1">총 게시판 개수</div>
                                 <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                       <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${nowingProjectCount}개</div>
                                    </div>
                                    <div class="col">
                                       <!-- <div class="progress progress-sm mr-2">
                                          <div class="progress-bar bg-info" role="progressbar"
                                             style="width: 0%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                       </div> -->
                                    </div>
                                 </div>
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                              </div>
                           </div>   
                        </div>
                     </div>
                  </div>

                  <!-- Pending Requests Card Example -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-warning text-uppercase mb-1">회원 수</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">${joinMemberCount}명</div>
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-comments fa-2x text-gray-300"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Content Row -->

               <div class="row">
                  <!-- Area Chart -->
                  <div class="col-xl-8 col-lg-7">
                     <div class="card shadow mb-4" style="height: 27rem;">
                        <!-- Card Header - Dropdown -->
                        <div
                           class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                           <h6 class="m-0 font-weight-bold text-primary">시간대 별 방문자 수</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                           <div class="chart-area">
                              <canvas id="myAreaChart"></canvas>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Pie Chart -->
                  <div class="col-xl-4 col-lg-5">
                     <div class="card shadow mb-4" style="height: 27rem;">
                        <!-- Card Header - Dropdown -->
                        <div
                           class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                           <h6 class="m-0 font-weight-bold text-primary">Top3 추천수</h6>
                           
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                           <div class="chart-pie pt-4 pb-2">
                              <canvas id="myPieChart"></canvas>
                           </div>
                           <div class="mt-4 text-center small">
                              <span class="mr-2"> <i
                                 class="fas fa-circle text-primary"></i>${pie[0].title}
                              </span> <span class="mr-2"> <i
                                 class="fas fa-circle text-success"></i>${pie[1].title}
                              </span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>${pie[2].title}
                                                         
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Content Row -->
               <div class="row">

                  <!-- Content Column -->
                  <div class="col-lg-6 mb-4">

                     <!-- Project Card Example -->
                     <div class="card shadow mb-4" style="height: 28.5rem;">
                        <div class="card-header py-3">
                           <h6 class="m-0  font-weight-bold text-primary">최고 추천 최저 추천</h6>
                        </div>
                        <div class="card-body">
                              <canvas id="myAreaChart1"></canvas>
                        </div>
                     </div>
                     
                     <!-- Color System -->
                     <div class="card shadow mb-4" style="height: 27rem;">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary">기부 많이 사람</h6>
                        </div>
                        <div class="card-body">
                           <canvas id="donationManyPerson"></canvas>                        
                        </div>
                     </div>

                  </div>

                  <div class="col-lg-6 mb-4">
                     <div class="col-mb-8">
                     <div class="card shadow mb-4" style="height: 28.5rem;">
                        <!-- Card Header - Dropdown -->
                        
                        <div
                           class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                           <h6 class="m-0 font-weight-bold text-primary">최고 조회수 최저 조회수</h6>
                           <div class="dropdown no-arrow">
                              
                           </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                              <canvas id="topCount"></canvas>
                        </div>
                     </div>
                  </div>

                     <!-- Illustrations -->
                     <div class="card shadow mb-4" style="height: 27rem;">
                        <div class="card-header py-3">
                        <a name="memberInfo"></a>
                           <h6 class="m-0 font-weight-bold text-primary">회원 정보</h6>
                        </div>
                        <div class="card-body">
                           <div id="table_member"></div>                        
                        </div>
                     </div>

                  </div>
               </div>
                     <div class="card shadow mb-4" style="height: 35rem;">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary">총 기부 게시판 진행상황</h6>
                        </div>
                        <div class="card-body">
                           <div id="table_div"></div>
                        </div>
                     </div>
            </div>
            <!-- /.container-fluid -->

         </div>
         <!-- End of Main Content -->

         <!-- Footer -->
         <footer class="sticky-footer bg-white">
            <div class="container my-auto">
               <div class="copyright text-center my-auto">
                  <div id="f_logo_wrap">
                     <a id="f_logo" href="Main.members" style="font-family: 'Cute Font', cursive;"><h1>도움닿기</h1></a>
                  </div>
                  <div id="f_info_wrap">
                     <div id="f_info">
                        <p>행동하는 당신과 당신의 도움으로 다시 희망을 찾는 사람들을 응원힙니다.</p>
                        <p>COPYRIGHT ⓒ 2019 BY RUNUP ALL RIGHT RESERVED</p>
                     </div>
                  </div>
               
               </div>
            </div>
         </footer>
         <!-- End of Footer -->

      </div>
      <!-- End of Content Wrapper -->

   </div>
   <!-- End of Page Wrapper -->

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>


   <!-- Bootstrap core JavaScript-->
   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="js/sb-admin-2.min.js"></script>

   <!-- Page level plugins -->
   <script src="vendor/chart.js/Chart.min.js"></script>

   <script>
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {

  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example 라인 차트!
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["0시","1시","2시","3시","4시","5시","6시","7시","8시","9시","10시","11시"
       ,"12시","13시","14시","15시","16시","17시","18시","19시","20시","21시","22시","23시"],
    datasets: [{
      label: "방문자:",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 0, 0, 0.2)",
      borderColor: "red",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: ["${line[0].time1}","${line[0].time2}","${line[0].time3}","${line[0].time4}","${line[0].time5}","${line[0].time6}","${line[0].time7}"
         ,"${line[0].time8}","${line[0].time9}","${line[0].time10}","${line[0].time11}","${line[0].time12}","${line[0].time13}","${line[0].time14}",
         "${line[0].time15}","${line[0].time16}","${line[0].time17}","${line[0].time18}","${line[0].time19}","${line[0].time20}","${line[0].time21}",
         "${line[0].time22}","${line[0].time23}","${line[0].time24}"],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          callback: function(value, index, values) {
            return number_format(value)+"명";
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: 'red',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + number_format(tooltipItem.yLabel)+"명";
        }
      }
    }
  }
});
      
      
  </script>

<script>
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var titleList = new Array();
var recommendList = new Array();
<c:forEach var="i" items="${pie}" varStatus="status">
   titleList[${status.index}] = "${i.title}";
   recommendList[${status.index}] = "${i.recommend}";
</c:forEach>
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: titleList,
    datasets: [{
      data: recommendList,
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','red'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf','red'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
  </script>

   <script> //bar
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {

  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example , 최고 최저 기부 추천
var ctx = document.getElementById("myAreaChart1");
var myLineChart =new Chart(ctx,{
  type: 'bar',
  data: {
    labels: ["${bestRecommendCount[0]}", "${worstRecommendCount[0]}"],
    datasets: [{
      label: "추천수:",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 0, 0, 0.2)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data:['${bestRecommendCount[1]}','${worstRecommendCount[1]}'],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          callback: function(value, index, values) {
            return number_format(value)+'추천';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: 'red',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + number_format(tooltipItem.yLabel)+"개";
        }
      }
    }
  }
});

var nameList = new Array();
var moneyList = new Array();
<c:forEach var="i" items="${donationManyPeople}" varStatus="status">
   nameList[${status.index}] = "${i.name}";
   moneyList[${status.index}] = "${i.sumAmount}";
</c:forEach>
var ctx = document.getElementById("donationManyPerson"); //기부 많이한 사람 3
var myLineChart =new Chart(ctx,{
  type: 'bar',
  data: {
    labels: nameList,
    datasets: [{
      label: "총 기부금:",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 0, 0, 0.2)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data : moneyList,
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          callback: function(value, index, values) {
            return number_format(value)+'원';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: 'red',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + number_format(tooltipItem.yLabel)+"원";
        }
      }
    }
  }  
});



var ctx = document.getElementById("topCount"); //최고 최저 조회수
var myLineChart =new Chart(ctx,{
  type: 'bar',
  data: {
    labels: ["${bestViewCount[0]}", "${worstViewCount[0]}"],
    datasets: [{
      label: "조회수:",
      lineTension: 0.3,
      backgroundColor: "rgba(255, 0, 0, 0.2)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data:['${bestViewCount[1]}','${worstViewCount[1]}'],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          callback: function(value, index, values) {
            return number_format(value)+'추천';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: 'red',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + number_format(tooltipItem.yLabel)+"개";
        }
      }
    }
  }
});
  </script>
  
  <script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
   
   
<script type="text/javascript"> //회원 게시판   
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);
      
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '이메일');
        data.addColumn('string', '이름');
        data.addColumn('string', '전화번호');
        data.addColumn('string', '가입일자');
        data.addColumn('string', 'IP');
        data.addRows([
           <c:forEach var='memberInfo' items="${memberInfo}">
           ['${memberInfo.email}','${memberInfo.name}','${memberInfo.phone}','${memberInfo.joinDate}','${memberInfo.ipAddress}'],
         </c:forEach>
        ]);
        var table = new google.visualization.Table(document.getElementById('table_member'));
        table.draw(data, {showRowNumber: true, width: '100%', height: '330'});
      }
    </script>

<script type="text/javascript"> //기부 게시판
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);
 
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '기부 프로젝트 이름');
        data.addColumn('string', '기부 신청자');
        data.addColumn('string', '글 작성일자');
        data.addColumn('string', '마감일');
        data.addColumn('number', '현재모금액');
        data.addColumn('number', '도달금액');
        data.addColumn('boolean', '도달여부');
        
        data.addRows([
           <c:forEach var='allDonationProject' items="${totalDonationProject}">
           ['${allDonationProject.title}','${allDonationProject.writer}','${allDonationProject.writeDate}','${allDonationProject.dueDate}',{v: ${allDonationProject.amount}, f: '${allDonationProject.amount}원'},{v: ${allDonationProject.sumAmount}, f: '${allDonationProject.sumAmount}원'},${allDonationProject.donationResult}],
         </c:forEach>
        ]);
        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {showRowNumber: true, width: '100%', height: '430'});
      }
    </script>
</body>

</html>