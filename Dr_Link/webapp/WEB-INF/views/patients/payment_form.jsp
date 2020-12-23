<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm a");;
	SimpleDateFormat date_time = new SimpleDateFormat("yyyy/MM/dd/hh:mm");
%>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>결제 내역 - Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome/css/all.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		
		<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}



.footer-menu{
	color:#fff;
}
</style>
<!-- 
		<script type="text/javascript">
			function paymentForm() {
				var chkbox = document.getElementsByName('terms_accept_1');
				var chk = false;
				for (var i = 0; i < chkbox.length; i++) {
					if (chkbox[i].checked) {
						chk = true;
					} else {
						chk = false;
					}
				}
				if (chk) {
					alert("모든 약관에 동의함.");
					return false;
				} else {
					alert("모든 약관에 동의해 주세요.")
				}
			}
		</script>
 -->
 <script type="text/javascript" src="../resources/js/test.js"></script>



</head>
	<body>

		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			

			
			<!-- Page Content -->
			<div class="content">
				<div class="container">

					<div class="row">
						<div class="col-md-7 col-lg-8">
							<div class="card">
								<div class="card-body">
								
									<!-- Checkout Form -->
									<form id ="paymentForm" action="payment-success" method="post">
										<input type="hidden" name="pre_num" value="${pre_num}">
										<input type="hidden" name="card_idx" value="0">
										<div class="payment-widget">
											<h4 class="card-title">결제</h4>
											
											<!-- Credit Card Payment -->
											<div class="payment-list">
												<label class="payment-radio credit-card-option">
													<input type="radio" name="radio" checked>
													<span class="checkmark"></span>
													카드결제
												</label>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group card-label">
															<label for="card_name">카드에 명시된 이름</label>
															<input class="form-control" id="card_name" name="card_name"  type="text" >
															
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group card-label">
															<label for="card_num">카드 번호</label>
															<input class="form-control" id="card_num" name="card_num"  placeholder="ex) 1234  5678  9876  5432" type="text">
														</div>
													</div>
													
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_month">카드 유효기간</label>
															<input class="form-control" id="card_month" name="card_month"  placeholder="월 ex) 10" type="text">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_year">카드 유효기간</label>
															<input class="form-control" id="card_year"  name="card_year" placeholder="년 ex) 24" type="text">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_month">만료일</label>
															<input class="form-control" id="card_month" name="cdata"  placeholder="ex) 2025" type="text">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_cvv">CVV</label>
															<input class="form-control" id="card_cvv"  name="card_cvv" placeholder="카드 뒷면 참고 ex) 654" type="text">
														</div>
													</div>
												</div>
											</div>
											<!-- /Credit Card Payment -->
											  
											<!-- Paypal Payment -->
											<!--
											<div class="payment-list">
												<label class="payment-radio paypal-option">
													<input type="radio" name="radio">
													<span class="checkmark"></span>
													Paypal
												</label>
											</div>
											-->
											<!-- /Paypal Payment -->
											
											<!-- Terms Accept -->
											<div class="terms-accept">
												<div class="custom-checkbox">
												   <input type="checkbox" id="terms_accept_1" name="terms_accept_1" >
												   <label for="terms_accept">결제 내용을 확인하였으며 <a href="#">위 내용에 </a><span>동의합니다.</span></label>
												</div>
											</div>
											<!-- /Terms Accept -->
											
											<!-- Submit Section -->
											<div class="submit-section mt-4">
												<button type="submit" id ="paybtn" class="btn btn-primary submit-btn">결제하기</button>
											</div>
											<!-- /Submit Section -->
											
										</div>
									</form>
									<!-- /Checkout Form -->
									
								</div>
							</div>
							
						</div>
						
						<div class="col-md-5 col-lg-4 theiaStickySidebar">
						
							<!-- Booking Summary -->
							<div class="card booking-card">
								<div class="card-header">
									<h4 class="card-title">결제 내역</h4>
								</div>
								<div class="card-body">
								
									<!-- Booking Doctor Info -->
									<div class="booking-doc-info">
										<a href="doctor-profile" class="booking-doc-img">
											<img src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-02.jpg" alt="User Image">
										</a>
										<div class="booking-info">
											<h4><a href="doctor-profile" name="d_name">${d_name}</a></h4>
											<div class="clinic-details">
												<p class="doc-location"> 피부전문의</p>
											</div>
										</div>
									</div>
									<!-- Booking Doctor Info -->
									
									<div class="booking-summary">
										<div class="booking-item-wrap">
											<ul class="booking-date">
												<li >진료일 <span>${doctorDTO.d_regdate}</span></li>
												<li>진료시작 시간 <span><%= time.format(nowTime)%></span></li>
												
											</ul>
											<ul class="booking-fee">
												<li>원격 화상 진료 <span>21,000 <span>원</span></span></li>
											</ul>
											<div class="booking-total">
												<ul class="booking-total-list">
													<li>
														<span>총 금액</span>
														<span class="total-cost">23,400 <span>원</span></span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Booking Summary -->
							
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
   
		   
		</div>
		<!-- /Main Wrapper -->
	  
		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="${pageContext.request.contextPath}/resources/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Custom JS -->
		<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
		
		


	
	</div>
</body>
</html>