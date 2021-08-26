<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="dbcon_2.jsp"%>

<%
	try{
		sql= "update member_tbl_02 set custname =? ,phone =? ,address =? ,joindate =? ,grade =?, city = ? where custno = ?";
		ps=con.prepareStatement(sql);
		
		ps.setString(1,request.getParameter("custname"));
		ps.setString(2,request.getParameter("phone"));
		ps.setString(3,request.getParameter("address"));
		ps.setString(4,request.getParameter("joindate"));
		ps.setString(5,request.getParameter("grade"));
		ps.setString(6,request.getParameter("city"));
		ps.setString(7,request.getParameter("custno"));
		
		ps.executeUpdate();
		%>
		<script>
		alert("회원수정이 완료되었습니다");
		location.href="select_9.jsp";
		</script>
		
		<%
	}catch(Exception e){
		%>
		<script>
		alert("회원수정에 실패되었습니다");
		history.back();
		</script>
		
		<%
	}finally{
		try{
			if(con != null)con.close();
			if(stmt != null)stmt.close();
			if(ps != null)ps.close();
			if(rs != null)rs.close();
			
		}catch(Exception e){
			
		}
	}

%>



