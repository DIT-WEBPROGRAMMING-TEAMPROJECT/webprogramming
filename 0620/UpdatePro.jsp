<%@page import="productPackege.ProductDAO"%>
<%@page import="productPackege.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
	
ProductDTO dto = new ProductDTO(Integer.parseInt(request.getParameter("prouductid")), Integer.parseInt(request.getParameter("productcode")), request.getParameter("name"), request.getParameter("detailed"), request.getParameter("thumbnail"), Integer.parseInt(request.getParameter("price")), Integer.parseInt(request.getParameter("stock")));
ProductDAO shopDao=new ProductDAO();

shopDao.Registration(dto);
response.sendRedirect("admin.jsp");
	
int check = shopDao.Modification(dto);
	
	if(check != -1) { %>
		<script type="text/javascript">
			alert("수정되었습니다");
			location.href = "admin.jsp";
		</script>
<%	} else { %>
		<script type="text/javascript">
			alert("빈 칸을 확인해주세요");
			location.href = "adminupdate.jsp";
		</script>
<%	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>