<%@page import="boardPackege.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	request.setCharacterEncoding("utf-8");

	String memberId = (String)session.getAttribute("sessionId");	
	String content = request.getParameter("content");
	
	// productId session으로 받아오기
	int productId = 1;
	
	BoardDAO boardDao = new BoardDAO();
	boardDao.boardInsert(memberId, productId, content);
	
	response.sendRedirect("review.jsp");
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