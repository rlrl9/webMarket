<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<%
	
	String userid = (String) session.getAttribute("u_id");
	session.invalidate(); //모든 세션 종료 ->로그아웃..

%>

<h1><%=userid %>님 안녕히 가세요. </h1>
<h1>다시 <a href="index.jsp">로그인</a></h1>
</body>
</html>