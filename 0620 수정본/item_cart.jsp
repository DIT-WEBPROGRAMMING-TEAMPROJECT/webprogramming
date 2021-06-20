<%@page import="productPackege.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("sessionId");

	String productId = request.getParameter("product_id_cart");
	// [수정] - 상품 개수 넘겨받아서 밑의 count에 넣기
	int quantity = Integer.parseInt(request.getParameter("product_count_cart"));
	
	out.println("상품아이디 : " + Integer.parseInt(productId));
	out.println("개수 : " + quantity);
	
	ProductDAO productDAO = new ProductDAO();
	
	productDAO.basketInsert(memberId, Integer.parseInt(productId), quantity);

	response.sendRedirect("cart.jsp");
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