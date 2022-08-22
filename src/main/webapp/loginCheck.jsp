<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 체크</title>
</head>
<body>


<%
	
	request.setCharacterEncoding("utf-8");

	//로그인 창에서 파라미터로 받은 값
	String id = request.getParameter("u_id");
	String u_pwd = request.getParameter("u_pwd");
	
	//DB에서 사용자 정보(아이디랑 패스워드 가져오기) 페이지당 계속 가져와야됨... 다음 페이지 연결이 안돼서...DB접속할때마다..
	String url = "jdbc:mariadb://192.168.1.216:3306/shopDB";
	String user = "shopManager";
	String pwd = "1234";
	
	Connection con = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;//일회용이라 다시 못씀. 그래서 2개 만듦
	
	int id_count =0;
	int pwd_count =0;
	
// 	LocalDateTime now = LocalDateTime.now(); //정확한 현재시간을 뽑아주는 역할
// 	String lastlogindate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	String lastlogindate = LocalDateTime.now().toString();
	
	//존재하는 아이디 인지 확인하기
	String query1 = "select count(*) as id_count from user_table where id = '" + id + "'";
	//패스워드가 틀렸는지 확인
	String query2 = "select count(*) as id_count from user_table where id = '" 
	+ id + "' and pwd='" 
	+ u_pwd + "'";
	//마지막 접속시간 등록
	String query3 = "update user_table set lastlogindate = '" + lastlogindate + "' where id = '" 
	+ id + "'";
	String query4 = "insert into user_table_log (id,lastlogindate) values ('" 
	+ id + "','" + lastlogindate + "')";
	
	try{
		
		Class.forName("org.mariadb.jdbc.Driver"); //드라이버는 한번만 엶.
		con = DriverManager.getConnection(url, user, pwd);
		
		stmt1 = con.createStatement();
		stmt2 = con.createStatement();
		
		rs1 = stmt1.executeQuery(query1);
		rs2 = stmt2.executeQuery(query2);
		
		while(rs1.next()) id_count = rs1.getInt("id_count");
		while(rs2.next()) pwd_count = rs2.getInt("id_count");
		
		//아이디가 존재하고 패스워드도 틀리지 않은 사용자
		if(id_count != 0 && pwd_count != 0){
			
			// session.setMaxInactiveInterval(3600*7); 7일간 세션유지
			session.setAttribute("id", id);//세션 생성
			
			stmt3 = con.createStatement();
			stmt3.executeUpdate(query3);
			
			stmt4 = con.createStatement();
			stmt4.executeUpdate(query4);
			
			stmt1.close();
			stmt2.close();
			stmt3.close();
			stmt4.close();
			rs1.close();
			rs2.close();
			con.close();
			
// 			Locale locale = request.getLocale();
			
// 			String lang = locale.getLanguage();
			
			response.sendRedirect("welcome.jsp");
		}else if (id_count == 0){//아이디가 존재하지 않는 사용자
			
			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();
			con.close();
%>

	<script>
	
		alert("사용자가 존재하지 않습니다");
		document.location.href='/index.jsp';
		
	</script>	

<%
		}else if(id_count != 0 && pwd_count ==0){ //아이디는 있으나 패스워드가 틀린 사용자
			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();
			con.close();
		
%>

	<script>
	
		alert("패스워드를 잘못 입력했습니다.");
		document.location.href='/index.jsp';
		
	</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
		
	}

%>

</body>
</html>