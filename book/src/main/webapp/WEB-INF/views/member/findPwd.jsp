<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>비밀번호 초기화</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

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
						<li><a href="/member/login" ><span
								class="label">로그인</span></a></li>
						<li><a href="/member/join"><span
								class="label">회원가입</span></a></li>
								   </c:if>
								    <c:if test="${member != null }">   
                 
                    <c:if test="${member.admin_ck == 1 }">
						<li><a href="/admin/main"><span
								class="label">관리자페이지</span></a></li>
								    </c:if>    
						<li><a href="/member/mypage"  ><span
								class="label">마이페이지</span></a></li>
						
								<li><a href="/cart/myCartList"  ><span
								class="label">장바구니</span></a></li>
						<li><a id="logout_button" ><span
								class="label">로그아웃</span></a></li>
								   </c:if>  
					</ul>
				</header>

				<!-- Banner -->
			
		
				<section>
					<header class="major">
						<h2>비밀번호 변경</h2>
					</header>
					<div class="features">

						<article>
							
							<div class="content">
					
		 <form method="post" id="find_form"name="find_form">
														<div class="row gtr-uniform">
															<div class="col-12 col-4-xsmall">
<input type="text" class="form-control item" id="userid"name="userid" placeholder="아이디"  required>															</div>
															<div class="col-12 col-4-xsmall">
                <input type="email" class="form-control item"  disabled="disabled"id="email"name="email" placeholder="이메일"  required>
																<font id="checkEmail" size="2"></font>
															</div>
														
															</div>
															<br/>
														<div class="button_container"  >
																<button type="button" id="mailbutton" class="button primary"disabled="disabled"><span>인증번호 전송</span></button>
																 </div>
																 <br/>
																    <font class="time" size="2"></font>
   <div class="form-group">
   <input type="text" class="form-control item" disabled="disabled" id="code" name="code" placeholder="인증번호"  required>
                <font id="checkCode" size="2"></font>
                </div>
                <br/>
                <div class="button_container" >

  <button type="button" class="btn" disabled="disabled" id="find_button"><span>초기화</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
   
          </div>
															</form>
															 <div style="text-align:center;">
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
						 action="${contextPath}/books/searchBooks">
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
		$("#logout_button").click(function() {

			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					Swal.fire({
						position : 'center',
						icon : 'success',
						title : '로그아웃 되었습니다',
						showConfirmButton : false,
						timer : 1500,
						allowOutsideClick:false
					})
					setTimeout("document.location.reload();", 1800);

				}
			});
		});
		var code = ""; 
		$('#userid').on("propertychange change keyup paste input", function(){
			var userid=$('#userid').val();
					
			var data = {userid:userid}				
			
			$.ajax({
				type : "post",
				url : "/member/useridCheck",
				data : data,
				success : function(result){
					if(result == "fail"){
						
						  $("#email").attr("disabled", false);
					  }else{
						
						  $("#email").attr("disabled", true);
					  }
				  
					
				}
			}); 	

		});	
		$('#email').on("propertychange change keyup paste input", function(){
			var userid=$('#userid').val();
			var email = $('#email').val();			
			var data = {userid:userid, email: email}				
			
			$.ajax({
				type : "post",
				url : "/member/userEmailCheck",
				data : data,
				success : function(result){
					if(result == "fail"){
						  $("#checkEmail").html('값이 다릅니다');
						  $("#checkEmail").attr('color','red');
						  $("#mailbutton").attr("disabled", true);
					  }else{
						  $("#checkEmail").html('');
						  
						  $("#mailbutton").attr("disabled", false);
					  }
				  
					
				}
			}); 	

		});	
		$("#mailbutton").click(function(){
		    
		    var email = $('#email').val();	        // 입력한 이메일
		 

		        $.ajax({
		            
		            type:"GET",
		            url:"mailCheck?email=" + email,
		            success:function(data){
		            	 $("#code").attr("disabled", false);
		            	 code = data;
		            }
		                
		    });
		    
		});

		/* 인증번호 비교 */
		$("#code").on("propertychange change keyup paste input", function(){
		    
		    var inputCode = $("#code").val();           
		        
		    
		    if(inputCode != code){                            
		    	$("#checkCode").html('값이 다릅니다');
				  $("#checkCode").attr('color','red');
				  $("#find_button").attr("disabled", true);        
		    } else {                                            
		    	$("#checkCode").html('값이 일치합니다');
				  $("#checkCode").attr('color','green');
				  $("#find_button").attr("disabled", false);  
		    }    
		    
		});
		$("#find_button").click(function(){
			  $("#find_form").attr("action", "/member/pwdResetForm");
		    $("#find_form").submit();

		  
		});
		  

		var timer = null;
		var isRunning = false;
		$(function(){

			    $("#mailbutton").click(function(e){
		    	var display = $('.time');
		    	var leftSec = 300;
		    
		    	if (isRunning){
		    		clearInterval(timer);
		    		display.html("");
		    		startTimer(leftSec, display);
		    	}else{
		    	startTimer(leftSec, display);
		    		
		    	}
		    });
		})

		    
		function startTimer(count, display) {
		            
		    		var minutes, seconds;
		            timer = setInterval(function () {
		            minutes = parseInt(count / 60, 10);
		            seconds = parseInt(count % 60, 10);
		     
		            minutes = minutes < 10 ? "0" + minutes : minutes;
		            seconds = seconds < 10 ? "0" + seconds : seconds;
		     
		            display.html(minutes + ":" + seconds);
		      	 display.attr('color','red');	
		      
		            if (--count < 0) {
		    	     clearInterval(timer);
		    	     Swal.fire({
				    	  position: 'center',
				    	  icon: 'error',
				    	  title: '시간초과',
				    	  showConfirmButton: false,
				    	  timer: 1500
				    	})
		    	     display.html("시간초과");
		    	     $('#find_button').attr("disabled","disabled");
		    	     $('#code').attr("disabled","disabled");
		    	     isRunning = false;
		            }
		        }, 1000);
		             isRunning = true;
		}
	</script>
	<script type="text/javascript">
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

	    /* 로그인 버튼 클릭 메서드 */
	    $("#login_button").click(function(){
	    	  $("#login_form").attr("action", "/member/login.do");
	          $("#login_form").submit();
	     
	        
	    });
	</script>
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>