<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%@ include file="header_3.jsp" %>


	<section>
		<div>
			<h2>회원매출조히</h2>
		</div>
			<table border="1" width="900" style="margin: 0 auto">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%@ page import="java.util.*" %>
			<%@ page import="member.*" %>
			
			<%
				ShoppingDAO dao = new ShoppingDAO();
			
				List<SelesBeans> list =  dao.getSeles();   
				
				for(int i = 0;i<list.size();i++){
					SelesBeans beans=list.get(i);
			%>
				<tr align="center">
					<td><%=beans.getCustno()%></a></td>    <!-- 이글자를 누르면 회원수정으로 들어간다 -->
					<td><%=beans.getCustname()%></a></td>    <!-- 이글자를 누르면 회원수정으로 들어간다 -->
					<td><%=beans.getGrade()%></td>
					<td><%=beans.getTotalprice() %>
				</tr>
				<%
				}
				%>
				
			</table>


	</section>
	<%@ include file="footer_4.jsp"%>
</body>
</html>