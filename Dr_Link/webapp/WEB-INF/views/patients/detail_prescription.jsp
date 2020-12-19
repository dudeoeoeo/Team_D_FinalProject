<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>처방전 상세보기-Dr.Link</title>
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
	
	</head>
	<body>

		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<h2 class="breadcrumb-title">처방전 상세보기</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<!-- Profile Widget -->
							<div class="card widget-profile pat-widget-profile">
								<div class="card-body">
								
								
									<div class="pro-widget-content">
										<div class="profile-info-widget">
											<a href="#" class="booking-doc-img">
												<img src="${pageContext.request.contextPath}/resources/img/patients/patient.jpg" alt="User Image">
											</a>
											<div class="profile-det-info">
												<h3><a href="patient-profile">Richard Wilson</a></h3>
												<div class="patient-details">
													<h5><b>Patient ID :</b> PT00${prescription.patient_num}</h5>
												</div>
											</div>
										</div>
									</div>
									<div class="patient-info">
										<ul>
											<li>Phone <span>+1 952 001 8563</span></li>
											<li>Age <span>38 Years, Male</span></li>
											<li>Blood Group <span>AB+</span></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /Profile Widget -->
							
						</div>
					
						<div class="col-md-7 col-lg-8 col-xl-9">
							<!-- Login Tab Content -->
							<div class="account-content">
								<div class="card" style="margin:1.5rem !important;">
								<div class="card-header text-center" style="border-bottom:0px !important; margin-top:10px !important;">
									<h4>📃처방전📃</h4>
								</div>
									<div class="card-body">
									
									<div class="row">
										<div class="col-sm-6">
											<div class="biller-info">
												<h4 class="d-block"><%-- ${prescription.patientDTO.p_name} --%> 님</h4>
												<span class="d-block text-sm text-muted">'진료과목' 진료</span>
											</div>
										</div>
										<div class="col-sm-6 text-sm-right">
											<div class="billing-info">
												<h4 class="d-block">${prescription.prescription_date}</h4>
											</div>
										</div>
									</div>
									
										<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>교부 일자</th>
																	<th>교부 번호</th>
																	<th>환자 성명</th>
																	<th>처방 의료인의 성명</th>
																	<th>면허 증빙</th>
																	<th>면허 번호</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>시간<span class="d-block text-info">시간</span></td>
																	<td>제 <span> 15prescription_num </span> 호</td>
																	<td>환자명</td>
																	<td class="text-left">
																		<h2 class="table-avatar">
																			<a href="doctor-profile">의사명</a>
																		</h2>
																	</td>
																	<td>전문의</td>
																	<td>3415-4</td>
																</tr>
															</tbody>
														</table>
														<table  class="table table-hover table-center mb-0 text-center">
														<thead>
																<tr>
																	<th>병원 이름</th>
																	<th>전화 번호</th>
																	<th>팩스 번호</th>
																	<th>의사 서명</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>${drLinkinfo.dl_name}</td>
																	<td>${drLinkinfo.dl_tel}</td>
																	<td>${drLinkinfo.dl_faxtel}</td>
																	<td>김** 서명 사진 들어갈 예정</td>
																</tr>
															</tbody>
														</table>
													</div>
													
													
													
													<!-- Prescription Item -->
									<div class="card card-table">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-hover table-center">
												<thead>
													<tr>
														<th style="width: 200px">약품명</th>
														<th style="width: 100px">투여량</th>
														<th style="width: 100px">횟수</th>
														<th style="width: 100px;">일수</th>
													</tr>
												</thead>
												<tbody>
												<c:set var="len" value="${fn:length(prescription.medicine_num)}"/> 
												<c:forEach begin="0" end="${len-1}" varStatus="status">
													<tr>
														<td>
															<input class="form-control" value="${prescription.medicine_num[status.index]}" type="text" readonly="readonly">
														</td>
														<td>
															<input class="form-control" value="${prescription.dosage[status.index]}" type="text" readonly="readonly">
														</td>
														<td>
															<input class="form-control" value="${prescription.quantity[status.index]}" type="text" readonly="readonly">
														</td>
														<td>
															<input class="form-control" value="${prescription.taking_date[status.index]}" type="text" readonly="readonly">
														</td>
													</tr>
												</c:forEach> 
												</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- /Prescription Item -->
													
												<div class="text-center" style="margin:10px !important;">		
											<button type="submit" class="btn btn-info submit-btn" formaction="#">메인으로</button>
											</div>
									</div>
								</div>
								
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
		
		<!-- Sticky Sidebar JS -->
        <script src="${pageContext.request.contextPath}/resources/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Custom JS -->
		<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
		
	</body>
</html>