<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ProductRepository" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
		<%@ include file="menu.jsp" %>
		
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					상품 정보
				</h1>
			</div>
		</div>
		
		<%
 			String prodnum = request.getParameter("p_num");
 			Product product = productDAO.getProductById(prodnum);	
		%>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h3><%=product.getP_name() %></h3>
					<p><%=product.getP_desc() %>
					<p><b>상품 코드: </b>
					<span class="bagde badge-danger">
						<%=product.getP_num() %>
					</span>
<%-- 					<p><b>분류: </b><%=product.getCategory() %> --%>
					<p><b>재고: </b><%=product.getP_quan() %>
					<h4><%=product.getP_price() %>원</h4>
					<p><a href="#" class="btn btn-info">상품 주문  &raquo;</a>
					<a href="./Products.jsp" class="btn btn-secondary">상품 목록  &raquo;</a>
				</div>
			</div>
			<hr>
		</div>
		
		<%@ include file="footer.jsp" %>
</body>
</html>