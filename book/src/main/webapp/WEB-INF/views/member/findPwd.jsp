<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<style>

</style>
<meta charset="UTF-8">
<title>BookMall</title>
<link rel="stylesheet" href="/resources/css/main.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
 <link rel="stylesheet" href="/resources/css/member/register.css">
    <link rel="stylesheet" href="/resources/css/button.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
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
       <form method="post" id="find_form"name="find_form">
            <div class="form-icon">
                <span><i class="icon icon-login"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="userid"name="userid" placeholder="아이디"  required>
            </div>
            <div class="form-group">
                <input type="email" class="form-control item"  disabled="disabled"id="email"name="email" placeholder="이메일"  required>
            </div>
            <font id="checkEmail" size="2"></font>
     <button type="button" class="btn" id="mailbutton" disabled="disabled"><span>인증번호 전송</span></button>
     <font class="time" size="2"></font>
   <div class="form-group">
                <input type="text" class="form-control item" disabled="disabled" id="code" name="code" placeholder="인증번호"  required>
                <font id="checkCode" size="2"></font>
            </div>
<div class="button_container" >

  <button type="button" class="btn" disabled="disabled" id="find_button"><span>초기화</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
   
          </div>
          <br/>
          <div style="text-align:center;">
          <a href="/member/findPage">아이디 찾기</a> | <a href="/member/findPwd">비밀번호 찾기</a>
          </div>
        </form>
       
       </div>
</div>
 


	</div>
</div>
<script>
var code = ""; 
$('#userid').on("propertychange change keyup paste input", function(){
	var userid=$('#userid').val();
			
	var data = {userid:userid}				
	
	$.ajax({
		type : "post",
		url : "/member/useridCheck",
		data : data,
		success : function(result){
			if(result == "fail"){
				
				  $("#email").attr("disabled", false);
			  }else{
				
				  $("#email").attr("disabled", true);
			  }
		  
			
		}
	}); 	

});	
$('#email').on("propertychange change keyup paste input", function(){
	var userid=$('#userid').val();
	var email = $('#email').val();			
	var data = {userid:userid, email: email}				
	
	$.ajax({
		type : "post",
		url : "/member/userEmailCheck",
		data : data,
		success : function(result){
			if(result == "fail"){
				  $("#checkEmail").html('값이 다릅니다');
				  $("#checkEmail").attr('color','red');
				  $("#mailbutton").attr("disabled", true);
			  }else{
				  $("#checkEmail").html('');
				  
				  $("#mailbutton").attr("disabled", false);
			  }
		  
			
		}
	}); 	

});	
$("#mailbutton").click(function(){
    
    var email = $('#email').val();	        // 입력한 이메일
 

        $.ajax({
            
            type:"GET",
            url:"mailCheck?email=" + email,
            success:function(data){
            	 $("#code").attr("disabled", false);
            	 code = data;
            }
                
    });
    
});

/* 인증번호 비교 */
$("#code").blur(function(){
    
    var inputCode = $("#code").val();           
        
    
    if(inputCode != code){                            
    	$("#checkCode").html('값이 다릅니다');
		  $("#checkCode").attr('color','red');
		  $("#find_button").attr("disabled", true);        
    } else {                                            
    	$("#checkCode").html('값이 일치합니다');
		  $("#checkCode").attr('color','green');
		  $("#find_button").attr("disabled", false);  
    }    
    
});
$("#find_button").click(function(){
	  $("#find_form").attr("action", "/member/pwdResetForm");
    $("#find_form").submit();

  
});
  

var timer = null;
var isRunning = false;
$(function(){

	    $("#mailbutton").click(function(e){
    	var display = $('.time');
    	var leftSec = 300;
    
    	if (isRunning){
    		clearInterval(timer);
    		display.html("");
    		startTimer(leftSec, display);
    	}else{
    	startTimer(leftSec, display);
    		
    	}
    });
})

    
function startTimer(count, display) {
            
    		var minutes, seconds;
            timer = setInterval(function () {
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
     
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
     
            display.html(minutes + ":" + seconds);
      	 display.attr('color','red');	
      
            if (--count < 0) {
    	     clearInterval(timer);
    	     Swal.fire({
		    	  position: 'center',
		    	  icon: 'error',
		    	  title: '시간초과',
		    	  showConfirmButton: false,
		    	  timer: 1500
		    	})
    	     display.html("시간초과");
    	     $('#find_button').attr("disabled","disabled");
    	     $('#code').attr("disabled","disabled");
    	     isRunning = false;
            }
        }, 1000);
             isRunning = true;
}
 
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