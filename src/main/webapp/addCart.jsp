<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>상품주문</title>
</head>
<body>
<%
	String id = request.getParameter("u_id");
	
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> goodList = dao.getAllProducts();
	Product goods = new Product();
	for(int i=0; i<goodList.size(); i++) {
		/* 상품리스트 중에서 사용자 주문을 한 그 상품의 id가 일치하는 코드를 얻어서 Product에 대입 */
	 	goods = goodList.get(i);
	 	if(goods.getP_num().equals(id)) {
	 		break;
	 	}
	}
	
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	
	if(list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartlist",list);
	}
	
	int cnt = 0;
	Product goodsQnt = new Product();
	
	for(int i=0; i<list.size(); i++) {
		goodsQnt = list.get(i);
		if(goodsQnt.getP_num().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getP_type() + 1;
			goodsQnt.setP_type(orderQuantity);
		}
	}
	
	if (cnt == 0) {
		goods.setP_type(1);
		list.add(goods);
	}
	
	response.sendRedirect("product.jsp?id=" + id);
	
%>
</body>
</html>