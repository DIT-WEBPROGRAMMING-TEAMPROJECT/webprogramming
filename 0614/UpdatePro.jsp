<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="shopPackege.ShopDAO" %>
<%@page import="shopPackege.ShopDTO" %>
<%
request.setCharacterEncoding("utf-8");
	
	ShopDTO dto=new ShopDTO(Integer.parseInt(request.getParameter("productId")),Integer.parseInt(request.getParameter("productCode")),
					request.getParameter("name"),request.getParameter("info"),
					request.getParameter("Detailed"),request.getParameter("Thumbnail"),
					Integer.parseInt(request.getParameter("price")),Integer.parseInt(request.getParameter("stock"))
				);
	ShopDAO dao=new ShopDAO();
	
int check = dao.Modification(dto);
	
	if(check != -1) { %>
		<script type="text/javascript">
			alert("수정되었습니다");
			location.href = "menu.jsp";
		</script>
<%	} else { %>
		<script type="text/javascript">
			alert("빈 칸을 확인해주세요");
			location.href = "UpdateForm.jsp";
		</script>
<%	}%>
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