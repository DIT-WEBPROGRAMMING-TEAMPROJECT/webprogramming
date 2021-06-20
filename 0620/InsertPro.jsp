<%@page import="productPackege.ProductDTO"%>
<%@page import="productPackege.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>


<%
request.setCharacterEncoding("utf-8");
	ProductDTO dto = new ProductDTO(1,Integer.parseInt(request.getParameter("productcode")), 
							  request.getParameter("name"), request.getParameter("detailedLink"), 
							  request.getParameter("thumbnailLink"), Integer.parseInt(request.getParameter("price")), 
							  Integer.parseInt(request.getParameter("stock")));
	ProductDAO productDao=new ProductDAO();
	
	productDao.Registration(dto);
	response.sendRedirect("admin.jsp");
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