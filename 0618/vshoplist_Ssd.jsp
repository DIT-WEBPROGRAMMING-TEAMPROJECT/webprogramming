<%@page import="java.text.DecimalFormat"%>
<%@page import="productPackege.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="productPackege.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
		.btn {
			
			background-color : #8b00ff;
			border : #8b00ff;
		}
		.btnspan {
			height : 86px;
			line-height : 86px;
		}
		.row {
			border : 1px solid #ccc;
		}
		.card-img {
			padding : 3px;
		}
	</style>
</head>
<body>
<%
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	ProductDAO productDAO = new ProductDAO();
		
	ArrayList<ProductDTO> dtos = productDAO.vshoplistSetting(4);
	
	for(ProductDTO dto : dtos) {%>
	<div class="row">
		<span style = "width : 86px">
			<img id="<%=dto.getName()%>_img" class="card-img rounded-0" src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" width="85" height="85">
		</span>
		<span style = "width : 430px">
			<h4><%=dto.getName()%></h2>
			<p><%=decimalFormat.format(dto.getPrice())%>&#8361;</p>
		</span>
		
		<span class = "btnspan" style = "width : 50px">
			<input id="<%=dto.getName()%>_<%=dto.getPrice()%>" type = "button" value = "선택" class = "btn btn-danger" onclick="tdSet(this.id)">
			<script type="text/javascript">
				//선택 누를 시 td안의 값 변경
				function tdSet(id) {
					var arrayId = id.split("_")
					$(parent.document).find('#tdSsdName').html(arrayId[0]);
					$(parent.document).find('#tdSsdPrice').html(arrayId[1]);
				}
			</script>
		</span>
	</div>
	<%} %>
</body>
</html>