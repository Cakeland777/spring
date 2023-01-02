function check() {
    if (document.join_form.userid.value == "") {
		Swal.fire('아이디를 입력해주세요','','warning')
   
        document.join_form.userid.focus();
        return false;
    } 
    else if (document.join_form.name.value == "") {
        Swal.fire(
		  '이름을 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.name.focus();
        return false;
    } 
    else if (document.join_form.pwd.value == "") {
        Swal.fire(
		  '비밀번호를 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.pwd.focus();
        return false;
    } else if (document.join_form.pwdck.value == "") {
             Swal.fire(
		  '비밀번호 확인란을 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.pwdck.focus();
        return false;
    } else if (document.join_form.pwd.value != document.join_form.pwdck.value) {
		       Swal.fire(
		  '비밀번호 확인값이 다릅니다',
		  '',
		  'warning'
		)
        document.join_form.pwdck.focus();
        return false;
    } else if (document.join_form.email.value == "") {
		        Swal.fire(
		  '이메일을 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.email.focus();
        return false;
    }  else if (document.join_form.adress.value == "") {
		        Swal.fire(
		  '주소를 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.adress.focus();
        return false;
    } else if (document.join_form.phone.value == "") {
		        Swal.fire(
		  '핸드폰 번호를 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.phone.focus();
        return false;
    } 
    else if (document.join_form.sex.value == "") {
		        Swal.fire(
		  '성별을 입력해주세요',
		  '',
		  'warning'
		)
        document.join_form.sex.focus();
        return false;
    }  
     else {
	Swal.fire({
  position: 'center',
  icon: 'success',
  title: '가입완료',
  showConfirmButton: false,
  timer: 1500
})
  setTimeout(2000);
  return true;
    }
 
}