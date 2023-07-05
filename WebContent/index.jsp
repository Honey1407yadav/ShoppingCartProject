<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.utils.ConnectionProvider"%>
<%@page import="com.shop.dao.ProductDao"%>
<%@page import="com.shop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(ConnectionProvider.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to shopping cart</title>
<!-- CSS bootstrap -->
<%@include file="header.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="class-header my-3">All Products</div>
		<div class="row">
		<% 
		if(!products.isEmpty()){
			for(Product p:products){ %>
			
			<div class="col-md-3 my-3">
				<!-- card start -->
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="ProductImages/WomanShoe.jpg" //yha img dalna h <%=p.getImg() %> kr ke tb db se 1 1 kr ke yha img aayegi
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add to Cart </a> 
							<a href="order-now?quantity=1&id=<%=p.getId() %>" class="btn btn-primary">Buy Now</a>
						</div>
					</div>
				</div>
				<!-- card end -->

			</div>
			<% }
		}
		%>
		
		
				
			
		</div>
	</div>


	<!-- JS Bootstrap -->
	<%@include file="footer.jsp"%>
</body>
</html>
