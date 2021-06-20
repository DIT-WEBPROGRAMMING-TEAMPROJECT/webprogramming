<%@page import="boardPackege.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%	
	request.setCharacterEncoding("utf-8");
	
	String memberId = (String)session.getAttribute("sessionId");
	String content = request.getParameter("content");
	int productId = Integer.parseInt(request.getParameter("productId"));
	// productId session으로 받아오기
	
	BoardDAO boardDao = new BoardDAO();
	boardDao.boardInsert(memberId, productId, content);
	
	response.sendRedirect("review.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

</body>
</html>