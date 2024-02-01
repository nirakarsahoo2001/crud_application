<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
header {
	padding: 30px;
	text-align: left;
	background: none;
	color: black;
	font-size: 20px;
	height: 40px;
	width: full;
}

a {
	background: blue;
	color: white;
	border-radius: 15px;
	padding: 5px;
	text-decoration: none;
	width: 350px;
	height: 10px;
}


i {
	background: blue;
	margin: 0px 20px 0px 50px;
	color: white;
	border-radius: 15px;
	padding: 5px;
	text-decoration: none;
	width: 350px;
	height: 5px;
}

#select {
	background: blue;
	color: white;
	border-radius: 15px;
	padding: 5px;
	text-decoration: none;
	width: 550px;
	height: 10px;
	background-text: red;
}

h2 {
	text-align: center;
}

table {
	width: 90%;
}
</style>
</head>
<body>
	<%
	
	String operation=request.getParameter("name");
	String select=" ";{
	if (operation.equals("First_Name")){
      select="First_name";
	}
	else if (operation.equals("Last_Name")){
	    select="Last_name";
	}
	else if (operation.equals("Email"))
		select ="Email";
	else if (operation.equals("Phone"))
		select="Phone";
	
	
	}
	
	String firstname = request.getParameter("user");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2j6m@123");
	Statement st = con.createStatement();

	String SQL = "select * from custmoer where "+ select +" like '" + firstname +"%'";
	ResultSet rs = st.executeQuery(SQL);
	%>

	<h2>Customer List</h2>
	<header>
		<a href="AddCustomer.html">Add Customer</a>
		<form action="SearchName.jsp">
		
		<p>search By::
   <input  type="radio" name="name" value="First_Name">First Name
   <input type="radio" name="name" value="Last_Name">Last Name
   <input type="radio" name="name" value="Email">Email
   <input type="radio"name="name" value="Phone">Phone
		
		
		
			<i> <input type="text" name="user" placeholder="Search ">
				<input type="submit"></i></p>
		</form>
	</header>
	<table cellpadding="20px" align="left" border="1">
		<th>First Name</th>
		<th>Last Name</th>
		<th>street</th>
		<th>Address</th>
		<th>City</th>
		<th>State</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Action</th>



		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getInt(8)%></td>
			<td><a href="Delete.jsp?First_Name=<%=rs.getString(1)%>">delete</a>
				<a href="Edit1.jsp?First_Name=<%=rs.getString(1)%>">edit</a></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>