<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- <link rel="stylesheet" href="/resources/css/member/join.css"> -->
    <link rel="stylesheet" href="/resources/css/member/register.css">
    <link rel="stylesheet" href="/resources/css/button.css">
    <link rel="stylesheet" href="/resources/css/main.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/userCheck.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
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
			
	</div>
 <div class="clearfix"></div>	
			

		<div class="navi_bar_area">
			
		</div>
		
		<div class="side_bar" style="margin-top:50px;text-align:center;float: left; width: 15%;">
		<ul>
           <li ><a href="/member/mypage">회원정보조회</a></li>
           <li><a href="/member/updateMember">회원정보수정</a></li>
           <li><a href="/member/mypage">주문정보조회</a></li>
            <li><a href="/member/deletePage">회원탈퇴</a></li>

       </ul>
		</div>
		<div class="content_area">
	
     <div class="registration-form" style=" float: left; width: 85%;">
       <form method="post" id="update_form">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="userid"name="userid" value="${member.userid}" required readonly="readonly">
            </div>
            <div class="form-group">
                <input type="password" class="form-control item"  id="pwd"name="pwd" value="${member.pwd}" readonly="readonly" required>
            </div>
                         
                <div class="form-group">
                <input type="text" class="form-control item" value="${member.name}" id="name"name="name" placeholder="이름">
            </div>
               <div class="form-group">
                <input type="text" class="form-control item"  value="${member.phone}"id="phone"name="phone" placeholder="전화번호">
            </div>
            <div class="form-group">
                <input type="email" class="form-control item"  value="${member.email}"id="email"name="email" placeholder="이메일">
            </div>
               <div class="address_button" onclick="search_address()" style="float: right;">
						<span>주소 검색</span>
					</div>
					<div class="clearfix"></div>
             <div class="form-group">
                <input type="text" style=" width: 150px ;float: left;"value="${member.addr1}" class="form-control item"  id="addr1"name="addr1"  readonly="readonly" placeholder="주소1">
            </div>
        <div class="form-group">
                <input type="text" class="form-control item"  value="${member.addr2}"id="addr2"name="addr2" readonly="readonly" placeholder="주소2">
            </div>
              <div class="form-group">
                <input type="text" class="form-control item" value="${member.addr3}" id="addr3"name="addr3"  readonly="readonly"placeholder="주소3">
            </div>
<div class="button_container" >
<button type="submit" id="update" class="btn" ><span>수정하기</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
          </div>
        </form>
       </div>
       </div>

</div>
</div>
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
        		setTimeout("location.href='/main'",1800);

        } 
    });
});
 
function search_address(){
	 
    new daum.Postcode({
        oncomplete: function(data) {
        	 
       
        	                var addr = ''; 
        	                var extraAddr = '';
        	 
        	           
        	                if (data.userSelectedType === 'R') { 
        	                    addr = data.roadAddress;
        	                } else { 
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
        	                
        	             
        	                $("#addr3").attr("readonly",false);
        	                $("#addr3").focus();       	     
        }
    }).open();     
}
 
</script>
</body>
</html>