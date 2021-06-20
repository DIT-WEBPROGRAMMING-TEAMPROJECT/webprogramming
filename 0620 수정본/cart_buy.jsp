<%@page import="orderPackege.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberId = (String)session.getAttribute("sessionId");
	OrderDAO orderDAO = new OrderDAO();
	
	int dtosSize = Integer.parseInt(request.getParameter("dtosSize"));
	
	for(int i=0; i<dtosSize; i++) {
		orderDAO.BuyOne(
				memberId
				, Integer.parseInt(request.getParameter("productId"+i))
				, Integer.parseInt(request.getParameter("productQuantity"+i)));	
	}
	
	orderDAO.deleteBasket(memberId);
	
	response.sendRedirect("buylist.jsp");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>

</body>
</html>