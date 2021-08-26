<%@page import="java.beans.Beans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function check(){
		if(f.custno.value == ""){
			alert("회원번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		
		if(f.custname.value == ""){
			alert("회원성명이 입력되지 않았습니다.");
			return f.custname.focus();
		}
		
		if(f.phone.value == ""){
			alert("회원번호가 입력되지 않았습니다.");
			return f.phone.focus();
		}
		
		if(f.address.value == ""){
			alert("회원주소가 입력되지 않았습니다.");
			return f.address.focus();
		}
		
		if(f.joindate.value == ""){
			alert("가입일자가 입력되지 않았습니다.");
			return f.joindate.focus();
		}
		
		if(f.grade.value == ""){
			alert("회원등급 입력되지 않았습니다.");
			return f.grade.focus();
		}
		
		if(f.grade.value != "A" && f.grade.value != "B" && f.grade.value != "C"){
			alert("회원등급 잘못 입력되었습니다.");
			return f.grade.select();
		}
		/* select 적었고 대문자 ABC만 출력하게 */
		if(f.city.value == ""){
			alert("도시코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		
		f.submit();
		
		
		
	}
</script>




<body>
	<%@ include file="header_3.jsp" %>
	<%@ page import="member.*" %>
	
	<%
		ShoppingDAO dao = new ShoppingDAO();
		MemberBeans beans = dao.getMaxCustnoJoindate();
	%>
	
	
	<section>
		<div>
			<h2>홈쇼핑 회원 등록</h2>
		</div>
		<form action="insertPro_8.jsp" name="f" method="post">
			<table border="1" width="600" style="margin: 0 auto">
			<tr>
				<th>회원번호(자동생성)</th>
				<td>
					<input type="text" name="custno" value="<%=beans.getCustno()%>" size="10" maxlength="6" readonly>
				</td>
				<!-- readonly 붙여야 자동완성이다 -->
					
			</tr>
			<tr>			
				<th>회원성명</th>
				<td>
					<input type="text" name="custname" value="" size="10" maxlength="20">
				</td>
				</tr>
			<tr>
				<th>회원전화</th>
				<td>
					<input type="text" name="phone" value="" size="30" maxlength="30">
				</td>
				</tr>
			<tr>
					
				<th>회원주소</th>
				<td>
					<input type="text" name="address" value="" size="30" maxlength="60">
				</td>
				</tr>
			<tr>
					
				<th>가입일자</th>
				<td>
					<input type="text" name="joindate" value="<%=beans.getJoindate()%>" size="10" maxlength="20" readonly>
				</td>
				</tr>
			<tr>
				
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td>
					<input type="text" name="grade" value="" size="10" maxlength="1">
				</td>
				</tr>
				
			<tr>
				
				<th>도시코드</th>
				<td>
					<input type="text" name="city" value="" size="10" maxlength="2">
				</td>
				</tr>
				
			<tr>
				
					<th colspan="2">
						<input type="submit" value="등록" size="8" onclick="check(); return false">
						<input type="button" value="조회" size="8" onclick="location='select_9.jsp'">
					</th>
				 </tr>
			</table>
		</form>


	</section>
	<%@ include file="footer_4.jsp" %>
</body>
</html>