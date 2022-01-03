
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbcon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
user pass = (user) request.getSession().getAttribute("pass");
if (pass != null) {
	request.setAttribute("pass", pass);
}

ProductDao pra = new ProductDao(Dbcon.getConnection());
List<Product> product = pra.getAllProduct();
%>


<!DOCTYPE html>
<html>
<head>

<title>Welcome to Shopping Festival!</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="card header my-3">All Products</div>
		<div class="row">

			<%
			if (!product.isEmpty()) {
				for (Product p : product) {
			%>
			<div class="col-md-3 my-3 ">
				<div class="card w-100" style="width: 18rem;">
					<img src=<%= p.getImage() %> class="card-img-top" alt="card image">
					<div class="card-body">
						<h5 class="name">Name: <%= p.getName() %></h5>
						<h6 class="category">Category: <%= p.getCategory()%></h6>
						<h6 class="price">prize: <%= p.getPrice() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="#" class="btn btn-primary">Add to Cart</a> <a href="#"
								class="btn btn-primary">Buy Now</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>


		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
