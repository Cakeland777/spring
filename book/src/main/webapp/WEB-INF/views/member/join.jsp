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
				  var email = $("#email").val();        // 입력한 이메일
				    
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

	var userid = $('#userid').val();			// .id_input에 입력되는 값
	var data = {userid : userid}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
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
        	 
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
        	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        	                var addr = ''; // 주소 변수
        	                var extraAddr = ''; // 참고항목 변수
        	 
        	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        	                    addr = data.roadAddress;
        	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
        	                    addr = data.jibunAddress;
        	                }
        	 
        	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        	                if(data.userSelectedType === 'R'){
        	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        	                        extraAddr += data.bname;
        	                    }
        	                    // 건물명이 있고, 공동주택일 경우 추가한다.
        	                    if(data.buildingName !== '' && data.apartment === 'Y'){
        	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        	                    }
        	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
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