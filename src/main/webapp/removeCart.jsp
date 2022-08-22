<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<% 
	String prodnum = request.getParameter("p_num");
	if(prodnum == null || prodnum.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(prodnum);
	if(product == null){
		response.sendRedirect("exceptionnoProductId.jsp");
	}
	
	ArrayList<Product> cartList1 = (ArrayList<Product>) session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for( int i = 0; i < cartList1.size(); i++){
		goodsQnt = cartList1.get(i);
		if(goodsQnt.getP_num().equals(prodnum)) {
			cartList1.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>