<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script type="text/javascript" src="/resources/js/userCheck.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input type="text" class="id_input" name="userid" id="userid" required="required">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input type="password" class="pw_input" name="pwd" id="pwd" required="required">
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input type="password" class="pwck_input" name="pwdck" id="pwdck" required="required">
				</div>
				 <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input type="text" class="user_input"name="name" id="name" required="required">
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input type="email" class="mail_input"name="email" id="email" required="required">
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
				<div class="phone_wrap">
				<div class="phone_name">전화번호</div> 
				<div class="phone_input_box">
					<input type="text"  class="phone_input"name="phone" id="phone">
				</div>
				</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="addr1" id="addr1"  readonly="readonly" required="required">
					</div>
					<div class="address_button" onclick="search_address()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="addr2" id="addr2"  readonly="readonly" required="required">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="addr3" id="addr3" readonly="readonly" >
					</div>
				</div>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" onclick="return check()" value="가입하기">
			</div>
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
	$(".join_button").click(function(){
		 var id = $('.id_input').val();                 // id 입력란
	        var pw = $('.pw_input').val();                // 비밀번호 입력란
	        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
	        var name = $('.user_input').val();            // 이름 입력란
	        var mail = $('.mail_input').val();            // 이메일 입력란
	        var addr = $('.address_input_3').val(); 
		
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
				  var email = $(".mail_input").val();        // 입력한 이메일
				    
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
$('.id_input').on("propertychange change keyup paste input", function(){

	var userid = $('.id_input').val();			// .id_input에 입력되는 값
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

$('.pwck_input').on("propertychange change keyup paste input", function(){
	 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
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
        	 
        	                $(".address_input_1").val(data.zonecode);
        	               
        	                $(".address_input_2").val(addr);
        	                
        	                // 커서를 상세주소 필드로 이동한다.
        	                $(".address_input_3").attr("readonly",false);
        	                $(".address_input_3").focus();       	     
        }
    }).open();     
}
 

</script>
</body>
</html>