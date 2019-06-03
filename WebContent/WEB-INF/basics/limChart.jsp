<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
    .progress{
        width: 50%;
        float: left;
    }

    .progress-bar{
        transition: width 3s;
    }

</style>
<body>
<div class="progress" style="height: 10px;">
  <div id="bar" class="progress-bar" role="progressbar" style="width:0;" aria-valuemin="0" aria-valuemax="100">
</div>
</div>

<span data-brackets-id='39' id="counter1"></span>%
      
    <script data-brackets-id='40'>

    function numberCounter(target_frame, target_number) {

    this.count = 0; this.diff = 0;

    this.target_count = parseInt(target_number);

    this.target_frame = document.getElementById(target_frame);

    this.timer = null;

    this.counter();

};

numberCounter.prototype.counter = function() {

    var self = this;

    this.diff = this.target_count - this.count;

     

    if(this.diff > 0) {

        self.count += Math.ceil(this.diff / "${percentNum}");

    }
     
    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');    

    if(this.count < this.target_count*10) {

        this.timer = setTimeout(function() { self.counter(); }, 20);

    } else {

        clearTimeout(this.timer);

    }

};

new numberCounter("counter1", "${percentNum}");
$("#bar").css("width","${barNum}")
    </script>
</body>
</html>