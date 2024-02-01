package com.assignment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String loginId = req.getParameter("loginId");
		String password = req.getParameter("password");
		if (loginId.equals("test@sunbasedata.com") && password.equals("Test@123")) {
			RequestDispatcher rd = req.getRequestDispatcher("assignment.jsp");
			rd.forward(req, resp);
		} else {
			PrintWriter pw = resp.getWriter();
			pw.print("<h1>Invalid credentials</h1>");
			RequestDispatcher rd = req.getRequestDispatcher("login.html");
			rd.include(req, resp);
		}
	}
}
