<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
<% 
String First_Name=request.getParameter("First_Name");



Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2j6m@123");
PreparedStatement ps = con.prepareStatement("delete from custmoer where First_Name=? ");

ps.setString(1,First_Name);


ps.execute();

RequestDispatcher rd=request.getRequestDispatcher("assignment.jsp");
rd.forward(request, response);

%>
</body>
</html>