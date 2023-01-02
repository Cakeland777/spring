<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	
	<div class="wrap">
	
		<div class="logo_wrap">
			<span>LOGIN</span>
		</div>
		 <form id="login_form" method="post">
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="id_input_box">
					<input type="text" class="id_input" id="userid"name="userid">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_iput" type="password" id="pwd"name="pwd">"
				</div>
			</div>
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인">
			</div>			
		</div>
		</form>
		
	</div>

</div>

 
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
    	  $("#login_form").attr("action", "/member/login");
          $("#login_form").submit();
        
    });
 
</script>
</body>
</html>