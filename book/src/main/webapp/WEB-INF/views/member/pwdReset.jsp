<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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

		<div class="content_area">
	
     <div class="registration-form" style=" float: left; width: 85%;">
       <form method="post" id="pwd_form">
            <div class="form-icon">
                <span><i class="fa-solid fa-eraser"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="userid"name="userid" value="${userid}" required readonly="readonly">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item"  id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요" required>
            </div>
             <div class="form-group">
                <input type="password" class="form-control item"  id="pwdck" name="pwdck" placeholder="비밀번호를 입력해주세요" required>
            </div>
               <font id="checkPwd" size="2"></font>
           
          
<div class="button_container" >

  <button type="button" id="check" class="btn" disabled="disabled" ><span>확인</span></button>
          </div>
        </form>
       </div>
       </div>

</div>
</div>
<script>
$("#check").click(function(){
	  $("#pwd_form").attr("action", "/member/pwdUpdate");
    $("#pwd_form").submit();

   
  
});
$('#pwdck').on("propertychange change keyup paste input", function(){
	var pwckcorCheck = false; 		
	var pw = $('#pwd').val();
    var pwck = $('#pwdck').val();
 
 
    if(pw != pwck){
    	  $("#checkPwd").html('비밀번호가 다릅니다');
		  $("#checkPwd").attr('color','red');
		  $("#check").attr("disabled", true);
		  var pwckcorCheck = false; 	
	  }
    else{
    	 $("#checkPwd").html('올바른 비밀번호 입니다');
		  $("#checkPwd").attr('color','green');
		  $("#check").attr("disabled", false);
        pwckcorCheck = true;
    }       
	}); 	


function btn(){
	Swal.fire({
		  title: '정말 탈퇴하시겠습니까??',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: 'skyblue',
		  cancelButtonColor: 'lightcoral',
		  confirmButtonText: '네',
		cancelButtonText:'아니오',
			allowOutsideClick:false
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		    	  position: 'center',
		    	  icon: 'success',
		    	  title: '탈퇴완료',
		    	  showConfirmButton: false,
		    	  timer: 1500
		    	})
		    setTimeout("location.href ='./deleteMember'",2000);
		    return true
		  }
		})
}	
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
 

</script>
</body>
</html>