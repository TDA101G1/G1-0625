<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>您的請求已經失效</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/product/css/denyPage.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/product/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="<%=request.getContextPath()%>/product/vendors/jquery/jquery-3.4.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/product/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/vendors/css/footer.css">
  <style>
  	body{
  		padding-top: 0;
  	}
  	
  	.navbar-light .navbar-nav .nav-link {
    color: rgba(0,0,0,.5) !important;
	}
	
	.nav-link{
		display:inline-block !important;
	}
  </style>
  </head>
  <body>
  <%@include file="../frontstage_member/pages/header.file" %>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-6 col-md-3">
          <div class="search_area">
            <i class="fas fa-file-medical-alt" style="font-size:180px; color:#E6903B;"></i>
            <!-- <i class="fas fa-file-medical-alt"></i> -->
        	</div>
        </div>
        <div class="col-10 col-md-9">
          <div class="descrpit">
            <h3>您請求的表單已經失效了</h3>
            <p><span class="seconds">10</span>秒後將幫助您回到首頁</p>
            <p>如果沒有自動跳轉您可以<a href="<%=request.getContextPath()%>/index.jsp">點擊這裡</a>回到首頁</p>
          </div>
        </div>
      </div>

    <!-- container -->
    </div>
<%@include file="../frontstage_member/pages/footer.file" %>
	<script src="<%=request.getContextPath()%>/vendors/js/footer.js"></script>
    <script src="<%=request.getContextPath()%>/product/js/denyPage.js"></script>
  </body>
</html>
