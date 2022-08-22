<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사용자 정보 등록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
body { font-family: "나눔고딕", "맑은고딕" }
h1 { font-family: "HY견고딕" }

.registerForm {
  width:900px;
  height:auto;
  padding: 10px, 10px;
  background-color:#FFFFFF;
  border:4px solid gray;
  border-radius: 20px;
}
.u_id, .u_name, .u_pw, .u_pw1, .zip_code, .u_email, .u_address, .u_phone, .u_useyn {
  width: 80%;
  border:none;
  border-bottom: 2px solid #adadad;
  margin: 5px;
  padding: 10px 10px;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.btn_register  {
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: red;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
.btn_cancel  {
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: pink;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
</style>

<script>

	$(document).ready(function(){
	
		$("#btn_register").click(function(){
			
			if($("#u_id").val() == '') { alert("아이디를 입력하세요."); $("#u_id").focus();  return false; }
			if($("#u_name").val() == '') { alert("이름을 입력하세요."); $("#u_name").focus(); return false; }
			var Pass = $("#u_pw").val();
			var Pass1 = $("#u_pw1").val();
			if(Pass == '') { alert("암호를 입력하세요."); $("#u_pw").focus(); return false; }
			if(Pass1 == '') { alert("암호를 입력하세요."); $("#u_pw1").focus(); return false; }
			if(Pass != Pass1) 
				{ alert("입력된 비밀번호를 확인하세요"); $("#u_pw1").focus(); return false; }
			
			// 암호유효성 검사
			var num = Pass.search(/[0-9]/g);
		 	var eng = Pass.search(/[a-z]/ig);
		 	var spe = Pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);	
			if(Pass.length < 8 || Pass.length > 20) { alert("암호는 8자리 ~ 20자리 이내로 입력해주세요."); return false; }
			else if(Pass.search(/\s/) != -1){ alert("암호는 공백 없이 입력해주세요."); return false; }
			else if(num < 0 || eng < 0 || spe < 0 ){ alert("암호는 영문,숫자,특수문자를 혼합하여 입력해주세요."); return false; }
			
		 	if($("#u_phone").val() == '') { alert("전화번호를 입력하세요."); $("#u_phone").focus(); return false; }
		 	//전화번호 문자열 정리
			var beforeTelno = $("#u_phone").val();
		 	var afterTelno = beforeTelno.replace(/\-/gi,"").replace(/\ /gi,"").trim();
		 	//console.log("afterTelno : " + afterTelno);
		 	$("#u_phone").val(afterTelno);
		 	
			if($("#u_email").val() == '') { alert("이메일주소를 입력하세요."); $("#u_email").focus(); return false; }
			
			$("#registerForm").attr("action","memberRegistry.jsp").submit();	
		});
	});
	
</script>

</head>
<body>
<br><br><br>

<div class="main" align="center">
  <div class="registerForm">
	      
    <h1>사용자 등록</h1>
    <form name="registerForm" id="registerForm" method="post"> 
        <input type="text" id="u_id" name="u_id" class="u_id" placeholder="아이디를 입력하세요." onchange="idCheck()">
        <p id="checkID" style="color:red;text-align:center;"></p>
		    <input type="text" id="u_name" name="u_name" class="u_name" placeholder="이름을 입력하세요.">
        <input type="password" id="u_pw" name="u_pw" class="u_pw" placeholder="암호를 입력하세요.">
        <p style="color:red;text-align:center;">※ 8~20이내의 영문자, 숫자, 특수문자 조합으로 암호를 만들어 주세요.</p>
        <input type="password" id="u_pw1" name="u_pw1" class="u_pw1" placeholder="암호를 한번 더 입력하세요.">
        <input type="text" id="u_phone" name="u_phone" class="u_phone" placeholder="전화번호를 입력하세요.">
        <input type="text" id="u_email" name="u_email" class="u_email" placeholder="이메일주소를 입력하세요.">
        <input type="text" id="zip_code" name="zip_code" class="zip_code" placeholder="우편변호를 입력하세요.">
        <input type="text" id="u_address" name="u_address" class="u_address" placeholder="주소를 입력하세요.">
        <input type="text" id="u_useyn" name="u_useyn" class="u_useyn" placeholder="useyn을 입력하세요.">
        <input type="button" id="btn_register" class="btn_register" value="사용자 등록">
        <input type="button" id="btn_cancel" class="btn_cancel" value="취소" onclick="history.back()">
	  </form>

  </div>
</div>
<br><br>
</body>
</html>