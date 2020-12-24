<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>결제 상세 내역 - Dr.Link</title>
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
		
	
	<!-- dr.link 폰트 설정 -->
	<!-- 구글폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">
	<style>
	#drlink{
		font-family: 'Major Mono Display', monospace; 
		margin-right: 20px;
		font-size: 2.25rem;
		
	}
	
	
	
	.footer-menu{
		color:#fff;
	}
	</style>
	
	
	
	</head>
	<body>

		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Invoice View</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Invoice View</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="invoice-content">
								<div class="invoice-item">
									<div class="row">
										<div class="col-md-6">
											<div class="invoice-logo">
												<h1><a id="drlink" href="#" >Dr.Link</a></h1>
											</div>
										</div>
										<div class="col-md-6">
											<p class="invoice-details">
												<strong>영수증 번호:</strong> #00124 <br>
												<strong>결제일:</strong> 2019년 10월 10일
											</p>
										</div>
									</div>
								</div>
								
								<!-- Invoice Item -->
								<div class="invoice-item">
									<div class="row">
										<div class="col-md-6">
											<div class="invoice-info">
												<strong class="customer-text">발행 기관</strong>
												<p class="invoice-details invoice-details-two">
													Dr.Link <br>
													금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차 410 호 <br>
													서울특별시, 대한민국 <br>
												</p>
											</div>
										</div>
										<div class="col-md-6">
											<div class="invoice-info invoice-info2">
												<strong class="customer-text">고객 정보</strong>
												<p class="invoice-details">
													환자이름 <br>
													환자주소 <br>
													주소 시이름, 주소 국가이름 <br>
												</p>
											</div>
										</div>
									</div>
								</div>
								<!-- /Invoice Item -->
								
								<!-- Invoice Item -->
								<div class="invoice-item">
									<div class="row">
										<div class="col-md-12">
											<div class="invoice-info">
												<strong class="customer-text">결제정보</strong>
												<p class="invoice-details invoice-details-two">
													신용카드 <br>
													XXXXXXXXXXXX-2541 <br>
													KB국민은행<br>
												</p>
											</div>
										</div>
									</div>
								</div>
								<!-- /Invoice Item -->
								
								<!-- Invoice Item -->
								<div class="invoice-item invoice-table-wrap">
									<div class="row">
										<div class="col-md-12">
											<div class="table-responsive">
												<table class="invoice-table table table-bordered">
													<thead>
														<tr>
															<th>처방의약품의 코드</th>
															<th>처방의약품의 명칭</th>
															<th class="text-center">1회 투약량</th>
															<th class="text-center">1일 투약횟수</th>
															<th class="text-center">총 투약일수</th>
															<th class="text-center">개당 가격</th>
															<th class="text-right">총 금액</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>22485100</td>
															<td>유시락스시럽</td>
															<td class="text-center">1</td>
															<td class="text-center">2</td>
															<td class="text-center">1</td>
															<td class="text-center">1,200 <span>원</span></td>
															<td class="text-right">2,400 <span>원</span></td>
														</tr>
														<tr>
															<td>10000001</td>
															<td>원격 화상 진료</td>
															<td class="text-center">1</td>
															<td class="text-center">1</td>
															<td class="text-center">1</td>
															<td class="text-center">21,000 <span>원</span></td>
															<td class="text-right">21,000 <span>원</span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-md-6 col-xl-4 ml-auto">
											<div class="table-responsive">
												<table class="invoice-table-two table">
													<tbody>
													<tr>
														<th>합 금액:</th>
														<td><span>23,400 <span>원</span></span></td>
													</tr>
													<tr>
														<th>보험적용:</th>
														<td><span>-10%</span></td>
													</tr>
													<tr>
														<th>최종금액:</th>
														<td><span>21,060<span>원</span></span></td>
													</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- /Invoice Item -->
								
								<!-- Invoice Information -->
								<div class="other-info">
									<h4>사용기간</h4>
									<p class="text-muted mb-0">교부일로부터 3일간 내에 약국에 제출하여야 합니다.</p>
								</div>
								<!-- /Invoice Information -->
								
							</div>
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
		
		<!-- Custom JS -->
		<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
		
	</body>
</html>