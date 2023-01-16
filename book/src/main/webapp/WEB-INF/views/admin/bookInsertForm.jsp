<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>상품등록</title>
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
						<h2>상품등록</h2>
					</header>
					<div class="features">

						<article>
							
							<div class="content">
					
									 <form action="${contextPath}/admin/addNewBook" method="post"  enctype="multipart/form-data">
          <div class="col-12 col-4-xsmall">
       제품분류
            <select name="goods_sort">
            	
						<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷
						<option value="디지털 기기">디지털 기기
					</select>
            </div>
            <br/>
          <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item" name="goods_title"id="goods_title" placeholder="제품이름"  required>
            </div>  <br/>
           <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_writer"name="goods_writer"placeholder="저자"  required>
            </div>  <br/>
               <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_publisher"name="goods_publisher" placeholder="출판사"  required>
            </div>  <br/>
              <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_price"name="goods_price" placeholder="제품정가">
            </div>  <br/>
              <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_sales_price"name="goods_sales_price"placeholder="제품판매가격">
            </div>  <br/>
            <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_point"name="goods_point"placeholder="제품구매포인트">
            </div>  <br/>
             <div class="col-12 col-4-xsmall">
             출판일
                <input type="date" class="form-control item"  id="goods_published_date"name="goods_published_date"placeholder="제품출판일">
            </div>  <br/>
             <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_total_page"name="goods_total_page"placeholder="페이지 수">
            </div>  <br/>
            <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_isbn"name="goods_isbn"placeholder="ISBN">
            </div>  <br/>
            <div class="col-12 col-4-xsmall">
                <input type="text" class="form-control item"  id="goods_delivery_price"name="goods_delivery_price"placeholder="배송비">
            </div>  <br/>
           <div class="col-12 col-4-xsmall">
           도착예정일
                <input type="date" class="form-control item"  id="goods_delivery_date"name="goods_delivery_date"placeholder="도착예정일">
            </div>  <br/>
            <div class="col-12 col-4-xsmall">
             제품종류
             <select name="goods_status">
				  <option value="bestseller"  >베스트셀러</option>
				  <option value="steadyseller" >스테디셀러</option>
				  <option value="newbook" selected >신간</option>
				  <option value="on_sale" >판매중</option>
				  <option value="buy_out" >품절</option>
				  <option value="out_of_print" >절판</option>
				</select>
             </div>  <br/>
          <div class="col-12 col-4-xsmall">
              책 목차
                <textarea  rows="8" cols="60" name="goods_contents_order"></textarea>
            </div>  <br/>
            <div class="col-12 col-4-xsmall">
              저자소개
                <textarea  rows="8" cols="60" name="goods_writer_intro"></textarea>
            </div>  <br/>
          <div class="col-12 col-4-xsmall">
              제품소개
                <textarea  rows="8" cols="60" name="goods_intro"></textarea>
            </div>  <br/>
           <div class="col-12 col-4-xsmall">
              출판사제품평가
                <textarea  rows="8" cols="60" name="goods_publisher_comment"></textarea>
            </div>  <br/>
        <div class="col-12 col-4-xsmall">
              추천사
                <textarea  rows="8" cols="60" name="goods_recommendation"></textarea>
            </div>  <br/>
             <input type="button"  style="float:right;" value="파일 추가" onClick="fn_addFile()"/>
            
             
             <br/>
             <div id="d_file">
				            </div>
				          <br/>    
<div class="button_container" >

  <button type="button"  id="register" class="btn" onClick="fn_add_new_goods(this.form)"><span>등록</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
          </div>
        </form>
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
	<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  
  
  function fn_add_new_goods(obj){
		 fileName = $('#f_main_image').val();
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
		 
	}
</script>  
	
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>