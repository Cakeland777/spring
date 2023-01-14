<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="/main" class="logo"><i class="bi bi-house-fill"></i></a>
					<ul class="icons">
						<c:if test="${member==null }">
							<li><a href="/member/login"><span class="label">로그인</span></a></li>
							<li><a href="/member/join"><span class="label">회원가입</span></a></li>
						</c:if>
						<c:if test="${member != null }">

							<c:if test="${member.admin_ck == 1 }">
								<li><a href="/admin/main"><span class="label">관리자페이지</span></a></li>
							</c:if>
							<li><a href="/member/mypage"><span class="label">마이페이지</span></a></li>

							<li><a href="/cart/myCartList"><span class="label">장바구니</span></a></li>
							<li><a id="logout_button"><span class="label">로그아웃</span></a></li>
						</c:if>
					</ul>
				</header>

				<!-- Banner -->


				<section>
					<header class="major">
						<h2>회원가입</h2>
					</header>
					<div class="features">

						<article>

							<div class="content">

								<form method="post" id="join_form" name="join_form">
									<div class="row gtr-uniform">
										<div class="col-12 col-4-xsmall">
											<input type="text" name="userid" id="userid"
												placeholder="아이디" required="required" />
												 <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span> 
										</div>
										 <font id="checkId" size="2"></font>
										<div class="col-12 col-4-xsmall">
											<input type="password" name="pwd" id="pwd" placeholder="비밀번호"
												required="required" />
										</div>
										<div class="col-12 col-4-xsmall">
											<input type="password" name="pwdck" id="pwdck"
												placeholder="비밀번호확인" required="required" />
												  <span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
                 <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
										</div>
										<div class="col-12 col-4-xsmall">
											<input type="text" name="name" id="name" placeholder="이름"
												required="required" />
										</div>
										<div class="col-12 col-4-xsmall">
											<input type="text" name="phone" id="phone" placeholder="전화번호"
												required="required" />
										</div>
										<div class="col-12 col-4-xsmall">
											<input type="email" name="email" id="email" placeholder="이메일"
												required="required" />
										</div>


										<div class="col-5col-4-xsmall" style="float: left;">
											<input type="text" style="width: 150px;"
												id="addr1" name="addr1"
												readonly="readonly" placeholder="주소1">
										</div>
										<div class="col-5 col-4-xsmall" style="float: left;">
										<button type="button" class="button primary" onclick="search_address()" >
											주소검색</button>
										</div>
										<div class="col-12 col-4-xsmall">
											<input type="text" class="form-control item" id="addr2"
												name="addr2" readonly="readonly" placeholder="주소2">
										</div>
										<div class="col-12 col-4-xsmall">
											<input type="text" class="form-control item" id="addr3"
												name="addr3" readonly="readonly" placeholder="주소3">
										</div>
									</div>
									<br />
									<div class="button_container" style="text-align: center;">
										<button type="submit" id="register"
											class="button primary large">가입하기</button>
										<button type="button" class="button primary large"
											onclick="location.href='/main'">취소</button>
									</div>
								</form>
								<div style="text-align: center;">
									<a href="findPage">아이디 찾기</a> | <a href="findPwd">비밀번호 찾기</a>
								</div>
							</div>
						</article>

					</div>
				</section>

				<!-- Section -->


			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form id="search_form" name="search_form" class="search_form"
						method="post" action="${contextPath}/books/searchBooks.do">
						<input onKeyUp="keywordSearch()" type="text" name="query"
							id="query" placeholder="Search" />
						<button class="search-btn" type="submit">
							<i class="fas fa-search"></i>
						</button>
						<div id="suggest">
							<div id="suggestList"></div>
						</div>

					</form>

				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="index.html">Homepage</a></li>
						<li><a href="generic.html">Generic</a></li>
						<li><a href="elements.html">Elements</a></li>
						<li><span class="opener">Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Etiam Dolore</a></li>
						<li><a href="#">Adipiscing</a></li>
						<li><span class="opener">Another Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Maximus Erat</a></li>
						<li><a href="#">Sapien Mauris</a></li>
						<li><a href="#">Amet Lacinia</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Ante interdum</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore aliquam.</p>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore aliquam.</p>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore aliquam.</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">More</a></li>
					</ul>
				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Get in touch</h2>
					</header>
					<p>Sed varius enim lorem ullamcorper dolore aliquam aenean
						ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
						sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
						tempus aliquam.</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">minishelll777@gmail.com</a></li>
						<li class="icon solid fa-phone">010-0000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
							Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script>
	var idCheck = false;           
	var idckCheck = false;         
	var pwCheck = false;            
	var pwckCheck = false;            
	var pwckcorCheck = false;        
	var nameCheck = false;            
	var mailCheck = false;           
	var mailnumCheck = false;      
	var addressCheck = false; 
	$(document).ready(function(){
		
		//회원가입 버튼
		$("#register").click(function(){
			 var id = $('#userid').val();                 // id 입력란
		        var pw = $('#pwd').val();                // 비밀번호 입력란
		        var pwck = $('#pwdck').val();            // 비밀번호 확인 입력란
		        var name = $('#name').val();            // 이름 입력란
		        var mail = $('#email').val();            // 이메일 입력란
		        var addr = $('#addr1').val(); 
			
			  if(pw == ""){
		            $('.final_pw_ck').css('display','block');
		            pwCheck = false;
		        }else{
		            $('.final_pw_ck').css('display', 'none');
		            pwCheck = true;
		        }
			  if(id== ""){
		         
		            idCheck = false;
		        }else{
		          
		            idCheck = true;
		        }
			
			  if(pwckcorCheck&&idckCheck&&idCheck){
				  $("#join_form").attr("action", "/member/join");
					$("#join_form").submit();
					  var email = $("#email").val();        				    
					    $.ajax({
					        
					        type:"GET",
					        url:"mail?email=" + email
					                
					    });
		        }   
			  
			  else{
				  Swal.fire(
						  '입력값을 확인해주세요',
						  '',
						  'error'
						)
				  
			  }
			  return false;
		 
		});
	});
	//아이디 중복검사
	$('#userid').on("propertychange change keyup paste input", function(){

		var userid = $('#userid').val();			
		var data = {userid : userid}				
		
		$.ajax({
			type : "post",
			url : "/member/useridCheck",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");	
					idckCheck = true;
					 
					
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
				
					idckCheck = false;
				}

				
			}// 
		}); 	

	});

	$('#pwdck').on("propertychange change keyup paste input", function(){
		 
	    var pw = $('#pwd').val();
	    var pwck = $('#pwdck').val();
	    $('.final_pwck_ck').css('display', 'none');
	 
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	    
	});       
	//주소검색
	function search_address(){
	 
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	 
	        
	        	                var addr = ''; // 주소 변수
	        	                var extraAddr = ''; // 참고항목 변수
	        	 
	        	          
	        	                if (data.userSelectedType === 'R') { 
	        	                    addr = data.roadAddress;
	        	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	        	                    addr = data.jibunAddress;
	        	                }
	        	 
	        	               
	        	                if(data.userSelectedType === 'R'){
	        	                   
	        	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        	                        extraAddr += data.bname;
	        	                    }
	        	           
	        	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	        	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        	                    }
	        	                  
	        	                    if(extraAddr !== ''){
	        	                        extraAddr = ' (' + extraAddr + ')';
	        	                    }
	        	                    
	        	                    addr += extraAddr;
	        	                
	        	                } else {
	        	                	  addr += ' ';
	        	                }
	        	 
	        	                $("#addr1").val(data.zonecode);
	        	               
	        	                $("#addr2").val(addr);
	        	                
	        	                // 커서를 상세주소 필드로 이동한다.
	        	                $("#addr3").attr("readonly",false);
	        	                $("#addr3").focus();       	     
	        }
	    }).open();     
	}
	

		var loopSearch = true;
		function keywordSearch() {
			if (loopSearch == false)
				return;
			var value = document.search_form.query.value;
			$.ajax({
				type : "get",
				async : true,
				url : "${contextPath}/books/keywordSearch.do",
				data : {
					keyword : value
				},
				success : function(data, textStatus) {
					var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다." + data);
				},
				complete : function(data, textStatus) {

				}
			});
		}

		function displayResult(jsonInfo) {
			var count = jsonInfo.keyword.length;
			if (count > 0) {
				var html = '';
				for ( var i in jsonInfo.keyword) {
					html += "<a href=\"javascript:select('"
							+ jsonInfo.keyword[i] + "')\">"
							+ jsonInfo.keyword[i] + "</a><br/>";
				}
				var listView = document.getElementById("suggestList");
				listView.innerHTML = html;
				show('suggest');
			} else {
				hide('suggest');
			}
		}
		$("#search").on("propertychange change keyup paste input", function() {

			var inputCode = $("#search").val();

			if (inputCode.length == 0) {
				hide('suggest');
			}

		});
		function select(selectedKeyword) {
			document.search_form.search.value = selectedKeyword;
			loopSearch = true;
			hide('suggest');
		}

		function show(elementId) {
			var element = document.getElementById(elementId);
			if (element) {
				element.style.display = 'block';
			}
		}

		function hide(elementId) {
			var element = document.getElementById(elementId);
			if (element) {
				element.style.display = 'none';
			}
		}

	 

	</script>
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>