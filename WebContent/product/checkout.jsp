<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.member.model.MemberService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="Credit_CardService" scope="page" class="com.credit_card.model.Credit_CardService"></jsp:useBean>
<jsp:useBean id="CouponService" scope="page" class="com.coupon.model.CouponService"></jsp:useBean>




<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>結帳</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/product/css/checkout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/product/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="<%=request.getContextPath()%>/product/vendors/jquery/jquery-3.4.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/product/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  </head>
  <body>

 	<%@include file="../frontstage_member/pages/header.file" %>
 
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="search_area">
            <h3><i class="fas fa-cash-register" style="font-size:2em"></i>結帳</h3>
        	</div>
        </div>
        <div class="col-md-6">
          <div class="search_area">
        		<input type="text" id="search" placeholder="請輸入商品編號" />
        		<span class="searchIcon"><i class="fa fa-search"></i></span>
        	</div>
        </div>
      </div>

      <div class="row justify-content-center">
        <div class="col-12">
          <table>
            <h4>我的訂單</h4>
            <tr >
              <th class="" style="width:200px;">預覽圖</th>
              <th class="" >商品名稱/商品選項</th>
              <th class="">日期</th>
              <th class="">單價</th>
              <th class="">數量</th>
              <!-- <th class="">小計</th> -->
            </tr>

            <!-- <tr class="orderOne" data-productDetail_ID="">
              <td rowspan="2" class="" style="box-shadow: 0px 3px 0px 0px #cccccc;">
                <div class="previewImg">
                  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Sun_Down_%28250260941%29.jpeg/300px-Sun_Down_%28250260941%29.jpeg" alt="">
                </div>
              </td>
              <td class="">
                <p class="">iphone XD</p>
                <p class="">8G 128GB</p>
              </td>
              <td>
                <p class="">2016-01-20</p>
                <p class="">2016-12-04</p>
              </td>
              <td class="price">99803</td>
              <td class="quantity">3</td>
            </tr>
            <tr>
              <td colspan="4" class="subtotalAgain">
                <hr>
                訂單金額(<span class="span_quantity"></span>個商品)
                NT:<span class="span_subtotal"></span>
              </td>
            </tr> -->

          </table>
        </div>
      </div>

      <div class="row coupon">
        <div class="col-3">
          優惠券
        </div>
        <div class="col-4">
          <a class="selectedCoupon">尚未選擇優惠券</a>
        </div>
        <div class="col-5">
            <button class="choiceCoupon" type="button" name="button">選擇優惠券或輸入折扣碼</button>
        </div>
      </div>

      <div class="row payments">
        <div class="col-12 col-md-3">
          付款方式
        </div>
        <div class="col-12 col-md-9">
          <button class="btn_payments credicard" type="button" name="button">信用卡</button>
          <button class="btn_payments transfer" type="button" name="button" disabled>銀行轉帳</button>
          <button class="btn_payments mobilePay" type="button" name="button" disabled>手機支付</button>
        </div>
      </div>

      <div class="row choiceAccount">
        <div class="col-12 col-md-3 creditCard">
		  選擇付款帳戶
        </div>
        <div class="col-12 col-md-9 creditCard">
<c:forEach items="${Credit_CardService.getCredit_CardByMember_ID(member.member_ID)}" var="cardVO">
 		  <div class="">
            <label>
              <input class="radioCreditCard" type="radio" name="creditCard" value=""><i class="fab fa-cc-visa" style="font-size: 2em;"></i>
              <a class="cardNumber" data-cardNumber="${cardVO.credit_Card_Number}">${cardVO.credit_Card_Number}</a>
            </label>
          </div>
</c:forEach> 
<!--           <div class=""> -->
<!--             <label> -->
<!--               <input type="radio" name="1" value=""><i class="fab fa-cc-visa" style="font-size: 2em;"></i> -->
<!--               <a class="cardNumber">4xxx-xxxx-xxxx-xxxx</a> -->
<!--             </label> -->
<!--           </div> -->
<!--           <div class=""> -->
<!--             <label> -->
<!--               <input type="radio" name="1" value=""><i class="fab fa-cc-mastercard" style="font-size: 2em;"></i> -->
<!--               <a class="cardNumber">5xxx-xxxx-xxxx-xxxx</a> -->
<!--             </label> -->
<!--           </div> -->
<!--           <div class=""> -->
<!--             <label> -->
<!--               <input type="radio" name="1" value=""><i class="fab fa-cc-jcb" style="font-size: 2em;"></i> -->
<!--               <a class="cardNumber">3xxx-xxxx-xxxx-xxxx</a> -->
<!--             </label> -->
<!--           </div> -->
          <div class="">
            <button class="btn btn-primary addCreditcard">++使用新信用卡付款</button>
          </div>
        </div>
        <!-- <div class="col-12 col-md-3 creditCard">
          選擇付款帳戶
        </div>
        <div class="col-12 col-md-9 creditCard">
          <div class="">
            <label>
              <input type="radio" name="1" value=""><i class="fab fa-cc-visa" style="font-size: 2em;"></i>
              <a class="">某某商業銀行</a>
            </label>
          </div>
          <div class="">
            <label>
              <input type="radio" name="1" value=""><i class="fab fa-cc-mastercard" style="font-size: 2em;"></i>
              <a class="">某某商業銀行</a>
            </label>
          </div>
          <div class="">
            <label>
              <input type="radio" name="1" value=""><i class="fab fa-cc-jcb" style="font-size: 2em;"></i>
              <a class="">某某商業銀行</a>
            </label>
          </div>
          <div class="">
            <button type="button" name="button">++使用新信用卡付款</button>
          </div>
        </div> -->
      </div>

      <div class="row justify-content-end checkout">
        <div class="col-12 col-md-4">
          <p>商品總額: <span class="tottleAmount"></span></p>
          <p>折抵金額: <span class="discount">0</span><span class="discountPercentage"></span></p>
          <h5>應付金額: <span class="shouldPay"></span></h5>
          <button class="btn_order" type="button" name="button">下訂單</button>
        </div>
      </div>





    <!-- container -->
    </div>


    <!-- 優惠券選擇起點 -->
    <div id="myModal" class="modal">
      <div class="box">
        <h4 class="couponTittle">選擇優惠券</h4>
        <div class="addCouponArea">
          輸入折扣碼
          <input class="inputCode" type="text">
          <button class="couponCode" type="button" name="button">確認輸入</button>
        </div>
        <div>
          <table class="table table-striped table-hidden">
            <thead>
              <tr>
                <th colspan="2" data-th="序號">已經有的優惠券</th>
              </tr>
            </thead>
            <tbody>
<c:forEach items="${CouponService.getMemberCoupon(member.member_ID)}" var="couponVO">
	<tr class="oneCoupon" data-coupon_ID="${couponVO.coupon_ID}" data-coupon_Info="${couponVO.coupon_Info}" >
      <td class="column1">
        <label>
          <input class="radioCoupon" type="radio" name="coupon" data-discount="${couponVO.coupon_Class}">
          <a class="couponTittle">${couponVO.coupon_Name}</a>
        </label>
      </td>
      <td class="column3">
        <button class="callDetail" type="button" name="button">優惠券使用詳情</button>
      </td>
    </tr>
</c:forEach>

<!--               <tr data-coupon_ID="123"> -->
<!--                 <td class="column1"> -->
<!--                   <label> -->
<!--                     <input class="radioCoupon" type="radio" name="1" data-discount="0.85"> -->
<!--                     <a>八折優惠券</a> -->
<!--                   </label> -->
<!--                 </td> -->
<!--                 <td class="column3"> -->
<!--                   <button class="callDetail" type="button" name="button">優惠券使用詳情</button> -->
<!--                 </td> -->
<!--               </tr> -->
<!--               <tr data-coupon_ID="456"> -->
<!--                 <td class="column1"> -->
<!--                   <label> -->
<!--                     <input class="radioCoupon" type="radio" name="1" data-discount="0.75"> -->
<!--                     <a>七折優惠券</a> -->
<!--                   </label> -->
<!--                 </td> -->
<!--                 <td class="column3"> -->
<!--                   <button class="callDetail" type="button" name="button">優惠券使用詳情</button> -->
<!--                 </td> -->
<!--               </tr> -->

            </tbody>
          </table>
        </div>

        <div>
          <button class="cancel" type="button">取消</button>
          <button class="confirm" type="button">確定</button>
        </div>
      </div>


      <div class="couponDetail">
        <h4>優惠券說明</h4>
        <div class="couponName">
          <a>======優惠券名稱=====</a>
        </div>
        <a class="couponInfo">Ajax取得使用方法Ajax取得使用方法Ajax取得使用方法Ajax取得使用方法</a>
        <div class="goBack">
          <button class="btn_GoBack" type="button" name="button">返回</button>
        </div>
      </div>
    </div>
    <!-- 優惠券選擇終點 -->

    <!-- 新增信用卡起點 -->
    <div id="myModal1" class="modal1">
      <div class="box">
        <h4 class="couponTittle">新增信用卡</h4>
        <form class="form_credicard" action="#" method="post">
          <input type="text" name="" value="" placeholder="持卡人姓名" required>
          <input type="text" name="" value="" placeholder="信用卡號碼xxxx-xxxx-xxxx-xxxx" required>
          <input class="mm" type="text" name="" value="" placeholder="月份MM" required>
          <input class="yyyy" type="text" name="" value="" placeholder="年份YYYY" required>
          <input class="cvv" type="text" name="" value="" placeholder="CVV3碼" required>
          <input type="text" name="" value="" placeholder="帳單地址" required>
          <input type="text" name="" value="" placeholder="郵遞區號" required>
          <p>We partner with AirPay to ensure that your credit card details
              are kept safe and secure. Shopee will not have access to
              your credit card info.</p>
          <button class="cancel" type="button">取消</button>
          <button class="registerCreditcard" type="submit" name="button">確定</button>
        </form>
      </div>
      <span class="close">&times;</span>
    </div>
    <!-- 新增信用卡終點 -->

    <script src="<%=request.getContextPath()%>/product/js/checkout.js"></script>
  </body>
</html>
