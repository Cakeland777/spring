<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="goods"  value="${goodsMap.booksVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />

 <%
     //치환 변수 선언합니다.
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<!DOCTYPE HTML>
<html>
<head>
<title>도서상세</title>
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
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
<style>
html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}

/*tab css*/
.tab{float:left; width:750px; height:500px;}
.tabnav{font-size:0; width:750px; border:1px solid #ddd;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#f56a6a;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#f56a6a; }
.tabcontent{padding: 20px;width:750px;  height:1000px ; border:1px solid #ddd; border-top:none;}
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
						<h2>${goods.goods_title }</h2>
					</header>
					<div class="features">

						<article>
							
							<div class="content">
					
												<div class="booksdetail">	
<hgroup>
		<h4>${goods.goods_writer} &nbsp; 저| ${goods.goods_publisher}</h4>
	</hgroup>
	<div id="goods_image" > 
		<figure >
			<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
		</figure>
	</div>
	<div id="detail_table"  >
		<table>
			<tbody>
				<tr>
					<td class="fixed">정가</td>
					<td class="active"><span >
					   <fmt:formatNumber  value="${goods.goods_price}" type="number" var="goods_price" />
				         ${goods_price}원
					</span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">판매가</td>
					<td class="active"><span >
					   <fmt:formatNumber  value="${goods.goods_price*0.9}" type="number" var="discounted_price" />
				         ${discounted_price}원(10%할인)</span></td>
				</tr>
				<tr>
					<td class="fixed">포인트적립</td>
					<td class="active">${goods.goods_point}P(10%적립)</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">포인트 추가적립</td>
					<td class="fixed">만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P 추가적립</td>
				</tr>
				<tr>
					<td class="fixed">발행일</td>
					<td class="fixed">
					   <c:set var="pub_date" value="${goods.goods_published_date}" />
					   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
					   <c:out value="${arr[0]}" />
					</td>
				</tr>
				<tr>
					<td class="fixed">페이지 수</td>
					<td class="fixed">${goods.goods_total_page}쪽</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">ISBN</td>
					<td class="fixed">${goods.goods_isbn}</td>
				</tr>
				<tr>
					<td class="fixed">배송료</td>
					<td class="fixed"><strong>무료</strong></td>
				</tr>
				<tr>
					<td class="fixed">배송안내</td>
					<td class="fixed"><strong>[당일배송]</strong> 당일배송 서비스 시작!<br> <strong>[휴일배송]</strong>
						휴일에도 배송받는 Bookshop</TD>
				</tr>
				<tr>
					<td class="fixed">도착예정일</td>
					<td class="fixed">지금 주문 시 내일 도착 예정</td>
				</tr>
				<tr>
					<td class="fixed">수량</td>
					<td class="fixed">
			      <select style="width: 80px;" id="order_goods_qty">
				      <option selected="selected">1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
			     </select>
					 </td>
				</tr>
			</tbody>
		</table>
		<div style="display: flex;">
			<a style="flex: 1; margin: 20px;" class="button" href="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_title }','${goods.goods_sales_price}','${goods.goods_fileName}');">구매하기 </a>
			<a style="flex: 1; margin: 20px;" class="button" href="javascript:add_cart('${goods.goods_id }')">장바구니</a></li>
		</div>
	</div>
	<div class="clear"></div>
	<!-- 내용 들어 가는 곳 -->
	<div id="container" class="tab">
		<ul class="tabnav">
			<li><a href="#tab01">책소개</a></li>
			<li><a href="#tab02">저자소개</a></li>
<!-- 			<li><a href="#tab03">책목차</a></li> -->
			<li><a href="#tab04">출판사서평</a></li>
			<li><a href="#tab05">추천사</a></li>
			<li><a href="#tab06">Q&A</a></li>
		</ul>
		<div class="tabcontent">
			<div class="tab_content" id="tab01">
				<h4>책소개</h4>
				<p>${fn:replace(goods.goods_intro,crcn,br)}</p>
				<c:forEach var="image" items="${imageList }">
					<img 
						src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
			</div>
			<div class="tab_content" id="tab02">
				<h4>저자소개</h4>
				<p>
				<div class="writer">저자 : ${goods.goods_writer}</div>
				 <p>${fn:replace(goods.goods_writer_intro,crcn,br) }</p> 
				
			</div>

			<div class="tab_content" id="tab04">
				<h4>출판사서평</h4>
				 <p>${fn:replace(goods.goods_publisher_comment ,crcn,br)}</p> 
			</div>
			<div class="tab_content" id="tab05">
				<h4>추천사</h4>
				<p>${fn:replace(goods.goods_recommendation,crcn,br) }</p>
			</div>
			<div class="tab_content" id="tab06">
				<h4>Q&A</h4>
				<c:if test="${member!=null }">
				<form id="reviewForm" method="post" name="reviewForm">
				<input type="hidden"value="${goods.goods_id}" id="goods_id" name="goods_id" readonly="readonly" >
					<input type="text" value="${member.userid}" id="userid" name="userid" readonly="readonly">
					<br/>
				<input type="text" placeholder="제목을 입력하세요" id="title" name="title">
				<br/>
				<textarea placeholder="내용을 입력하세요" id="content" name="content"></textarea>
				<button type="submit" id="register"
											class="button primary large">등록하기</button>
				</form>
				</c:if>
		<table id="reviewTable">
    <thead>
        <tr>
        
        <th>제목</th>
            <th>작성자</th>
           <th>상세</th>
            

        </tr>
    </thead>
    <!-- tbody 태그 필요 없다. -->
</table>
		
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="${contextPath}/resources/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">장바구니에 담았습니다.</font><br>
<form   action='${contextPath}/cart/myCartList.do'  >				
		<input  type="submit" value="장바구니 보기">
</form>			
			
			</div>
		</div>	
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
	let boardForm = document.querySelector("#reviewForm");
	boardForm.addEventListener("submit", (e) => {
	   e.preventDefault();
	   fetch('/books/board', 
	      {
			method : 'POST',
		    cache: 'no-cache',
			body: new FormData(boardForm)		
		})
		.then(response => response.json())
		
			Swal.fire({
				  position: 'center',
				  icon:'success',
				  title: '등록완료',
				  showConfirmButton: false,
				  timer: 1500
				});
			
	
	});
	
	   
	    $("#logout_button").click(function(){
	     
	        $.ajax({
	            type:"POST",
	            url:"/member/logout.do",
	            success:function(data){
	            	Swal.fire({
	            		  position: 'center',
	            		  icon: 'success',
	            		  title: '로그아웃 되었습니다',
	            		  showConfirmButton: false,
	            		  timer: 1500
	            		})
	            		setTimeout("document.location.reload();",1800);
	    
	            } 
	        });
	    });
	    var lang_kor = {
	            "decimal" : "",
	            "emptyTable" : "데이터가 없습니다.",
	            "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
	            "infoEmpty" : "0명",
	            "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
	            "infoPostFix" : "",
	            "thousands" : ",",
	            "lengthMenu" : "_MENU_ 개씩 보기",
	            "loadingRecords" : "로딩중...",
	            "processing" : "처리중...",
	            "search" : "검색 : ",
	            "zeroRecords" : "검색된 데이터가 없습니다.",
	            "paginate" : {
	                "first" : "첫 페이지",
	                "last" : "마지막 페이지",
	                "next" : "다음",
	                "previous" : "이전"
	            },
	            "aria" : {
	                "sortAscending" : " :  오름차순 정렬",
	                "sortDescending" : " :  내림차순 정렬"
	            }
	        };
	     
	    $(document).ready(function(){
	        $('#reviewTable').dataTable({
	            pageLength: 10,
	            bPaginate: true,
	            bLengthChange: false,
	            lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
	            bAutoWidth: false,
	            processing: true,
	            ordering: false,
	            serverSide: false,
	            bInfo : false,
	            language : lang_kor,
	            searching: true,
	            ajax : {
	                url:"/books/bookList?goods_id="+${goods.goods_id},
	                type:"GET",
	                dataSrc:''
	            },
	            columns : [
	            	{data: "title"},
	            	{data: "userid"},
		              
	            	  { 
	                      "data": "bid",
	                      "render": function(data, type, row, meta){
	                    
	                         if(type === 'display'){
	                             data = '<a href="/books/boardDetail?bid='+data+'">' +'상세' + '</a>';
	                         }

	                         return data;
	                      }
	                   }
	                
	              
	          
	            ]

	        });

	    });
	</script>
	<script type="text/javascript">
	
	function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	
		
		
			var total_price,final_total_price;
			var order_goods_qty=document.getElementById("order_goods_qty");
			
			var formObj=document.createElement("form");
			var i_goods_id = document.createElement("input"); 
	    var i_goods_title = document.createElement("input");
	    var i_goods_sales_price=document.createElement("input");
	    var i_fileName=document.createElement("input");
	    var i_order_goods_qty=document.createElement("input");
	    
	    i_goods_id.name="goods_id";
	    i_goods_title.name="goods_title";
	    i_goods_sales_price.name="goods_sales_price";
	    i_fileName.name="goods_fileName";
	    i_order_goods_qty.name="order_goods_qty";
	    
	    i_goods_id.value=goods_id;
	    i_order_goods_qty.value=order_goods_qty.value;
	    i_goods_title.value=goods_title;
	    i_goods_sales_price.value=goods_sales_price;
	    i_fileName.value=fileName;
	    
	    formObj.appendChild(i_goods_id);
	    formObj.appendChild(i_goods_title);
	    formObj.appendChild(i_goods_sales_price);
	    formObj.appendChild(i_fileName);
	    formObj.appendChild(i_order_goods_qty);

	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/order/orderEachGoods";
	    formObj.submit();
		}	
		var loopSearch=true;
		function keywordSearch(){
			if(loopSearch==false)
				return;
		 var value=document.search_form.search.value;
			$.ajax({
				type : "get",
				async : true, 
				url : "${contextPath}/books/keywordSearch.do",
				data : {keyword:value},
				success : function(data, textStatus) {
				    var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				},
				complete : function(data, textStatus) {
					
					
				}
			}); 	
		}
		
		function displayResult(jsonInfo){
			var count = jsonInfo.keyword.length;
			if(count > 0) {
			    var html = '';
			    for(var i in jsonInfo.keyword){
				   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
			    }
			    var listView = document.getElementById("suggestList");
			    listView.innerHTML = html;
			    show('suggest');
			}else{
			    hide('suggest');
			} 
		}
		
		function select(selectedKeyword) {
			 document.search_form.search.value=selectedKeyword;
			 loopSearch = true;
			 hide('suggest');
		}
			
		function show(elementId) {
			 var element = document.getElementById(elementId);
			 if(element) {
			  element.style.display = 'block';
			 }
			}
		
		function hide(elementId){
		   var element = document.getElementById(elementId);
		   if(element){
			  element.style.display = 'none';
		   }
		}
		function add_cart(goods_id) {
			$.ajax({
				type : "post",
				async : false, 
				url : "/cart/addGoodsInCart",
				data : {
					goods_id:goods_id
					
				},
				success : function(data, textStatus) {
					//alert(data);
				//	$('#message').append(data);
					if(data.trim()=='add_success'){
						Swal.fire({
		            		  position: 'center',
		            		  icon: 'success',
		            		  title: '장바구니에 담았습니다',
		            		  showConfirmButton: false,
		            		  timer: 1500
		            		})
					}else if(data.trim()=='already_existed'){
						Swal.fire({
		            		  position: 'center',
		            		  icon: 'error',
		            		  title: '이미 담긴 상품입니다',
		            		  showConfirmButton: false,
		            		  timer: 1500
		            		})
					}
					
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
				}
			}); 
		}
	
	    /* 로그인 버튼 클릭 메서드 */
	    $("#login_button").click(function(){
	    	  $("#login_form").attr("action", "/member/login");
	          $("#login_form").submit();
	     
	        
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
<!-- 	<script src="/resources/assets/js/jquery.min.js"></script> -->
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>