<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>처방전 작성-Dr.Link</title>
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
		
		<!-- 약품검색 -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />


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
	
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					
					<div class="row">
						<div class="col-md-8 offset-md-2">
							<!-- Login Tab Content -->
							<div class="account-content">
								<div class="card" style="margin:1.5rem !important;">
								<div class="card-header text-center" style="border-bottom:0px !important; margin-top:10px !important;">
									<h4>📃처방전📃</h4>
								</div>
								<form id="prescription_form" method="post">
									<div class="card-body">
									<!-- 환자명 진료과목 처방시간 의사명 약품번호 결제여부 -->
									<div class="row">
										<div class="col-sm-6">
											<div class="biller-info">
												<h4 class="d-block">${patientinfo.p_name} 님</h4>
												<span class="d-block text-sm text-muted">${doctorinfo.departmentDTO.dep_name} 진료</span>
											</div>
										</div>
										<div class="col-sm-6 text-sm-right">
											<div class="billing-info">
												<h4 class="d-block"><%= date.format(nowTime) %></h4>
												<input type="hidden" name="prescription_date" value="<%= date.format(nowTime)%>"/>
												<input type="hidden" name="prescription_date" value="<%= time.format(nowTime)%>"/>
												<input type="hidden" name="patient_num" value="${patientinfo.patient_num}"/>
												<input type="hidden" name="doctor_num" value="${doctorinfo.doctor_num}"/>
												<input type="hidden" name="dep_num" value="${doctorinfo.departmentDTO.dep_num}"/>
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
																	<td><%= date.format(nowTime) %>
																	<span class="d-block text-info"><%= time.format(nowTime) %></span></td>
																	<td>제 <span> 15489 </span> 호</td>
																	<td>${patientinfo.p_name}</td>
																	<td class="text-left">
																		<h2 class="table-avatar">
																			<a href="doctor-profile">${doctorinfo.d_name}<span>${doctorinfo.departmentDTO.dep_name}</span></a>
																		</h2>
																	</td>
																	<td>${doctorinfo.d_licence}</td>
																	<td>3415-4</td>
																</tr>
															</tbody>
														</table>
														<table class="table table-hover table-center mb-0 text-center">
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
																	<td><Strong style="text-decoration:underline; color:#003669;">${doctorinfo.d_name}</Strong></td>
																</tr>
															</tbody>
														</table>
													</div>
													
													<!-- Add Item -->
													<div class="add-more text-right">
														<a href="javascript:void(0);" class="add-prescription"><i class="fa fa-plus-circle"></i> 추가하기</a>
													</div>
													
													<!-- /Add Item -->
													
													<!-- Prescription Item -->
									
									<div class="card card-table">
										<div class="card-body">
											<div class="table-responsive">
											 <input type="hidden" id="medicine_num" name="medicine_num"/>
												<table class="table table-hover table-center text-center">
												<thead>
													<tr>
														<th style="width: 200px">약품명</th>
														<th style="width: 100px">투여량</th>
														<th style="width: 100px">횟수</th>
														<th style="width: 100px;">일수</th>
														<th style="width: 80px;"></th>
													</tr>
												</thead>
												<tbody class="prescription-info">
													<tr class="prescription-cont">
														<td>
															<select name="medicine_num" class="form-control select2" id="select2"> 
															<c:forEach var="medi" items="${medicine_info}">
																<option value="${medi.medicine_num}">${medi.medicine_name}</option>
															</c:forEach>
															</select>
														</td>
														<td>
															<input class="form-control" value="" type="text" name="dosage">
														</td>
														<td>
															<input class="form-control" value="" type="text" name="quantity">
														</td>
														<td>
															<input class="form-control" value="" type="text" name="taking_date">
														</td>
														<td>
														</td>
													</tr>
												</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- /Prescription Item -->
													
											<div class="text-center" style="margin:10px !important;">		<!--  formaction="end_prescription"-->
												<button type="submit" class="btn btn-info submit-btn send_btn"  formaction="end_prescription">입력 완료</button>
												<button type="submit" class="btn btn-info submit-btn" formaction="#">취소</button>
											</div>	
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>		
			<!-- /Page Content -->
	  
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
<!-- Select2 JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.js" ></script>
<!-- Profile Settings JS -->
<script src="${pageContext.request.contextPath}/resources/js/profile-settings.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>


<!-- 한글처리 -->
<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
<script>
$(function(){
	
			
	 $(".prescription-info").on('click','.trash', function () {
			$(this).closest('.prescription-cont').remove();
			 return false; 
	    });
	$(".add-prescription").on('click', function () {

		$(".prescription-info").append('<tr class="prescription-cont">'+
	   			'<td>'+
	   			'<select class="form-control select2">'+ 
				'<c:forEach var="medi" items="${medicine_info}">'+
				'<option value="${medi.medicine_num}">${medi.medicine_name}</option>'+	
				'</c:forEach>'+
				'</select>'+
				'</td>'+
				'<td>'+
				'<input class="form-control" value="" type="text" name="dosage">'+
				'</td>'+
				'<td>'+
				'<input class="form-control" value="" type="text" name="quantity">'+
				'</td>'+
				'<td>'+
				'<input class="form-control" value="" type="text" name="taking_date">'+
				'</td>'+
				'<td>'+					
				'<a href="#" class="btn bg-danger-light trash">'+
				'<i class="far fa-trash-alt">'+'</i>'+
				'</a>'+
				'</td>'+
				'</tr>');
	       		$('select.select2').last().select2();
	       		$('select.select2').on('change', function() {
	    			var data = $(".select2 option:selected").val();
	    		    $("input#medicine_num").val(data);
	    		    alert('약품번호 '+data);
	    	    })
			 return false;
		   }); // click
		   
		$(".select2").select2();
		   
		$('.select2').on('change', function() {
			var data = $(".select2 option:selected").val();
		    $("input#medicine_num").val(data);
		    alert('약품번호 '+data);
	    })
	    
	    /* 
 		$('.select2').change(function(){
            var o=document.getElementById('select2').getElementsByTagName('option');
            var all="";
            for(var i=0;i<o.length;i++){
                if(o[i].selected){
                    all+=o[i].value+",";
                }   
            }
		    alert(all);
 		}); */
		   
		/*var pk_num = []
		$('.send_btn').click(function(){
			$("span.select2-selection").each(function(idx){
				for(var i=0; i<$('select.select2 option').length; i++) {
					if($('select.select2:eq(idx) option:eq(i)').val() == $(this).text()) {
						pk_num.push(i);
						alert("현재 i: " + i) 
					}
				}			
			}) // each
		}) // click */
});



		</script>
	</body>
</html>