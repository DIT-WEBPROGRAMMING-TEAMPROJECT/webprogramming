<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<form action="SignUpPro.jsp">
		<div>
			<p>id</p>
			<input type="text" id="singup_id" name="singup_id">
		</div>
		<div>
			<p>pwd</p>
			<input type="text" id="singup_pwd" name="singup_pwd">
		</div>
		<div>
			<p>name</p>
			<input type="text" id="singup_name" name="singup_name">
		</div>
		<div>
			<p>email</p>
			<input type="text" id="singup_email" name="singup_email">
		</div>
		<div>
			<p>address</p>
			<input type="text" id="singup_address" name="singup_address">
		</div>
		<br>
		<button type="submit">등록</button>	
	</form>
</body>
</html>