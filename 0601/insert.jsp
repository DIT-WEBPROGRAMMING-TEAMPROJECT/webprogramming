<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var writer = frm["memberId"].value.trim();
	var title = frm["title"].value.trim();
	
	if(writer = ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["memberId"].focus();
		return false;
	}
	if(title = ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	return true;
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" action="writeOk.jsp" method="post" onsubmit="return chkSubmit()">
작성자:
<input type="text" name="name"/><br>
제목:
<input type="text" name="subject"/><br>
내용:<br>
<textarea name="content"></textarea>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.jsp'">목록으로</button>
</body>
</html>