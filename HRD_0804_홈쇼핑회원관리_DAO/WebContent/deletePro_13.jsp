<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	try{
		sql= "delete form member_tbl_02 where custno = ?";
		 
		ps=con.prepareStatement(sql);

		ps.setString(1,request.getParameter("custno"));
		
		ps.executeUpdate();
		%>
		<script>
		alert("삭제가 완료되었습니다");
		location.href="select_9.jsp";
		</script>
		
		<%
	}catch(Exception e){
		%>
		<script>
		alert("삭제가 실패되었습니다");
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



