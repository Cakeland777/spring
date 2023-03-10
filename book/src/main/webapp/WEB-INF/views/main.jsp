<%@   page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

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
								   
                   <c:if test="${member!=null }">
                    <c:if test="${member.admin_ck == 1 }">
						<li><a href="/admin/main"><span
								class="label">관리자페이지</span></a></li>
								<li><a id="logout_button" ><span
								class="label">로그아웃</span></a></li>
								    </c:if> 
								     <c:if test="${member.admin_ck != 1  }">   
								      
						<li><a href="/member/mypage"  ><span
								class="label">마이페이지</span></a></li>
						
								<li><a href="/cart/myCartList"  ><span
								class="label">장바구니</span></a></li>
						<li><a id="logout_button" ><span
								class="label">로그아웃</span></a></li>
								   </c:if>  
								   </c:if>
					</ul>
				</header>

				<section>
				<c:if test="${member!=null }">
				<form id="chatForm" style="position: fixed; margin-top: 250px; margin-left:800px; z-index: 100;">
        <div class="chat_start_main">
           <img alt="" src="resources/image/chat_icon.png" style="width:100px;">
        </div>
        <div class="chat_main" style="display:none;">
            <div class="modal-header" style="height:20%;">
             <img alt="" src="resources/image/chat_icon.png" style="width:100px;">
            </div>
            <div class="modal-content" id="chat" style="height:60%;">
                
            </div>
            <div class="modal-footer">
                <input type="text" id="message" class="form-control" style="height:20%;" placeholder="메세지를 입력하세요"/>    
            </div>
        </div>
      
    </form>
    </c:if>
					<header class="major">
						<h2>베스트셀러</h2>
					</header>
					<c:set var="goods_count" value="0" />
					<div class="posts">
						<c:forEach var="item" items="${goodsMap.bestseller }">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<article>
								<div class="book">
									<a
										href="${contextPath}/books/booksDetail?goods_id=${item.goods_id }">


										<img width="121" height="154"
										src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</a>
									<div class="title">${item.goods_title }</div>
									<div class="price">
										<fmt:formatNumber value="${item.goods_price}" type="number"
											var="goods_price" />
										${goods_price}원
									</div>
								</div>
								<c:if test="${goods_count==15   }">
									<div class="book">
										<font size=20> <a href="/books/allBooks">more</a></font>
									</div>
								</c:if>
							</article>
						</c:forEach>
				</section>
				<section>
					<header class="major">
						<h2>새로 출판된 책들</h2>
					</header>
					<c:set var="goods_count" value="0" />
					<div class="posts">
						<c:forEach var="item" items="${goodsMap.newbook }">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<article>
								<div class="book">
									<a
										href="${contextPath}/books/booksDetail?goods_id=${item.goods_id }">


										<img width="121" height="154"
										src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</a>
									<div class="title">${item.goods_title }</div>
									<div class="price">
										<fmt:formatNumber value="${item.goods_price}" type="number"
											var="goods_price" />
										${goods_price}원
									</div>
								</div>
								<c:if test="${goods_count==15   }">
									<div class="book">
										<font size=20> <a href="#">more</a></font>
									</div>
								</c:if>
							</article>
						</c:forEach>
				</section>
				<section>
					<header class="major">
						<h2>스테디셀러</h2>
					</header>
					<c:set var="goods_count" value="0" />
					<div class="posts">
						<c:forEach var="item" items="${goodsMap.steadyseller }">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<article>
								<div class="book">
									<a
										href="${contextPath}/books/booksDetail?goods_id=${item.goods_id }">


										<img width="121" height="154"
										src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</a>
									<div class="title">${item.goods_title }</div>
									<div class="price">
										<fmt:formatNumber value="${item.goods_price}" type="number"
											var="goods_price" />
										${goods_price}원
									</div>
								</div>
								<c:if test="${goods_count==15   }">
									<div class="book">
										<font size=20> <a href="#">more</a></font>
									</div>
								</c:if>
							</article>
						</c:forEach>
				</section>

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
						<li><a href="/main">메인페이지</a></li>
						<li><a href="/books/allBooks">전체도서</a></li>
						 <c:if test="${member!=null }">
						<li><span class="opener">마이페이지</span>
							<ul>
								<li><a href="/member/mypage">회원정보조회</a></li>
								<li><a href="/member/updateMember">회원정보수정</a></li>
								<li><a href="/member/deletePage">회원탈퇴</a></li>
							</ul></li>
										
							</c:if>
							 <c:if test="${member.userid eq 'admin' }">
					
						<li><span class="opener">관리자페이지</span>
							<ul>
								<li><a href="/admin/userList">회원관리</a></li>
								<li><a href="/admin/bookList">상품관리</a></li>
								<li><a href="/admin/orderList">주문관리</a></li>
							</ul></li>
									
							</c:if>
					</ul>
		
				</nav>

	
				<section>
					<header class="major">
						<h2>문의사항</h2>
					</header>
					<p>문의사항이 있으신 분은 다음의 연락처로 연락주시기 바랍니다.</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">minishelll777@gmail.com</a></li>
						<li class="icon solid fa-phone">010-9898-9628</li>
						<li class="icon solid fa-home">서울특별시 종로구 혜화동<br />
							
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; 유진
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
						allowOutsideClick:false,
						timer : 1500
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
				data : {keyword : value},
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
		
		var socket = null;
		$(document).ready(function(){
			 
			      
		});
		    $(".chat_start_main").click(function(){
		    	 connectWS(); 
		        $(this).css("display","none");
		        $(".chat_main").css("display","inline");
		    })
		    $(".chat_main .modal-header").click(function(){
		    	 
		        $(".chat_start_main").css("display","inline");
		        $(".chat_main").css("display","none");
		    });
		 
		    function connectWS(){
		        var sock = new SockJS("/echo");
		            socket =sock;
		        sock.onopen = function() {
		               console.log('info: connection opened.');
		        };
		        sock.onmessage = function(e){

		            $("#chat").append(e.data + "<br/>");
		        }
		        sock.onclose = function(){
		            $("#chat").append("연결 종료");
		            
		        }
		        sock.onerror = function (err) {console.log('Errors : ' , err);};
		 
		        $("#chatForm").submit(function(event){
		            event.preventDefault();
		                sock.send($("#message").val());
		                $("#message").val('').focus();    
		        });
		    }

	</script>
<!-- 	<script src="resources/assets/js/jquery.min.js"></script> -->
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>

</body>
</html>