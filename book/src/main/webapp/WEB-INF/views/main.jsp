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
<link rel="stylesheet" href="resources/css/main.css">

 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
                        마이페이지
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
				<a href="/main"><img src="resources/image/logo.png"  width="150px;" style="margin-left:100px; text-align: center;"></a>
			</div>
			<div class="search_area">
				<form id="search_form" name="search_form" class="search_form" action="${contextPath}/books/searchBooks.do">
				<input class="search-txt" type="text" name="search" id="search" onKeyUp="keywordSearch()">
<!-- 				<div  style=" width:300px;z-index:1000;margin-right:1000px; margin-top: 80px;"id="suggest"> -->
<!--         <div id="suggestList"  ></div> -->
<!--    </div>				 -->
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
<!--                     <a href="/member/login">로그인</a> -->
<!--                     <a href="/member/join">회원가입</a>  -->
                    </div>
                                  
                </c:if>   
                <!-- 로그인한 상태 -->
               <c:if test="${ member != null }">
                    <div class="login_success_area">
                        <span>${member.name} 님 환영합니다</span>
<%--                         <span>충전금액 :<fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span> --%>
<%--                         <span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" /></span> --%>
                        <a class="logout"href="/member/logout.do">로그아웃</a>
                    </div>
                </c:if>
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="navi_bar_area">
			
		</div>
		<div class="content_area">
		

<!-- <div id="ad_main_banner"> -->
<!-- 	<ul class="bjqs">	 	 -->
<%-- 	  <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner01.jpg"></li> --%>
<%-- 		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner02.jpg"></li> --%>
<%-- 		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner03.jpg"></li>  --%>
<!-- 	</ul> -->
<!-- </div> -->
<div class="main_book">
   <c:set  var="goods_count" value="0" />
	<h3>베스트셀러</h3>
	<c:forEach var="item" items="${goodsMap.bestseller }">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a> 
				<img width="121" height="154" 
				     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">

			<div class="title">${item.goods_title }</div>
			<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		          ${goods_price}원
			</div>
		</div>
	   <c:if test="${goods_count==15   }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner01.jpg">
</div>
<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<h3>새로 출판된 책</h3>
	<c:forEach var="item" items="${goodsMap.newbook }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="121" height="154" 
				src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
		<div class="price">
		    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		       ${goods_price}원
		  </div>
	</div>
	 <c:if test="${goods_count==15   }">
     <div class="book">
       <font size=20> <a href="#">more</a></font>
     </div>
   </c:if>
	</c:forEach>
</div>

<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner02.jpg">
</div>


<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<h3>스테디셀러</h3>
	<c:forEach var="item" items="${goodsMap.steadyseller }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="121" height="154" 
				src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
		<div class="price">
		    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		       ${goods_price}원
		  </div>
	</div>
	 <c:if test="${goods_count==15   }">
     <div class="book">
       <font size=20> <a href="#">more</a></font>
     </div>
   </c:if>
	</c:forEach>
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
            		setTimeout("document.location.reload();",1800);
    
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
</body>
</html>