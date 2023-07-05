<%@page import="java.util.*"%>
<%@page import="com.shop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%
   User auth = (User) request.getSession().getAttribute("auth");
    if(auth!=null){
    	response.sendRedirect("index.jsp");
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
    	request.setAttribute("cart_list", cart_list);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to login page</title>
<!-- CSS bootstrap -->
<%@include file="header.jsp"%>
</head>
<body>
<%@include file="navbar.jsp" %>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<div class="card-header text-center">User login</div>
					</div>
					<div class="card-body">
						<form action="user-login" method="post">
							<div class="form-group">
								<label>Email Address</label> <input name="login-email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									class="form-control" name="login-password" required="required"
									placeholder="Enter Password" id="exampleInputPassword1">
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- JS Bootstrap -->
	<%@include file="footer.jsp"%>
</body>
</html>