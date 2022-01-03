<%@page import="DBConnection.Dbcon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    user pass = (user) request.getSession().getAttribute("pass");
    if(pass != null){
    	request.setAttribute("pass", pass);
    }
    %>
<!DOCTYPE html>
<html>
<head>

<title>Welcome to Shopping Cart</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
	<%@include file="includes/navbar.jsp" %>
	
	<%@include file="includes/footer.jsp" %>
</body>
</html>