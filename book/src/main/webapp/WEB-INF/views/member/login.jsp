<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<!-- <link rel="stylesheet" href="/resources/css/member/login.css"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
 <link rel="stylesheet" href="/resources/css/member/register.css">
    <link rel="stylesheet" href="/resources/css/button.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
</head>
<body class="text-center">
 <div class="registration-form">
       <form method="post" id="login_form"name="login_form">
            <div class="form-icon">
                <span><i class="icon icon-login"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="userid"name="userid" placeholder="아이디"  required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control item"  id="pwd"name="pwd" placeholder="비밀번호"  required>
            </div>
  
<div class="button_container" >

  <button type="submit" class="btn" id="login_button"><span>로그인</span></button>
  <button type="button" class="btn" onclick="location.href='/main'" ><span>취소</span></button>
          </div>
        </form>
       </div>

 
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $("#login_button").click(function(){
    	  $("#login_form").attr("action", "/member/login");
          $("#login_form").submit();
        
    });
 
</script>
</body>
</html>