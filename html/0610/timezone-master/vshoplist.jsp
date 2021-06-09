<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	
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
	<div class="row">
		<span style = "width : 86px">
			<img class="card-img rounded-0" src="assets/img/blog/single_blog_1.png" width="85" height="85">
		</span>
		
		<span style = "width : 430px">
			<h4>상품명</h2>
			<p>설명</p>
		</span>
		
		<span class = "btnspan" style = "width : 50px">
			<input type = "button" value = "선택" class = "btn btn-danger">
		</span>
	</div>

</body>
</html>