<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>회원가입-Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="../resources/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="resources/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="resources/plugins/fontawesome/css/all.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="resources/css/style.css">
		
		<!-- 우편번호 API -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		
		<script>

		function execPostCode() {
			
			 new daum.Postcode({

		           oncomplete: function(data) {

		               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

		               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                   extraRoadAddr += data.bname;
		               }
		               // 건물명이 있고, 공동주택일 경우 추가한다.
		               if(data.buildingName !== '' && data.apartment === 'Y'){
		                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		               }
		               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		               if(extraRoadAddr !== ''){
		                   extraRoadAddr = ' (' + extraRoadAddr + ')';
		               }
		               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		               if(fullRoadAddr !== ''){
		                   fullRoadAddr += extraRoadAddr;
		               }

		               // 우편번호와 주소 정보를 해당 필드에 넣는다.

		               document.getElementById('p_zipcode').value = data.zonecode; //5자리 새우편번호 사용
		               document.getElementById('p_address1').value = fullRoadAddr;
		               document.getElementById('p_address2').focus();

		               console.log(data);

		           }

		       }).open();
			 
		};
		


		
/* 		$("#p_id").keyup(function() {
			$.ajax({
				url : "../patient/check_id",
				type : "POST",
				data : {
					id : $("#p_id").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#submit-btn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("사용가능한 아이디입니다.");
						$("#submit-btn").removeAttr("disabled");
					}
				},
			})
		}); */
		
		
		
		

/* 
		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#p_id").keyup(function() {
			// id = "id_reg" / name = "userId"
			var user_id = $('#p_id').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/idCheck.do?p_id='+ p_id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#id_check").text("사용중인 아이디입니다 :p");
							$("#id_check").css("color", "red");
							$("#submit-btn").attr("disabled", true);
						} else {
							
							if(idJ.test(user_id)){
								// 0 : 아이디 길이 / 문자열 검사
								$("#id_check").text("");
								$("#submit-btn").attr("disabled", false);
					
							} else if(user_id == ""){
								
								$('#id_check').text('아이디를 입력해주세요 :)');
								$('#id_check').css('color', 'red');
								$("#submit-btn").attr("disabled", true);				
								
							} else {
								
								$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
								$('#id_check').css('color', 'red');
								$("#submit-btn").attr("disabled", true);
							}
							
						}
					}, error : function() {
							console.log("실패");
					}
				});
			}); */
			
			$(function(){ 
			$("#p_id").keyup(function() {
				$.ajax({
					url : "check_id.do",
					type : "POST",
					data : {
						id : $("#p_id").val()
					},
					success : function(result) {
						if (result == 1) {
							$("#id_check").html("중복된 아이디가 있습니다.");
							$('#id_check').css('color', 'red');
							$("#submit-btn").attr("disabled", "disabled");
						} else {
							$("#id_check").html("");
							$("#submit-btn").removeAttr("disabled");
						}
					},
				})
			});
			});
			
			
			
			
			$(function(){ 
				//비밀번호 확인
				$('#p_pwd2').blur(function(){
				   if($('#p_pwd').val() != $('#p_pwd2').val()){
				    	if($('#p_pwd2').val()!=''){
							$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
							$('#pwd_check').css('color', 'red');
							$("#submit-btn").attr("disabled", true);
				    	    $('#p_pwd2').val('');
				         	$('#p_pwd2').focus();
				      	}
				   }else{
						$("#pwd_check").text("비밀번호가 일치합니다.");
						$('#pwd_check').css('color', 'green');
				   }
				});
				
				$('#p_pwd').blur(function(){
					   if($('#p_pwd').val() != $('#p_pwd2').val()){
					    	if($('#p_pwd2').val()!=''){
								$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
								$('#pwd_check').css('color', 'red');
								$("#submit-btn").attr("disabled", true);
					    	    $('#p_pwd2').val('');
					         	$('#p_pwd2').focus();
					      	}
					   }else{
							$("#pwd_check").text("비밀번호가 일치합니다.");
							$('#pwd_check').css('color', 'green');
					   }
					});
			}); 	
			
			
			$(function(){
				$("#submit-btn").hover(function(){
					if($("#p_name").val()=='' || $("#p_birth").val()=='' || $("#p_id").val()=='' || $("#p_pwd").val()=='' || $("#p_pwd2").val()=='' || $("#p_email1").val()=='' || $("#p_zipcode").val()=='' || $("#p_address1").val()=='' || $("#p_address2").val()=='' || $("#p_phone").val()==''){
						$("#submit-btn").attr("disabled", "disabled");
					}else{
						$("#submit-btn").removeAttr("disabled");
					}
				});
			}); 
		</script>
	
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

#oemail1{
	display: initial !important;
}

#oemail2{
	display: initial !important;
}

.form-control{
	display: flex !important;
}

.submit-section{
	text-align: -moz-right !important;
}

label{
	display: block !important;
}

</style>
			
			
			
	</head>
	<body class="account-page">
	<!-- Header -->
	<% if (request.getParameter("p_id") == null) { %>
   <%@include file ="tiles/header.jsp" %>
   <% } else { %>
   <%@include file ="tiles/loginHeader.jsp" %>
   <% } %>
	<!-- /Header -->
	
	
		<!-- user register -->
		<div class="container"></div>

			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					
					<div class="row">
						<!-- /Profile Sidebar -->
						<div class="col-md-7 col-lg-8 col-xl-9" style="margin:auto;">
							<div class="card">
								<div class="card-body">
									
									<!-- Profile Settings Form -->
									<form action="userInsert" name="userInsert" method="post" onsubmit="return checks()">
										<div class="row form-row">
											<div class="col-12 col-md-12">
												<div class="form-group">
													<div class="change-avatar">
														<div class="profile-img">
															<img src="resources/img/patients/patient.jpg" alt="User Image">
														</div>
														<div class="upload-img">
															<div class="change-photo-btn">
																<span><i class="fa fa-upload"></i> 사진 업로드</span>
																<input type="file" class="upload">
															</div>
															<small class="form-text text-muted">이미지 파일 형식 JPG, GIF, PNG. <br>최대 크기는 2MB</small>
														</div>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>이름<span class="text-danger">*</span></label>
													<input type="text" class="form-control" value="" name="p_name" id="p_name" maxlength="6">
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>생년월일<span class="text-danger">*</span></label>
													<input type="date" class="form-control datetimepicker" value="" name="p_birth" id="p_birth">
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
													<label>아이디<span class="text-danger">*</span></label>
													<input type="text" class="form-control" value="" maxlength="20" name="p_id" id="p_id" required />
													<div class="check_font" id="id_check"></div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>비밀번호<span class="text-danger">*</span></label>
													<input type="password" class="form-control" value="" maxlength="20" name="p_pwd" id="p_pwd" required />
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>비밀번호 확인<span class="text-danger">*</span></label>
													<input type="password" class="form-control" value="" maxlength="20" name="p_pwd2" id="p_pwd2" required />
													<div class="check_font" id="pwd_check"></div>
												</div>
											</div>
											<div class="col-12 form-horizontal">
												<div class="form-group">
													<label>이메일<span class="text-danger">*</span></label>
													<input id="p_email1" name="p_email1" class="form-control" size="40" value="" type="text" maxlength="50">
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>혈액형</label>
													<select class="form-control select" name="p_blood">
														<option value="" selected="selected">- 혈액형 선택 -</option>
														<option>A-</option>
														<option>A+</option>
														<option>B-</option>
														<option>B+</option>
														<option>AB-</option>
														<option>AB+</option>
														<option>O-</option>
														<option>O+</option>
													</select>
												</div>
											</div>
											<div class="col-12 ">
												<div class="form-inline">
												<label class="">우편번호<span class="text-danger">*</span></label>
													<input type="text" name="p_zipcode" id="p_zipcode" class="zipcode form-control" placeholder="우편번호" readonly>
													<input type="button" onclick="execPostCode()" id="zipcode_btn" class="form-control " value="우편번호 찾기">
												</div>
												<div class="form-group">
												<label>주소<span class="text-danger">*</span></label>
													<input type="text" id="p_address1" name="p_address1" class="addr1 form-control" size="40" placeholder="주소">
												</div>
												<div class="form-group">
												<label>상세주소<span class="text-danger">*</span></label>
													<input type="text" id="p_address2" name="p_address2" class="addr2 form-control" size="40" placeholder="상세주소">
												</div>
											</div>
											<div class="col-12">
												<div class="form-inline">
												<label class="">휴대전화<span class="text-danger">*</span></label>
												<input id="p_phone" name="p_phone" class="form-control" maxlength="11" size="40" value="" type="text" placeholder="'-' 없이 번호만 입력해주세요.">
												</div>
											</div>
												
											
										<div class="submit-section" style="margin-top:20px;">
											<button type="submit" class="btn btn-primary submit-btn" id="submit-btn">회원가입</button>
											<button type="reset" class="btn btn-primary submit-btn" >다시입력</button>
										</div>
										</div>
									</form>
									<!-- /Profile Settings Form -->
									
								</div>
							</div>
						</div>
						
					</div>

				</div>
			</div>
			<!-- /Page Content -->
   

	<!-- Footer -->
	<% if (request.getParameter("p_id") == null) { %>
   <%@include file ="tiles/footer.jsp" %>
   <% } else { %>
   <%@include file ="tiles/loginFooter.jsp" %>
   <% } %>
	<!-- /Footer -->
		   
	  
		<!-- jQuery -->
		<script src="resources/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="resources/js/popper.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="resources/js/script.js"></script>
		
	</body>
</html>