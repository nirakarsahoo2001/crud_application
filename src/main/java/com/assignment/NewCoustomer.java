package com.assignment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewCustomer")
public class NewCoustomer extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String First_Name = req.getParameter("First_Name");
		String Last_Name = req.getParameter("Last_Name");
		String Street = req.getParameter("Street");
		String Address = req.getParameter("Address");
		String City = req.getParameter("City");
		String State = req.getParameter("State");
		String Email = req.getParameter("Email");
		String Phone = req.getParameter("Phone");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2j6m@123");
			PreparedStatement ps = con.prepareStatement(
					"insert into custmoer (First_Name,Last_Name,Street,Address,City,State,Email,Phone) values(?,?,?,?,?,?,?,?)");

			ps.setString(1, First_Name);
			ps.setString(2, Last_Name);
			ps.setString(3, Street);
			ps.setString(4, Address);
			ps.setString(5, City);
			ps.setString(6, State);
			ps.setString(7, Email);
			ps.setInt(8, Integer.parseInt(Phone));

			ps.execute();

			RequestDispatcher rd = req.getRequestDispatcher("assignment.jsp");
			rd.forward(req, resp);
		

		} catch (ClassNotFoundException e) {
          e.printStackTrace();
          
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
