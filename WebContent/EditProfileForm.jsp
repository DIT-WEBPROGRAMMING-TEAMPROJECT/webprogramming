<%@page import="memberPackege.MemberDAO"%>
<%@page import="memberPackege.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String sessionId = (String)session.getAttribute("sessionId");
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	dto = dao.SetEditProfile(sessionId);	// 로그인할 때 받은 id세션값 삽입
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditProfileForm</title>
</head>
<body>
	<form action="EditProfilePro.jsp">
		<h5>id</h5>
		<input id="edit_id" name="edit_id" value="<%=dto.getId()%>" readonly>
		<h5>pwd</h5>
		<input type="text" id="edit_pwd" name="edit_pwd" value="<%=dto.getPwd()%>">
		<h5>name</h5>
		<input type="text" id="edit_name" name="edit_name" value="<%=dto.getName()%>">
		<h5>email</h5>
		<input type="text" id="edit_email" name="edit_email" value="<%=dto.getEmail()%>">
		<h5>address</h5>
		<input type="text" id="edit_address" name="edit_address" value="<%=dto.getAddress()%>"><br>
		<button type="submit">수정</button>
		<button onclick="location.href='MainPage.jsp'">취소</button>
	</form>
</body>
</html>