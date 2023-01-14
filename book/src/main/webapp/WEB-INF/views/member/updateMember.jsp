<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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
						<h2>회원정보수정</h2>
					</header>
					<div class="features">

						<article>
							
							<div class="content">
							<form method="post" id="update_form">
					<table>
			<tbody>
				<tr>
					<td class="fixed">아이디</td>
					<td class="active"><span >
					 <input type="text" id="userid"name="userid" value="${member.userid}" required readonly="readonly">
					</span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">비밀번호</td>
					<td class="active"><span >
				         <input type="text" value="${member.pwd}" id="pwd"name="pwd" ></span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">이름</td>
					<td class="active"><span >
				         <input type="text" value="${member.name}" id="name"name="name" ></span></td>
				</tr>
				<tr  class="dot_line">
					<td class="fixed">이메일</td>
					<td class="active"><input type="text" value="${member.email}" id="email"name="email" ></td>
				</tr>
					<tr  class="dot_line">
					<td class="fixed">전화번호</td>
					<td class="active"><input type="text" value="${member.phone}" id="phone"name="phone" ></td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed">우편번호</td>
					<td class="active"><input type="text" value="${member.addr1}" id="addr1"name="addr1" > </td>
					<td class="active"><button type="button" class="button primary" onclick="search_address()" >
											주소검색</button></td>
				</tr>

					<tr class="dot_line">
					<td class="fixed">주소</td>
					<td class="active"><input type="text" value="${member.addr2}" id="addr2"name="addr2" ></td>
				</tr>
					<tr class="dot_line">
					<td class="fixed">상세주소</td>
					<td class="active"><input type="text" value="${member.addr3}" id="addr3"name="addr3" ></td>
				</tr>
			
			</tbody>
		</table>
<div class="button_container" >
<button type="submit" id="update" class="btn" ><span>수정하기</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
  </form>
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
						<li><a href="/main">메인</a></li>
						<li><a href="/member/mypage">회원정보조회</a></li>
						<li><a href="/member/updateMember">회원정보수정</a></li>
<!-- 						<li><span class="opener">Submenu</span> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#">Lorem Dolor</a></li> -->
<!-- 								<li><a href="#">Ipsum Adipiscing</a></li> -->
<!-- 								<li><a href="#">Tempus Magna</a></li> -->
<!-- 								<li><a href="#">Feugiat Veroeros</a></li> -->
<!-- 							</ul></li> -->
						<li><a href="/member/mypage">Etiam Dolore</a></li>
						<li><a href="/member/deletePage">회원탈퇴</a></li>
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
	$(document).ready(function(){
		

		$("#update").click(function(){
			 var id = $('#userid').val();                 
		        var pw = $('#pwd').val();                
		               
		        var name = $('#name').val();            
		        var mail = $('#email').val();          
		        var addr = $('#addr1').val(); 
				
				  $("#update_form").attr("action", "/member/update");
					$("#update_form").submit();
					
					
			  return false;
		 
		});
	});
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