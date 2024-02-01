<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
<style type="text/css">
#submit{
	margin-top: 10px ;
	margin-left:700px;
	width: 150px;
	border: none;
	cursor: pointer;
	height: 30px;
	color:white;
	text-align:center;
	border-radius: 10px;
	background-color:blue;
	
}
input{
margin:20px 30px 10px 100px;
width:300px;
}
</style>
</head>
<body>
<%
String Email=request.getParameter("Email");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2j6m@123");
PreparedStatement ps = con.prepareStatement("select First_Name ,Last_Name,Street,Address,City,State,Email,Phone from custmoer where Email=?");
ps.setString(1,Email);
ResultSet rs=ps.executeQuery();
rs.next();
%>

<form action=".jsp">
  <input type="text" name="firstname" value="<%=rs.getString(1)%>">
<input type="text" name="lastname" value="<%=rs.getString(2)%>" placeholder="LastName"><br>
<input type="text" name="Street" value="<%=rs.getString(3)%>"  placeholder="Street">
<input type="text" name="Address" value="<%=rs.getString(4)%>" placeholder="Address" ><br>
<input type="text" name="City" value="<%=rs.getString(5)%>" placeholder="City">
<input type="text" name="State" value="<%=rs.getString(6)%>" placeholder="state" ><br>
<input type="text" name="Email" value="<%=rs.getString(7)%>" placeholder="Email">
<input type="number" name="Phone" value="<%=rs.getInt(8)%>" placeholder="Phone "  readonly="true" ><br>

<input id="submit" type="submit">
</form>
</body>
</html>