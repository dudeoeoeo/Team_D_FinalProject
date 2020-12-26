<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 		
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">MyPage</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">마이페이지</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						
						<!-- Profile Sidebar -->
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
							<div class="profile-sidebar">
								<div class="widget-profile pro-widget-content">
									<div class="profile-info-widget">
										<a href="#" class="booking-doc-img">
											<img src="${path}/resources/assets/patient/profileImg/${patient.p_photo}">
										</a>
										<div class="profile-det-info">
											<h3>${patient.p_name }</h3>
											<div class="patient-details">
												<h5><i class="fas fa-birthday-cake"></i> ${patient.birth}</h5>
												<h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> ${patient.profileAddress }</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li class="active">
												<a href="patient-dashboard">
													<i class="fas fa-columns"></i>
													<span>진료확인</span>
												</a>
											</li>
											<li>
												<a href="favourites">
													<i class="fas fa-bookmark"></i>
													<span>Favourites</span>
												</a>
											</li>
											<li>
												<a href="profile-settings">
													<i class="fas fa-user-cog"></i>
													<span>개인정보 수정</span>
												</a>
											</li>
											<li>
												<a href="${path}/logout">
													<i class="fas fa-sign-out-alt"></i>
													<span>로그아웃</span>
												</a>
											</li>
										</ul>
									</nav>
								</div>

							</div>
						</div>
						<!-- / Profile Sidebar -->
						
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body pt-0">
								
									<!-- Tab Menu -->
									<nav class="user-tabs mb-4">
										<ul class="nav nav-tabs nav-tabs-bottom nav-justified">
											<li class="nav-item">
												<a class="nav-link active" href="#pat_appointments" data-toggle="tab">예약내역</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#pat_prescriptions" data-toggle="tab">처방내역</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#pat_medical_records" data-toggle="tab"><span class="med-records">진료내역</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#pat_billing" data-toggle="tab">결제내역</a>
											</li>
										</ul>
									</nav>
									<!-- /Tab Menu -->
									
									<!-- Tab Content -->
									<div class="tab-content pt-0">
										
										<!-- Appointment Tab -->
										<div id="pat_appointments" class="tab-pane fade show active">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr class="text-center">
																	<th>담당의</th>
																	<th>진료일시</th>
																	<th>예약일자</th>
																	<th>상태</th>
																	<th>
																		<div class="table-action">
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> 출력
																			</a>
																		</div>
																	</th>
																</tr>
															</thead>
															<tbody>
																<!-- start for -->
																<tr class="text-center" >
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-10.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. Olga Barlow  <span>Dental</span></a>
																		</h2>
																	</td>
																	<td>5 Nov 2019 <span class="d-block text-info">5.00 PM</span></td>
																	<td>1 Nov 2019</td>
																	<td><span class="badge badge-pill bg-success-light">Confirm</span></td>
																</tr>
																<!-- / end for -->
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Appointment Tab -->
										
										<!-- Prescription Tab -->
										<div class="tab-pane fade" id="pat_prescriptions">
											<div class="card card-table mb-0">
												<div class="card-body">
												<c:choose>
											        <c:when test="${empty prescriptionRecord}">
											        <p style="margin:10px; padding:10px;">아직 정보가 입력되지 않았습니다.</p>
											        </c:when> 
													<c:otherwise>
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>처방일자 </th>
																	<th>처방전</th>									
																	<th>처방의사 </th>
																	<th></th>
																</tr>     
															</thead>
															<tbody>
															<c:forEach var="prescriptionRecord" items="${prescriptionRecord}" varStatus="status" >
															<tr>
																<td>${prescriptionRecord.prescription_date}</td>
																<td>처방전 1</td>
																<td>
																	<h2 class="table-avatar">
																		<a href="doctor-profile" class="avatar avatar-sm mr-2">
																			<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-01.jpg" alt="User Image">
																		</a>
																		<a href="doctor-profile">${prescriptionRecord.doctorDTO.d_name} <span>${prescriptionRecord.doctorDTO.departmentDTO.dep_name}</span></a>
																	</h2>
																</td>
																<td class="text-right">
																	<div class="table-action">
																		<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																			<i class="fas fa-print"></i> Print
																		</a>
																		<a href="detail_prescription?prescription_num=${prescriptionRecord.prescription_num}" class="btn btn-sm bg-info-light">
																			<i class="far fa-eye"></i> View
																		</a>
																	</div>
																</td>
																</tr>
																</c:forEach>
															</tbody>	
														</table>
													</div>
													</c:otherwise>
												</c:choose>	
												</div>
											</div>
										</div>
										<!-- /Prescription Tab -->
											
										<!-- Medical Records Tab -->
										<div id="pat_medical_records" class="tab-pane fade">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr class="text-center">
																	<th>진료과목</th>
																	<th>진료일 </th>
																	<th>진료기록</th>
																	<th>담당의</th>
																	<th></th>
																</tr>     
															</thead>
															<tbody>
															<!-- start for -->
																<tr class="text-center">
																	<td><a href="javascript:void(0);">정신과</a></td>
																	<td>2020-10-31</td>
																	<td><a href="#">20201031_김환자.pdf</a></td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-01.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">김다유 <span>정신과</span></a>
																		</h2>
																	</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
															<!--  end for -->
															</tbody>  	
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Medical Records Tab -->
										
										<!-- Billing Tab -->
										<div id="pat_billing" class="tab-pane fade">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>결제번호</th>
																	<th>담당의사</th>
																	<th>금액</th>
																	<th>결제날짜</th>
																	<th></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>
																		<a href="invoice-view">#11111</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-01.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">김성민 <span>정신과</span></a>
																		</h2>
																	</td>
																	<td>25,000원</td>
																	<td>2020-11-30</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#11122</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-02.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">김성민 <span>정신과</span></a>
																		</h2>
																	</td>
																	<td>15,000원</td>
																	<td>2020-11-14</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#22222</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-03.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">이석 <span>피부과</span></a>
																		</h2>
																	</td>
																	<td>35,000원</td>
																	<td>2020-10-30</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#33333</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-04.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">이석 <span>피부과</span></a>
																		</h2>
																	</td>
																	<td>23,500원</td>
																	<td>2020-09-19</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#INV-0006</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-05.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. Marvin Campbell <span>Ophthalmology</span></a>
																		</h2>
																	</td>
																	<td>$600</td>
																	<td>10 Nov 2019</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#INV-0005</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-06.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. Katharine Berthold <span>Orthopaedics</span></a>
																		</h2>
																	</td>
																	<td>$200</td>
																	<td>9 Nov 2019</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#INV-0004</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-07.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. Linda Tobin <span>Neurology</span></a>
																		</h2>
																	</td>
																	<td>$100</td>
																	<td>8 Nov 2019</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#INV-0003</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-08.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. Paul Richard <span>Dermatology</span></a>
																		</h2>
																	</td>
																	<td>$250</td>
																	<td>7 Nov 2019</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#INV-0002</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-09.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. John Gibbs <span>Dental</span></a>
																		</h2>
																	</td>
																	<td>$175</td>
																	<td>6 Nov 2019</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<a href="invoice-view">#INV-0001</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a href="doctor-profile" class="avatar avatar-sm mr-2">
																				<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-10.jpg" alt="User Image">
																			</a>
																			<a href="doctor-profile">Dr. Olga Barlow <span>#0010</span></a>
																		</h2>
																	</td>
																	<td>$550</td>
																	<td>5 Nov 2019</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href="invoice-view" class="btn btn-sm bg-info-light">
																				<i class="far fa-eye"></i> View
																			</a>
																			<a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
																				<i class="fas fa-print"></i> Print
																			</a>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Billing Tab -->
										
									</div>
									<!-- Tab Content -->
									
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->