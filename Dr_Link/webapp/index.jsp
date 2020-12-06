<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//response.sendRedirect(request.getContextPath()+"/login");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Dr.Link에 오신 것을 환영합니다</title>

<!-- Favicons -->
<link type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">

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

#header-wrapper{
	background-image: url("${pageContext.request.contextPath}/resorces/img/banner.jpg");
	background-size : cover;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu{ display: none; }
	.navbar .nav-item:hover .nav-link{ color: black;  }
	.navbar .nav-item:hover .dropdown-menu{ display: block; }
	.navbar .nav-item .dropdown-menu{ margin-top:0; }
}	

#drlink{
font-family: 'Major Mono Display', monospace; 
margin-right: 20px;
}

ul .bxslider{
width:auto !important;
}

#bxslider{
width:auto !important;
}

</style>

</head>
<body>

	<!-- Main Wrapper -->
<div class="main-wrapper">

	<!-- Header -->
	<header class="header">
		<nav class="navbar navbar-expand-lg header-nav">
			<div class="navbar-header">
				<a id="mobile_btn" href="javascript:void(0);">
					<span class="bar-icon">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</a>
				<h1><a id="drlink" href="#" >Dr.Link</a></h1>
			</div>
			<div class="main-menu-wrapper">
				<div class="menu-header">
					<a href="index" class="menu-logo">
						<img src="${pageContext.request.contextPath}/resources/img/logo.png" class="img-fluid" alt="Logo">
					</a>
					<a id="menu_close" class="menu-close" href="javascript:void(0);">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<ul class="main-nav" >
					<li class="active">
						<a href="index">Home</a>
					</li>
					<li class="has-submenu">
						<a href="">공지사항<!-- <i class="fas fa-chevron-down"></i> --></a>
						<!-- <ul class="submenu">
							<li><a href="doctor-dashboard">Doctor Dashboard</a></li>
							<li class="has-submenu">
								<a href="doctor-blog">Blog</a>
								<ul class="submenu">
									<li><a href="doctor-blog">Blog</a></li>
									<li><a href="blog-details">Blog view</a></li>
									<li><a href="doctor-add-blog">Add Blog</a></li>
								</ul>
							</li>
						</ul> -->
					</li>	
					<li class="has-submenu">
						<a href="">온라인예약</a>
					</li>
					<li class="has-submenu">
						<a href="">온라인 간편 진단<i class="fas fa-chevron-down"></i></a>
						<ul class="submenu">
							<li><a href="doctor/add-billing">AI진단</a></li>
							<!--  <li><a href="pharmacy-index">AI진단</a></li> -->
							<li><a href="pharmacy-details">설문진단</a></li>
						</ul>
					</li>
					<li class="has-submenu">
						<a href="">건강정보</a>
					</li>
					<li class="has-submenu">
						<a href="">마이페이지<i class="fas fa-chevron-down"></i></a>
						<ul class="submenu">
							<li><a href="invoices">결제내역</a></li>
						</ul>
					</li>
					
					<li class="login-link">
						<a href="${pageContext.request.contextPath}/login">로그인 / 회원가입</a>
					</li>
				</ul>		 
			</div>		 
			<ul class="nav header-navbar-rht">
				
				<li class="nav-item">
					<a class="nav-link header-login" href="${pageContext.request.contextPath}/login">로그인 / 회원가입</a>
				</li>
			</ul>
		</nav>
	</header>
	<!-- /Header -->
	
	<!-- Home Banner -->
	<section class="section section-search">
		<div class="container-fluid">
			<div class="banner-wrapper">
				<%-- <div id="header-wrapper" style="background-image: URL(${pageContext.request.contextPath}/${pageContext.request.contextPath}/resources/img/banner.jpg)"  >
					<div id="header" class="content-header">
					<div class="container-fluid">
					</div>
					</div>
				</div>   --%>     
			</div>
		</div>
	</section>
	<!-- /Home Banner -->

	<section class="section home-tile-section">
		<div class="container-fluid">
			<div class="section-header text-center">
				<h2>우리 병원 비전</h2>
			</div>
			<div class="row">
				<div class="col-md-9 m-auto">
					<div class="row">
						<div class="col-sm-3">
				<div class="position-relative">
				<img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resources/img/sub01.jpg" width="190" height="380" alt="" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="position-relative">
				<img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resources/img/sub02.jpg" width="190" height="380" alt="" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="position-relative">
				<img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resources/img/sub03.jpg" width="190" height="380" alt="" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="position-relative">
				<img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resources/img/sub04.jpg" width="190" height="380" alt="" />
				</div>
			</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	  
	<!-- Clinic and Specialities -->
	<section class="section section-specialities">
		<div class="container-fluid">
			<div class="section-header text-center">
				<h2>진료과목</h2>
				<p class="sub-title">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-9">
					<!-- Slider -->
					<div class="specialities-slider slider">
					
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${pageContext.request.contextPath}/resources/img/specialities/specialities-01.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>
							<p>Urology</p>
						</div>	
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${pageContext.request.contextPath}/resources/img/specialities/specialities-02.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>
							<p>Neurology</p>	
						</div>							
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${pageContext.request.contextPath}/resources/img/specialities/specialities-03.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>	
							<p>Orthopedic</p>	
						</div>							
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${pageContext.request.contextPath}/resources/img/specialities/specialities-04.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>	
							<p>Cardiologist</p>	
						</div>							
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${pageContext.request.contextPath}/resources/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>	
							<p>Dentist</p>
						</div>							
						<!-- /Slider Item -->
						
					</div>
					<!-- /Slider -->
					
				</div>
			</div>
		</div>   
	</section>	 
	<!-- Clinic and Specialities -->
  
	<!-- Popular Section -->
	<section class="section section-doctor">
		<div class="container-fluid">
		   <div class="row">
				<div class="col-lg-4">
					<div class="section-header ">
						<h2>온라인 예약</h2>
						<p>분당서울대학교병원은 빠르고 편리한 온라인진료예약이 가능합니다.</p>
					</div>
					<div class="about-content">
						<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>
						<p>web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes</p>					
						<a href="javascript:;">더보기</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="doctor-slider slider">
					
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-01.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Ruby Perrin</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MDS - Periodontology and Oral Implantology, BDS</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(35)</span>
								</div>
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
				
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-02.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Darren Elder</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">BDS, MDS - Oral & Maxillofacial Surgery</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(35)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
				
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-03.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Deborah Angel</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MBBS, MD - General Medicine, DNB - Cardiology</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(27)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
				
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-04.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Sofia Brient</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MBBS, MS - General Surgery, MCh - Urology</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(4)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
						
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-05.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Marvin Campbell</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MBBS, MD - Ophthalmology, DNB - Ophthalmology</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(66)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
						
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-06.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Katharine Berthold</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MS - Orthopaedics, MBBS, M.Ch - Orthopaedics</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(52)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
						
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-07.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Linda Tobin</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MBBS, MD - General Medicine, DM - Neurology</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(43)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
						
						<!-- Doctor Widget -->
						<div class="profile-widget">
							<div class="doc-img">
								<a href="doctor-profile">
									<img class="img-fluid" alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-08.jpg">
								</a>
								<a href="javascript:void(0)" class="fav-btn">
									<i class="far fa-bookmark"></i>
								</a>
							</div>
							<div class="pro-content">
								<h3 class="title">
									<a href="doctor-profile">Paul Richard</a> 
									<i class="fas fa-check-circle verified"></i>
								</h3>
								<p class="speciality">MBBS, MD - Dermatology , Venereology & Lepros</p>
								<div class="rating">
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star filled"></i>
									<i class="fas fa-star"></i>
									<span class="d-inline-block average-rating">(49)</span>
								</div>
								
								<div class="row row-sm">
									<div class="col-6">
										<a href="doctor-profile" class="btn view-btn">상세보기</a>
									</div>
									<div class="col-6">
										<a href="booking" class="btn book-btn">예약하기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- Doctor Widget -->
						
					</div>
				</div>
		   </div>
		</div>
	</section>
	<!-- /Popular Section -->
   
   
	
	<!-- Blog Section -->
   <section class="section section-blogs">
		<div class="container-fluid">
		
			<!-- Section Header -->
			<div class="section-header text-center">
				<h2>우리 병원 소식</h2>
				<p class="sub-title">병원에서 제공하는 다양한 정보를 통해 건강한 삶을 누리세요.</p>
			</div>
			<!-- /Section Header -->
			
			<div class="row blog-grid-row">
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/blog/blog-01.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/blog/blog-02.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/blog/blog-03.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/blog/blog-04.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
			</div>
			<div class="view-all text-center"> 
				<a href="blog-list" class="btn btn-primary">더보기</a>
			</div>
		</div>
	</section>
	<!-- /Blog Section -->			
	
	<!-- Footer -->
	<footer class="footer">
		
		<!-- Footer Top -->
		<div class="footer-top">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-about">
							<div class="footer-logo">
								<h1 id="drlink">Dr.Link</h1>
							</div>
							<div class="footer-about-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
								<div class="social-icon">
									<ul>
										<li>
											<a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-menu">
							<h2 class="footer-title">공지사항</h2>
							<h2 class="footer-title">온라인 예약</h2>
							<h2 class="footer-title">건강정보</h2>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-menu">
							<h2 class="footer-title">온라인 간편 진단</h2>
							<ul>
								<li><a href="${contextPath}pharmacy/pharmacy-index">AI진단</a></li>
								<li><a href="chat">설문 진단</a></li>
							</ul>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-contact">
								<h2 class="footer-title">Contact Us</h2>
								<div class="footer-contact-info">
									<div class="footer-address">
										<span><i class="fas fa-map-marker-alt"></i></span>
										<p> 3556  Beech Street, San Francisco,<br> California, CA 94108 </p>
									</div>
									<p>
										<i class="fas fa-phone-alt"></i>
										+1 315 369 5943
									</p>
									<p class="mb-0">
										<i class="fas fa-envelope"></i>
										doccure@example.com
									</p>
								</div>
								</div>
							</div>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
				</div>
			</div>
		</div>
		<!-- /Footer Top -->
		
		<!-- Footer Bottom -->
              <div class="footer-bottom" style="margin:5px !important; padding:10px !important;">
			<div class="container-fluid">
			
				<!-- Copyright -->
				<div class="copyright">
					<div class="row">
						<div class="col-md-7 col-lg-7">
							<div class="copyright-text">
								<p>
									서울 금천구 가산디지털2로 123 월드메르디앙2차 | 대표자 : 고현영 |
									<span style="color:red">응급의료센터</span> 02-2626-1114<br/>
									Copyright &copy; by Dr.Link All Rights Reserved.
								</p>
							</div>
						</div>
						
							<!-- /Copyright Menu -->
							
						</div>
					</div>
				</div>
				<!-- /Copyright -->
				
			</div>
		</div>
		<!-- /Footer Bottom -->
		
	</footer>
	<!-- /Footer -->
   
  </div>
  <!-- /Main Wrapper -->
 
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Slick JS -->
<script src="${pageContext.request.contextPath}/resources/js/slick.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
		
	</body>
</html>