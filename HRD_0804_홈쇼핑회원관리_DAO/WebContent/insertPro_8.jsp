<%-- JSP책 249p 참조!! --%>


<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="dbcon_2.jsp"%>  자바 DAO로 할거닌깐 없애 시발--%>

<%@ page import="member.*"%>

<%-- ★★★★순서 중요(1. UTF-8로 인코딩 후 -> 2. 속성에 값 저장 ) : 순서 바뀌면 한글이 깨져서 나옴--%>
<%-- 1. 먼저 인코딩 적용 후  --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%--클레스 member.MemberBeans id="beans"라는 간단한 이름으로 변경하여 사용하겠다!!
MemberBeans beans = new MemberBeans(); 과 같다!! scope="page는(기본값 생략가능)--%>
<jsp:useBean id="beans" class="member.MemberBeans" scope="page"></jsp:useBean>



<%-- 2. 전달된 매개변수 이름과 같은 이름의 속성에 전달되는 값 저장. --%>
<!-- MemberBeans객체에서 같은 이름의 속성(=멤버변수)에 전달된 값 저장 -->
<%--	insert_7.jsp로 부터 전달된 매개변수 이름과 MemberBeans객체에서 같은이름의 멤버변수	
		모든것을하면 java멤버변수 가져온다			name = memberBeans id이다 --%>
<jsp:setProperty property="*" name="beans"/>

<!-- 만들어진 객체를 이제 이용해보자 
	
-->
<%
	ShoppingDAO dao = new ShoppingDAO();
	dao.insertMember(beans);
%>
<script>
	alter("회원등록이 완료되었습니다.");
	location.href="select_9.jsp)"
</script>




