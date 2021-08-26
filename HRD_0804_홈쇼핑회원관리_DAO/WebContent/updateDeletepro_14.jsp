<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="dbcon_2.jsp"%> --%>
<%@ page import="member.*"%>


<%
	request.setCharacterEncoding("UTF-8"); /* 한글깨짐 */
%>
<jsp:useBean id="beans" class="member.MemberBeans" />
<jsp:setProperty property="*" name="beans" />


<%
	ShoppingDAO dao = new ShoppingDAO();

	//
	
switch (request.getParameter("pro")) {
	case "update_10" :
		dao.updateMember(beans);
	//성공알림창
%>
<script>
	alert("회원정보수정이 완료되었습니다.");
	location.href = "select_9.jsp";
</script>
<%
	break;

	case "delete" :
		dao.deleteMember(beans);
	//성공알림창
%>
<script>
	alert("회원삭제가 완료되었습니다.");
	location.href = "select_9.jsp";
</script>
<%
	break;

	}
%>



