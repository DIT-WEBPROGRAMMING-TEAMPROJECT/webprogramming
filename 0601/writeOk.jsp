<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dao" class="boardPackege.BoardDAO"/>
<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩, 받아올 때 꼭
%>

<jsp:useBean id="dto" class="boardPackege.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%	// dato를 사용한 트랜젝션
	int cnt = dao.insert(dto);
%>

<% if (cnt == 0) { %>
	<script>
		alert("등록 실패!!!!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록성공, 리스트를 출력합니다");
		location.href = "list.jsp";
	</script>
<% } %>