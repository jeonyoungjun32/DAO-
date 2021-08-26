<%@page import="member.MemberBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.ShoppingDAO"%>
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
			<h2>회원목록조회/수정</h2>
		</div>
			<table border="1" width="900" style="margin: 0 auto">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
				<th>조회수</th>
			</tr>
			
			<%@ page import="java.util.*" %>
			<%@ page import="member.*" %>
			
			<%
				ShoppingDAO dao = new ShoppingDAO();
				List<MemberBeans> list =  dao.getMembers();   
				for(int i = 0;i<list.size();i++){
					MemberBeans beans=list.get(i);
			%>
				<tr align="center">
					<td><a href="update_10.jsp?custno=<%=beans.getCustno()%>"><%=beans.getCustno()%></a></td>    <!-- 이글자를 누르면 회원수정으로 들어간다 -->
					<td><%=beans.getCustno()%></td>
					<td><%=beans.getPhone()%></td>
					<td><%=beans.getAddress()%></td>
					<td><%=beans.getJoindate()%></td>
					<td><%=beans.getGrade()%></td>
					<td><%=beans.getCity()%></td>
				</tr>
				<%
				}
				%>
				
			</table>
		</form>


	</section>
	<%@ include file="footer_4.jsp"%>
</body>
</html>