<%@page import="orderPackege.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberId = (String)session.getAttribute("sessionId");
	int productId = (Integer)session.getAttribute("productId");
	int quantity = Integer.parseInt(request.getParameter("product_count_buy"));
	
	OrderDAO orderDAO = new OrderDAO();
	orderDAO.BuyOne(memberId, productId, quantity);
	response.sendRedirect("buylist.jsp");
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