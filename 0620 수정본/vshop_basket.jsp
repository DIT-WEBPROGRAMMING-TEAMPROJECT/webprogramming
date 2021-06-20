<%@page import="productPackege.ProductDAO"%>
<%@page import="orderPackege.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String)session.getAttribute("sessionId");	
	OrderDAO orderDao = new OrderDAO();
	ProductDAO productDAO = new ProductDAO();
	
	ArrayList<Integer> productIdArray = new ArrayList<>();
	productIdArray.add(orderDao.returnInt(request.getParameter("cpu_basket")));
	productIdArray.add(orderDao.returnInt(request.getParameter("ram_basket")));
	productIdArray.add(orderDao.returnInt(request.getParameter("graphic_basket")));
	productIdArray.add(orderDao.returnInt(request.getParameter("ssd_basket")));
	productIdArray.add(orderDao.returnInt(request.getParameter("hdd_basket")));
	productIdArray.add(orderDao.returnInt(request.getParameter("power_basket")));
	productIdArray.add(orderDao.returnInt(request.getParameter("case_basket")));
	for(int i=0; i<productIdArray.size(); i++) {
		if(productIdArray.get(i) != 0)
			productDAO.BasketOne(memberId, productIdArray.get(i), 1);
		else
			continue;
	}
	response.sendRedirect("cart.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>