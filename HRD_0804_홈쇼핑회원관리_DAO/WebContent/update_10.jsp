<%@page import="oracle.net.aso.l"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkUpdate(){
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
	f.pro.value="update";
	f.submit();
}
	 function checkDelete() {
	 if(f.custno.value == ""){
			alert("회원번호가 입력되지 않았습니다.");
			return f.custno.focus();
	 }
	 if(confirm("회원을 삭제하시겠습니까?") == true){  /* 참이면 중괄로 안에있는걸 실행 */
			// f.action="updatePro_11.jsp"
			f.pro.value="delete";
			f.submit();
	 }else return;
	 
}
</script>
<body>
	<%@ include file="header_3.jsp" %>
	<%@ page import="member.*" %>
		
	<%
	String custno = request.getParameter("custno");
	
	ShoppingDAO dao = new ShoppingDAO();
	MemberBeans beans = dao.getMember(custno);  
	%>	
	
	<section>
		<div>
			<h2>홈쇼핑 회원 등록</h2>
		</div>
		<form action="updateDeletepro_14.jsp" name="f" method="post">
		<input type="hidden" name="pro" value="">
		<!-- hidden 숨기다  -->
			<table border="1" width="600" style="margin: 0 auto">
			<tr>
				<th>회원번호(자동생성)</th>
				<td>
					<input type="text" name="custno" value="<%=beans.getCustno()%>" size="10" maxlength="6" readonly="readonly">
				</td>
				<!-- readonly 붙여야 자동완성이다 					여기 수정해야돼 ㅠㅠㅠ힝...-->
					
			</tr>
			<tr>			
				<th>회원성명</th>
				<td>
					<input type="text" name="custname" value="<%=beans.getCustname()%>" size="10" maxlength="20">
				</td>
				</tr>
			<tr>
				<th>회원전화</th>
				<td>
					<input type="text" name="phone" value="<%=beans.getPhone()%>" size="30" maxlength="30">
				</td>
				</tr>
			<tr>
					
				<th>회원주소</th>
				<td>
					<input type="text" name="address" value="<%=beans.getAddress()%>" size="30" maxlength="60">
				</td>
				</tr>
			<tr>
					
				<th>가입일자</th>
				<td>
					<input type="text" name="joindate" value="<%=beans.getJoindate()%>" size="10" maxlength="20" readonly="readonly">
				</td>
				</tr>
			<tr>
				
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td>
					<input type="text" name="grade" value="<%=beans.getGrade()%>" size="10" maxlength="1">
				</td>
				</tr>
			<tr>
				
				<th>도시코드</th>
				<td>
					<input type="text" name="city" value="<%=beans.getCity()%>" size="10" maxlength="2">
				</td>
				</tr>
			<tr>
				
					<td style="text-align: center;" colspan="2">
						<input type="submit" value="수정" size="8"	onclick = "checkUpdate(); return false">
						<input type="button" value="조회"size="8"	 onclick = "location='select_9.jsp'">
						<input type="submit" value="삭제" size="8"	onclick = "checkDelete(); return false">
						<input type="reset" value="다시쓰기">
					</td>
				 </tr>
			</table>
		</form>


	</section>
	<%@ include file="footer_4.jsp" %>
</body>
</html>