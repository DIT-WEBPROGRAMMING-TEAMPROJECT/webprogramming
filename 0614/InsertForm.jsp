<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>

</head>
<body>
	 <form action="InsertPro.jsp">
	 	<div>
	 		<p>productId</p>
	 		<input type="text" id="productId" name="productId">
	 	</div>
	 	<div>
	 		<p>productCode</p>
	 		<input type="text" id="productCode" name="productCode">
	 	</div>
	 	<div>
	 		<p>name</p>
	 		<input type="text" id="name" name="name">
	 	</div>	 	
	 	<div>
	 		<p>info</p>
	 		<input type="text" id="info" name="info">
	 	</div>	 	
	 	<div>
	 		<p>Detailed</p>
	 		<input type="text" id="Detailed" name="Detailed">
	 	</div>	 	
	 	<div>
	 		<p>Thumbnail</p>
			<input type="file" name="Thumbnail"><br><br>
	 	</div>	 	
	 	<div>
	 		<p>price</p>
	 		<input type="text" id="price" name="price">
	 	</div>	 	
	 	<div>
	 		<p>stock</p>
	 		<input type="text" id="stock" name="stock">
	 	</div>	 	
	 	<br>
	 	
		<button type="submit">등록</button>
	</form>

</body>
</html>
