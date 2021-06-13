<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="shopPackege.ShopDAO" %>
<%@page import="shopPackege.ShopDTO" %>

<%
request.setCharacterEncoding("utf-8");
	
	ShopDTO dto=new ShopDTO(Integer.parseInt(request.getParameter("productId")),Integer.parseInt(request.getParameter("productCode")),
					request.getParameter("name"),request.getParameter("info"),
					request.getParameter("Detailed"),request.getParameter("Thumbnail"),
					Integer.parseInt(request.getParameter("price")),Integer.parseInt(request.getParameter("stock"))
				);
	ShopDAO dao=new ShopDAO();
	
	dao.Registration(dto);
	response.sendRedirect("main.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>