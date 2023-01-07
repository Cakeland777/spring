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
		<div class="table" style="margin-top:30px;text-align:center;float: right; width: 85%;">
		<table id="bookTable" class="table table-striped table-bordered table-hover" >
    <thead>
        <tr>
            <th>상품번호</th>
             <th>제목</th>
            <th>저자</th>
            <th>출판사</th>
            <th>가격</th>
            <th>페이지</th>
            <th>분류</th>
            <th>도서삭제</th>
        </tr>
    </thead>
    <!-- tbody 태그 필요 없다. -->
</table>
<button type="button" id="check" class="btn" onclick="location.href='./bookInsertForm'"><span>상품등록</span></button>
		</div>	
		</div>
	</div>
</div>
<script>
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
    $('#bookTable').dataTable({
        pageLength: 10,
        bPaginate: true,
        bLengthChange: true,
        lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
        bAutoWidth: false,
        processing: true,
        ordering: true,
        serverSide: false,
        bInfo : false,
        language : lang_kor,
        searching: true,
        ajax : {
            url:"/admin/bookList.do",
            type:"POST",
            dataSrc:''
        },
        columns : [
        	 { 
                 "data": "goods_id",
                 "render": function(data, type, row, meta){
                	  var Idx = data.goods_id;
                    if(type === 'display'){
                        data = '<a href="../books/booksDetail?goods_id='+data+'">' + data+ '</a>';
                    }

                    return data;
                 }
              } ,
            {data: "goods_title"},
            {data: "goods_writer"},
            {data: "goods_publisher"},
            {data: "goods_price"},
            {data: "goods_total_page"},
            {data: "goods_sort"},
            { 
                "data": "goods_id",
                "render": function(data, type, row, meta){
              
                   if(type === 'display'){
                       data = '<a href="/admin/bookDelete?goods_id='+data+'">' +'삭제' + '</a>';
                   }

                   return data;
                }
             }

        ]

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
</body>
</html>