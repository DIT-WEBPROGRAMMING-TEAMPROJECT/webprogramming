<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
</head>
<body>
	<h1>Login</h1>
	<br>
	<form action="LoginPro.jsp">
		<div>
			<p>id</p>
			<input type="text" id="login_id" name="login_id">
			<p>pwd</p>
			<input type="text" id="login_pwd" name="login_pwd">
		</div>
		<br>
		<div>
			<button type="submit">Login</button>
		</div>
	</form>
	<button onclick="location.href='SignUpForm.jsp'">Sign-Up</button>
</body>
</html>