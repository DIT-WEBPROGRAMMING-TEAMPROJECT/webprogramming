<%@page import="memberPackege.MemberDTO"%>
<%@page import="memberPackege.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberDTO dto = new MemberDTO(request.getParameter("edit_id"), request.getParameter("edit_pwd")
			, request.getParameter("edit_name"), request.getParameter("edit_email")
			, request.getParameter("edit_address")
			);
	MemberDAO dao = new MemberDAO();
	
	dao.EditProfile(dto);
	
	response.sendRedirect("MainPage.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>