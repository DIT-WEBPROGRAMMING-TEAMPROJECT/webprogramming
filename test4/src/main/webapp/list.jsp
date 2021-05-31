<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		table {width: 680px; text-align: center;}
		th {background-color: cyan;}
	
		.num {width: 80px;}
		.title {width: 80px;}
		.id {width: 100px;}
		.regtime{width: 180px;}
	
		a:link {text-decoration: none;color: blue;}
		a:visited {text-decoration: none;color: gray;}
		a:hover {text-decoration: none;color: red;}
	</style>
</head>
<body>
<table>
	<tr>
		<th class="productid">상품번호</th>
		<th class="title">제목</th>
		<th class="id">작성자</th>
		<th class="regtime">작성일</th>
		<th>조회수</th>
	</tr>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521/xepdb1";
	String user="yuseong";
	String passwd="1111";
	
	try(
	Connection con=DriverManager.getConnection(url,user,passwd);
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from board");){
	while(rs.next()){
%>
	<tr>
	 	<td><%=rs.getInt("num")%></td>
	 	<td style="text-align: left;">
	 		<a href="view.jsp?num=<%=rs.getInt("num") %>">
	 			<%=rs.getString("title") %>
	 		</a>
	 	</td>
	 	<td><%=rs.getString("memberid") %></td>
	 	<td><%=rs.getString("regtime") %></td>
	 	<td><%=rs.getString("productid") %></td>	
	 </tr>
<%}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</table>

<br>
<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
</body>
</html>