<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String Street = request.getParameter("Street");
String Address = request.getParameter("Address");
String City = request.getParameter("City");
String State = request.getParameter("State");
String Email = request.getParameter("Email");
String Phone = request.getParameter("Phone");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2j6m@123");
PreparedStatement ps = con.prepareStatement(
		"update custmoer set First_Name=?,Last_Name=?,Street=?,Address=?,City=?,State=?,Phone=? where Email=?");

ps.setString(1, firstname);
ps.setString(2, lastname);
ps.setString(3, Street);
ps.setString(4, Address);
ps.setString(5, City);
ps.setString(6, State);
ps.setInt(7, Integer.parseInt(Phone));
ps.setString(8, Email);
ps.execute();

RequestDispatcher rd=request.getRequestDispatcher("assignment.jsp"); 
rd.forward(request, response);

%>
</body>
</html>