<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("memberid");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String prouduct=request.getParameter("prouductid");
	
	if(writer==null||writer.length()==0||
	   	 title==null||title.length()==0||
	   	 content==null||content.length()==0){
%>
	<script>
		alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
		history.back();
	</script>
<%
		return;
	}
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	try(
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1","yuseong","1111");
			Statement stmt=con.createStatement();
	){
		String curTime=LocalDate.now()+" "+LocalTime.now().toString().substring(0,8);
		stmt.executeUpdate(String.format("insert into board"+"(memberid,prouductid,title, content,regtime)"+"values('%s',0,'%s','%s',0)",prouduct,title,content,curTime));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("list.jsp");
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