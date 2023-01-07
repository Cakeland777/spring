<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookMall</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/member/button.css">
 <link rel="stylesheet" href="/resources/css/member/register.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			  <ul class="list">
			  <c:if test="${member==null }">
                <li >
                    <a href="/member/login">로그인</a>
                </li>
                <li>
                    <a href="/member/join">회원가입</a>
                </li>
                </c:if>
                 <c:if test="${member != null }">   
                 
                    <c:if test="${member.admin_ck == 1 }">
                        <li><a href="/admin/main">관리자 페이지</a></li>
                    </c:if>                 
                    <li>
                      <a id="logout_button">로그아웃</a>
                    </li>
                    <li>
                          <a href="/member/mypage">마이페이지</a>
                    </li>
                    <li>
                        장바구니
                    </li>
                </c:if>    
 
                
                <li>
                    고객센터
                </li>            
            </ul>    
 
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/main"><img src="/resources/image/logo.png"  width="150px;" style="margin-left:100px; text-align: center;"></a>
			</div>
			<div class="search_area">
				<form id="search_form" name="search_form" class="search_form" action="${contextPath}/books/searchBooks.do">
				<input class="search-txt" type="text" name="search" id="search" onKeyUp="keywordSearch()">
	<div  id="suggest">
        <div id="suggestList"  ></div>
   				</div>	
				<button  class="search-btn" type="submit"><i class="fas fa-search"></i></button>
				</form>
 
			</div>
			
			<div class="login_area">
				 <!-- 로그인 하지 않은 상태 -->
                <c:if test = "${member == null }">
                    <div class="login_button">

                    </div>
                                  
                </c:if>   
                <!-- 로그인한 상태 -->
               <c:if test="${ member != null }">
                    <div class="login_success_area">
                        <span>${member.name} 님 환영합니다</span>
                        <a class="logout"href="/member/logout.do">로그아웃</a>
                    </div>
                </c:if>
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="navi_bar_area">
			
		</div>
		<div class="content_area">
		
	<div class="side_bar" style="margin-top:50px;text-align:center;float: left; width: 15%;">
		<ul>
           <li ><a href="/admin/userList">가입회원조회</a></li>
            <li><a href="/admin/bookList">상품목록</a></li>
           <li><a href="/admin/books">상품관리</a></li>
           <li><a href="/admin/order">주문관리</a></li>
            <li><a href="/admin/board">게시판관리</a></li>

       </ul>
		</div>
	
     <div class="registration-form">
       <form action="${contextPath}/admin/addNewBook" method="post"  enctype="multipart/form-data">
       <div class="form-group">
       제품분류
            <select name="goods_sort">
            	
						<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷
						<option value="디지털 기기">디지털 기기
					</select>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" name="goods_title"id="goods_title" placeholder="제품이름"  required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item"  id="goods_writer"name="goods_writer"placeholder="저자"  required>
            </div>
                <div class="form-group">
                <input type="text" class="form-control item"  id="goods_publisher"name="goods_publisher" placeholder="출판사"  required>
            </div>
                <div class="form-group">
                <input type="text" class="form-control item"  id="goods_price"name="goods_price" placeholder="제품정가">
            </div>
               <div class="form-group">
                <input type="text" class="form-control item"  id="goods_sales_price"name="goods_sales_price"placeholder="제품판매가격">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item"  id="goods_point"name="goods_point"placeholder="제품구매포인트">
            </div>
             <div class="form-group">
                <input type="date" class="form-control item"  id="goods_published_date"name="goods_published_date"placeholder="제품출판일">
            </div>
             <div class="form-group">
                <input type="text" class="form-control item"  id="goods_total_page"name="goods_total_page"placeholder="페이지 수">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item"  id="goods_isbn"name="goods_isbn"placeholder="ISBN">
            </div>
             <div class="form-group">
                <input type="text" class="form-control item"  id="goods_delivery_price"name="goods_delivery_price"placeholder="배송비">
            </div>
             <div class="form-group">
                <input type="date" class="form-control item"  id="goods_delivery_date"name="goods_delivery_date"placeholder="도착예정일">
            </div>
             <div class="form-group">
             제품종류
             <select name="goods_status">
				  <option value="bestseller"  >베스트셀러</option>
				  <option value="steadyseller" >스테디셀러</option>
				  <option value="newbook" selected >신간</option>
				  <option value="on_sale" >판매중</option>
				  <option value="buy_out" >품절</option>
				  <option value="out_of_print" >절판</option>
				</select>
             </div>
              <div class="form-group">
              책 목차
                <textarea  rows="8" cols="60" name="goods_contents_order"></textarea>
            </div>
            <div class="form-group">
              저자소개
                <textarea  rows="8" cols="60" name="goods_writer_intro"></textarea>
            </div>
             <div class="form-group">
              제품소개
                <textarea  rows="8" cols="60" name="goods_intro"></textarea>
            </div>
            <div class="form-group">
              출판사제품평가
                <textarea  rows="8" cols="60" name="goods_publisher_comment"></textarea>
            </div>
            <div class="form-group">
              추천사
                <textarea  rows="8" cols="60" name="goods_recommendation"></textarea>
            </div>
             <input type="button"  style="float:right;" value="파일 추가" onClick="fn_addFile()"/>
            
             
             <br/>
             <div id="d_file">
				            </div>
				          <br/>    
<div class="button_container" >

  <button type="button" value="상품 등록하기" id="register" class="btn" onClick="fn_add_new_goods(this.form)"></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
          </div>
        </form>
       </div>
		</div>
	</div>
</div>
<script>


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
            		setTimeout("location = '/main';",1800);
    
            } 
        });
    });
    
</script>
<script type="text/javascript">
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
</body>
</html>