<%@page import="memberPackege.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 수정 alert 비밀번호, 아이디 틀린거
	int check;
	String id = request.getParameter("login_id");
	String pwd = request.getParameter("login_pwd");
	
	MemberDAO dao = new MemberDAO();
	
	check = dao.Login(id, pwd);
	
	if(check != 1)	//1이 아닐 시 로그인 실패
		response.sendRedirect("LoginForm.jsp");
	else {	// 로그인 성공 -> 메인페이지 이동
		response.sendRedirect("MainPage.jsp");
			// 세션에 id 저장
		session.setAttribute("sessionId", id);
	}
		
	
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