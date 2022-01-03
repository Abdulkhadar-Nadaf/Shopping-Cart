<%@page import="DBConnection.Dbcon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    user pass = (user) request.getSession().getAttribute("pass");
    if(pass != null){
    	response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>

<title>Welcome to Login Page</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp" %>


	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="LoginServlet" method="post">

					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="Login-mail"
							placeholder="Enter Your Mail ID" required>
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password" class="form-control"
							name="Login-password" placeholder="Enter Your Password" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>