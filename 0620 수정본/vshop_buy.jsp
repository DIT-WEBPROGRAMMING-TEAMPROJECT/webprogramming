<%@page import="java.util.ArrayList"%>
<%@page import="orderPackege.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String)session.getAttribute("sessionId");	
	OrderDAO orderDao = new OrderDAO();
	
	ArrayList<Integer> productIdArray = new ArrayList<>();
	productIdArray.add(orderDao.returnInt(request.getParameter("cpu_buy")));
	productIdArray.add(orderDao.returnInt(request.getParameter("ram_buy")));
	productIdArray.add(orderDao.returnInt(request.getParameter("graphic_buy")));
	productIdArray.add(orderDao.returnInt(request.getParameter("ssd_buy")));
	productIdArray.add(orderDao.returnInt(request.getParameter("hdd_buy")));
	productIdArray.add(orderDao.returnInt(request.getParameter("power_buy")));
	productIdArray.add(orderDao.returnInt(request.getParameter("case_buy")));
	for(int i=0; i<productIdArray.size(); i++) {
		if(productIdArray.get(i) != 0)
			orderDao.BuyOne(memberId, productIdArray.get(i), 1);
		else
			continue;
	}
	response.sendRedirect("buylist.jsp");
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