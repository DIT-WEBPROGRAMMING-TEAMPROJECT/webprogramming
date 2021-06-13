<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="shopPackege.*"%>
<%
	ShopDTO dto=new ShopDTO();
	ShopDAO dao=new ShopDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="UpdatePro.jsp">
	 	<div>
	 		<p>productId</p>
	 		<input  id="productId" name="productId" value="<%=dto.getProductId()%>>" readonly>
	 	</div>
	 	<div>
	 		<p>productCode</p>
	 		<input id="productCode" name="productCode" value="<%=dto.getProductCode()%>" readonly>
	 	</div>
	 	<div>
	 		<p>name</p>
	 		<input id="name" name="name" value="<%=dto.getName()%>>" readonly>
	 	</div>	 	
	 	<div>
	 		<p>info</p>
	 		<input type="text" id="info" name="info"value="<%=dto.getInfo()%>>">
	 	</div>	 	
	 	<div>
	 		<p>Detailed</p>
	 		<input type="text" id="Detailed" name="Detailed" value="<%=dto.getDetailed()%>>">
	 	</div>	 	
	 	<div>
	 		<p>Thumbnail</p>
			<input type="image" name="Thumbnail" id="Thumbnai" value="<%=dto.getThumbnail()%>>"readonly><br><br>
	 	</div>	 	
	 	<div>
	 		<p>price</p>
	 		<input type="text" id="price" name="price" value="<%=dto.getPrice()%>>">
	 	</div>	 	
	 	<div>
	 		<p>stock</p>
	 		<input type="text" id="stock" name="stock" value="<%=dto.getStock()%>>">
	 	</div>	 	
	 	<br>
	 	
		<button type="submit">수정</button>
	</form>
</body>
</html>