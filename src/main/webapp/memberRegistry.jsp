<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.DriverManager"%>
<%@page errorPage="error.jsp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사용자정보 등록</title>
</head>
<body>

<%

	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("u_id");
	String name = request.getParameter("u_name");
	String u_pw = request.getParameter("u_pw");
	String phone = request.getParameter("u_phone");
	String email = request.getParameter("u_email");
	String zip_code = request.getParameter("zip_code");
	String address = request.getParameter("u_address");
	String u_useyn = request.getParameter("u_useyn");
	//String gender = request.getParameter("gender");
	
	String url = "jdbc:mariadb://192.168.1.216:3306/shopDB";
	String user = "shopManager";
	String pwd = "1234";
	
	Connection con = null;
	Statement stmt = null;
	
	try{
		
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection(url, user, pwd);
		
		//insert into tbl_member (userid,username,password,telno,email,regdate)
		//values (?,?,?,?,?,?)
	
		LocalDateTime now = LocalDateTime.now(); //정확한 현재시간
		String regdate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		String query = "insert into tbl_member "
				+"(u_id,u_pw,u_name,u_email,zip_code,u_address,u_phone,u_useyn,u_regdate) "
				+"values ('"+id+"','"+u_pw
				+"','"+name+"','"+email+"','"
				+zip_code + "','" + address + "','" +phone + "','"+ u_useyn + "','"+ regdate +"')";
		//System.out.println(query); 정상적으로 됐나 확인하기
		
		stmt = con.createStatement();
		stmt.executeUpdate(query);
		stmt.close();
		con.close();
		response.sendRedirect("index.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		stmt.close();
		con.close();
	}
	
%>

	
</body>
</html>