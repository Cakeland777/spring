<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="orderer_hp" value="" />
<c:set var="final_total_order_price" value="0" />
<c:set var="total_order_price" value="0" />
<c:set var="total_order_goods_qty" value="0" />
<c:set var="total_discount_price" value="0" />
<c:set var="total_delivery_price" value="0" />

<!DOCTYPE HTML>
<html>
<head>
<title>주문페이지</title>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}

/*tab css*/
.tab{float:left; width:750px; height:500px;}
.tabnav{font-size:0; width:850px; border:1px solid #ddd;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#f56a6a;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#f56a6a; }
.tabcontent{padding: 20px;width:850px;  height:1500px ; border:1px solid #ddd; border-top:none;}
</style>
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

				<section>
					<header class="major">
						<h2>주문</h2>
					</header>
					<form id= "form_order" name="form_order" method="post">
						<table class="list_view">
							<tbody align=center>
								<tr style="background: #f56a6a; color: white;">
									<td colspan=2 class="fixed">주문상품명</td>
									<td>수량</td>
									<td>주문금액</td>
									<td>배송비</td>
									<td>예상적립금</td>
									<td>주문금액합계</td>
								</tr>
								<tr>
									<c:forEach var="item" items="${myOrderList }">
										<td class="goods_image"><a
											href="${contextPath}/books/booksDetail.do?goods_id=${item.goods_id }">
												<img width="75" alt=""
												src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
												<input type="hidden" id="goods_id" name="goods_id"
												value="${item.goods_id }" /> <input type="hidden"
												id="goods_fileName" name="goods_fileName"
												value="${item.goods_fileName }" />
										</a></td>
										<td>
											<h2>
												<a
													href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
												<input type="hidden" id="goods_title" name="goods_title"
													value="${item.goods_title }" />
											</h2>
										</td>
										<td>
											<h2>${item.order_goods_qty }개<h2>
													<input type="hidden" id="order_goods_qty"
														name="order_goods_qty" value="${item.order_goods_qty}" />
										</td>
										<td><h2>${item.goods_sales_price}원(10% 할인)</h2></td>
										<td><h2>0원</h2></td>
										<td><h2>${1500 *item.order_goods_qty}원</h2></td>
										<td>
											<h2>${item.goods_sales_price * item.order_goods_qty}원</h2> <input
											type="hidden" id="goods_sales_price"
											name="goods_sales_price"
											value="${item.goods_sales_price * item.order_goods_qty}" />
										</td>
								</tr>
								<c:set var="final_total_order_price"
									value="${final_total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
								<c:set var="total_order_price"
									value="${total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
								<c:set var="total_order_goods_qty"
									value="${total_order_goods_qty+item.order_goods_qty }" />
								</c:forEach>
							</tbody>
						</table>
						<div id="container" class="tab">
		<ul class="tabnav">
<!-- 			<li><a href="#tab01">주문상품</a></li> -->
			<li><a href="#tab02">배송지정보</a></li>
			<li><a href="#tab03">할인정보</a></li>
			<li><a href="#tab04">결제정보</a></li>

		</ul>
		<div class="tabcontent">
<!-- 			<div class="tab_content" id="tab01"> -->
			
						
						<div class="clear"></div>

						<br> <br>
						<div class="tab_content" id="tab02">
						<H2>배송지 정보</H2>
						<DIV class="detail_table">

							<table>
								<tbody>
									<tr class="dot_line">
										<td class="fixed_join">배송방법</td>
										<td><input type="radio" id="delivery_method1" name="delivery_method" value="일반택배"  checked> 
										<label for="delivery_method1">일반택배</label> 
										<input type="radio" id="delivery_method2" name="delivery_method" value="편의점택배"  > 
										<label for="delivery_method2">편의점택배</label> 
										<input type="radio" id="delivery_method3" name="delivery_method" value="해외배송"  > 
										<label for="delivery_method3">해외배송</label> 
											</td>
									</tr>
									<tr class="dot_line">
										<td class="fixed_join">배송지</td>
										<td><input type="radio" name="delivery_place" id="delivery_place1"
											onClick="restore_all()" value="기본배송지" checked>
											<label for="delivery_place1">기본배송지</label> 
											&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place" id="delivery_place2"
											value="새로입력" onClick="reset_all()"><label for="delivery_place2">새로입력</label>
											&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place" id="delivery_place3"
											value="최근배송지"><label for="delivery_place3">최근배송지</label>  &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr class="dot_line">
										<td class="fixed_join">받으실 분</td>
										<td><input id="receiver_name" name="receiver_name"
											type="text" size="40" value="${orderer.name }" /></td>
									</tr>
									<tr class="dot_line">
										<td class="fixed_join">휴대폰번호</td>
										<td><input size="10px" type="text" id="receiver_phone" name="receiver_phone" value="${orderer.phone}"> </td>
										
										<c:set var="orderer_hp" value="${orderer.phone}" />
									</tr>
									<tr class="dot_line">
										<td class="fixed_join">주소</td>
										
										<td><input size="10px" type="text" id="addr1" name="addr1" value="${orderer.addr1}"> </td>
										<c:set var="addr1" value="${orderer.addr1}" />
										<td><button type="button" class="button primary small" onclick="search_address()" >
											주소검색</button></td>
										</td>
										</tr>
										<tr class="dot_line">
										<td class="fixed_join"></td>
										<td><input size="10px" type="text" id="addr2" name="addr2" value="${orderer.addr2}"> </td>
									
										<c:set var="orderer_addr2" value="${orderer.addr2}" />
									
										</tr>
										<tr class="dot_line">
										<td class="fixed_join"></td>
										<td><input size="10px" type="text" id="addr3" name="addr3" value="${orderer.addr3}"> </td>
										 
										<c:set var="orderer_addr3" value="${orderer.addr3}" />
										</td>
									</tr>
									<tr class="dot_line">
										<td class="fixed_join">배송메시지</td>
										<td><input id="delivery_message" name="delivery_message"
											type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." />
										</td>
									</tr>
									<tr class="dot_line">
										<td class="fixed_join">선물 포장</td>
										<td><input type="radio" id="gift_wrapping1"
											name="gift_wrapping" value="yes"><label for="gift_wrapping1">네</label> &nbsp;&nbsp;&nbsp;
											<input type="radio" id="gift_wrapping2" name="gift_wrapping"
											checked value="no"><label for="gift_wrapping2">아니오</label></td>
										</td>
										</tboby>
							</table>
						</div>
						<div>
							
							<h3>주문고객</h3>
							<input type="text"  id="member_id" name="member_id" value="${orderer.userid}" size="15" />
							<table>
								<tbody>
									<tr class="dot_line">
									
										<td><h4>이름</h4></td>
										<td><input type="text" id="orderer_name" name="orderer_name" value="${orderer.name}" size="15" />
										</td>
									</tr>
									<tr class="dot_line">
										<td><h4>핸드폰</h4></td>
										<td><input type="text" id="orderer_hp"name="orderer_hp"value="${orderer.phone}" size="15" />
										</td>
									</tr>
									<tr class="dot_line">
										<td><h4>이메일</h4></td>
										<td><input type="text" value="${orderer.email}" size="15" />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="clear"></div>
					
<div class="tab_content" id="tab03">
						<H2>할인 정보</H2>
						<div class="detail_table">
							<table>
								<tbody>
									<tr class="dot_line">
										<td width=100>적립금</td>
										<td><input name="discount_juklip" type="text" size="10" />원/1000원
											&nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두 사용하기</td>
									</tr>
									<tr class="dot_line">
										<td>예치금</td>
										<td><input name="discount_yechi" type="text" size="10" />원/1000원
											&nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두 사용하기</td>
									</tr>
									<tr class="dot_line">
										<td>상품권 전환금</td>
										<td cellpadding="5"><input name="discount_sangpum"
											type="text" size="10" />원/0원 &nbsp;&nbsp;&nbsp; <input
											type="checkbox" /> 모두 사용하기</td>
									</tr>
									<tr class="dot_line">
										<td>OK 캐쉬백 포인트</td>
										<td cellpadding="5"><input name="discount_okcashbag"
											type="text" size="10" />원/0원 &nbsp;&nbsp;&nbsp; <input
											type="checkbox" /> 모두 사용하기</td>
									</tr>
									<tr class="dot_line">
										<td>쿠폰할인</td>
										<td cellpadding="5"><input name="discount_coupon"
											type="text" size="10" />원/0원 &nbsp;&nbsp;&nbsp; <input
											type="checkbox" /> 모두 사용하기</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="clear"></div>

						<br>
						<table width=80% class="list_view" style="background: mistyrose;">
							<tbody>
								<tr align=center class="fixed">
									<td class="fixed">총 상품수</td>
									<td>총 상품금액</td>
									<td></td>
									<td>총 배송비</td>
									<td></td>
									<td>총 할인 금액</td>
									<td></td>
									<td>최종 결제금액</td>
								</tr>
								<tr cellpadding=40 align=center>
									<td id="">
										<p id="p_totalNum">${total_order_goods_qty}개</p> <input
										id="h_total_order_goods_qty" type="hidden"
										value="${total_order_goods_qty}" />
									</td>
									<td>
										<p id="p_totalPrice">${total_order_price}원</p> <input
										id="h_totalPrice" type="hidden" value="${total_order_price}" />
									</td>
									<td><IMG width="25" alt=""
										src="${pageContext.request.contextPath}/resources/image/plus.jpg"></td>
									<td>
										<p id="p_totalDelivery">${total_delivery_price }원</p> <input
										id="h_totalDelivery" type="hidden"
										value="${total_delivery_price}" />
									</td>
									<td><img width="25" alt=""
										src="${pageContext.request.contextPath}/resources/image/minus.jpg"></td>
									<td>
										<p id="p_totalSalesPrice">${total_discount_price }원</p> <input
										id="h_total_sales_price" type="hidden"
										value="${total_discount_price}" />
									</td>
									<td><img width="25" alt=""
										src="${pageContext.request.contextPath}/resources/image/equal.jpg"></td>
									<td>
										<p id="p_final_totalPrice">
											<font size="15">${final_total_order_price }원 </font>
										</p> <input id="h_final_total_Price" type="hidden"
										value="${final_total_order_price}" />
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="clear"></div>
						
						<div class="tab_content" id="tab04">
						<h2>결제정보</h2>
						<div class="detail_table">
							<table>
								<tbody>
									<tr>
										<td><input type="radio" id="pay_method1" name="pay_method"
											value="신용카드" onClick="fn_pay_card()" checked>
											<label for="pay_method1" >신용카드</label> </td>
									</tr>
									<tr>
										<td><input type="radio" id="pay_method2" name="pay_method"
											value="휴대폰결제" onClick="fn_pay_phone()"><label for="pay_method2" >휴대폰결제</label></td>
									</tr>
									<tr>
										<td><input type="radio" id="pay_method3" name="pay_method"
											value="무통장입금"><label for="pay_method3" >무통장입금</label></td>
									</tr>
									<tr id="tr_pay_card">
										<td><strong>카드 선택<strong>:&nbsp;&nbsp;&nbsp;
													<select id="card_com_name" name="card_com_name">
														<option value="삼성" selected>삼성</option>
														<option value="하나SK">하나SK</option>
														<option value="현대">현대</option>
														<option value="KB">KB</option>
														<option value="신한">신한</option>
														<option value="롯데">롯데</option>
														<option value="BC">BC</option>
														<option value="시티">시티</option>
														<option value="NH농협">NH농협</option>
												</select> <br>
												<Br> <strong>할부 기간:<strong>
															&nbsp;&nbsp;&nbsp; <select id="card_pay_month"
															name="card_pay_month">
																<option value="일시불" selected>일시불</option>
																<option value="2개월">2개월</option>
																<option value="3개월">3개월</option>
																<option value="4개월">4개월</option>
																<option value="5개월">5개월</option>
																<option value="6개월">6개월</option>
														</select></td>
									</tr>
									<tr id="tr_pay_phone" style="visibility: hidden">
										<td><strong>휴대폰 번호 입력: <strong> <input
													type="text" size="5" value="" id="pay_orderer_hp_num"
													name="pay_orderer_hp_num"/>
									</tr>
								</tbody>
							</table>
						</div>
				
					</div>
					</div>
					</div>
					
					<div class="clear"></div>
					<br> <br> <br>
					<center>
						<br> <br> 
						<div class="col-6 col-12-small">
					<ul class="actions stacked">
					<li><input type="submit" id="submit" class="button" value="결제하기"></li>
					<li><a href="${contextPath}/main" class="button">돌아가기</a></li>
															</ul>
														</div>
						</form>

						<div class="clear"></div>
					
								<div class="clear"></div>
								<br>
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
						allowOutsideClick : false,
						timer : 1500
					})
					setTimeout("document.location.reload();", 1800);

				}
			});
		});
		
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

		window.onload = function() {
			init();
		}

		function init() {
			var form_order = document.form_order;
			var h_tel1 = form_order.h_tel1;
			var h_hp1 = form_order.h_hp1;
			var tel1 = h_tel1.value;
			var hp1 = h_hp1.value;
			var select_tel1 = form_order.tel1;
			var select_hp1 = form_order.hp1;
			select_tel1.value = tel1;
			select_hp1.value = hp1;
		}


		function fn_pay_phone() {

			var e_card = document.getElementById("tr_pay_card");
			var e_phone = document.getElementById("tr_pay_phone");
			e_card.style.visibility = "hidden";
			e_phone.style.visibility = "visible";
		}

		function fn_pay_card() {
			var e_card = document.getElementById("tr_pay_card");
			var e_phone = document.getElementById("tr_pay_phone");
			e_card.style.visibility = "visible";
			e_phone.style.visibility = "hidden";
		}
	    $("#submit").click(function(){
	    	  $("#form_order").attr("action", "/order/orderResult");
	          $("#form_order").submit();
	     
	        
	    });
		

	    $(function(){
	    	  $('.tabcontent > div').hide();
	    	  $('.tabnav a').click(function () {
	    	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    	    $('.tabnav a').removeClass('active');
	    	    $(this).addClass('active');
	    	    return false;
	    	  }).filter(':eq(0)').click();
	    	  });
	</script>

	<!-- 	<script src="resources/assets/js/jquery.min.js"></script> -->
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>