<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
     <div class="registration-form">
       <form method="post" id="join_form">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="userid"name="userid" placeholder="아이디"  required>
             <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span> 
            </div>
  <font id="checkId" size="2"></font>
            <div class="form-group">
                <input type="password" class="form-control item"  id="pwd"name="pwd" placeholder="비밀번호"  required>
            </div>
                <div class="form-group">
                <input type="password" class="form-control item"  id="pwdck"name="pwdck" placeholder="비밀번호 확인"  required>
            </div>
            <span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
                 <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                <div class="form-group">
                <input type="text" class="form-control item"  id="name"name="name" placeholder="이름">
            </div>
               <div class="form-group">
                <input type="text" class="form-control item"  id="phone"name="phone" placeholder="전화번호">
            </div>
            <div class="form-group">
                <input type="email" class="form-control item"  id="email"name="email" placeholder="이메일">
            </div>
            <div class="address_button" onclick="search_address()" style="float: right;">
						<span>주소 검색</span>
					</div>
					<div class="clearfix"></div>
             <div class="form-group">
                <input type="text" style=" width: 150px; float: left;"class="form-control item"  id="addr1"name="addr1"  readonly="readonly" placeholder="주소1">
            </div>
        <div class="form-group">
                <input type="text" class="form-control item"  id="addr2"name="addr2" readonly="readonly" placeholder="주소2">
            </div>
              <div class="form-group">
                <input type="text" class="form-control item"  id="addr3"name="addr3"  readonly="readonly"placeholder="주소3">
            </div>
<div class="button_container" >

  <button type="submit" id="register" class="btn" onclick="return check()"><span>가입하기</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
          </div>
        </form>
       </div>
</div>
</div>
</div>
<script>
var idCheck = false;           
var idckCheck = false;         
var pwCheck = false;            
var pwckCheck = false;            
var pwckcorCheck = false;        
var nameCheck = false;            
var mailCheck = false;           
var mailnumCheck = false;      
var addressCheck = false; 
$(document).ready(function(){
	
	//회원가입 버튼
	$("#register").click(function(){
		 var id = $('#userid').val();                 // id 입력란
	        var pw = $('#pwd').val();                // 비밀번호 입력란
	        var pwck = $('#pwdck').val();            // 비밀번호 확인 입력란
	        var name = $('#name').val();            // 이름 입력란
	        var mail = $('#email').val();            // 이메일 입력란
	        var addr = $('#addr1').val(); 
		
		  if(pw == ""){
	            $('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
	 
		
		  if(pwckcorCheck&&idckCheck){
			  $("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
				  var email = $("#email").val();        				    
				    $.ajax({
				        
				        type:"GET",
				        url:"mail?email=" + email
				                
				    });
	        }   
		  
		  else{
			  Swal.fire('입력값을 다시 확인해주세요','','warning')
			  
		  }
		  return false;
	 
	});
});
//아이디 중복검사
$('#userid').on("propertychange change keyup paste input", function(){

	var userid = $('#userid').val();			
	var data = {userid : userid}				
	
	$.ajax({
		type : "post",
		url : "/member/useridCheck",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");	
				idckCheck = true;
				 
				
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
			
				idckCheck = false;
			}

			
		}// 
	}); 	

});

$('#pwdck').on("propertychange change keyup paste input", function(){
	 
    var pw = $('#pwd').val();
    var pwck = $('#pwdck').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
    
});       
//주소검색
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
</body>
</html>