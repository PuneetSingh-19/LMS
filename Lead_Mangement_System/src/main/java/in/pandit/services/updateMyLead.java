package in.pandit.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.pandit.persistance.DatabaseConnection;


@WebServlet("/updateMyLead")
public class updateMyLead extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String mobile = request.getParameter("mobile");
		String source = request.getParameter("source");
		String date = request.getParameter("date");
		String owner = request.getParameter("owner");
		String currentOwner = request.getParameter("currentOwner");
		String status = request.getParameter("status");
		String priority = request.getParameter("priority");
		
		try {
			Connection connect = DatabaseConnection.getConnection();
			
			
			// Inserting data into data base
			PreparedStatement stmt = connect.prepareStatement("update leads set name = ?, email = ?, address = ?, mobile = ?, source = ?, date = ?, owner = ?, currentOwner = ?, status = ?, priority = ? where email = ?");
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, address);
			stmt.setString(4, mobile);
			stmt.setString(5, source);
			stmt.setString(6, date);
			stmt.setString(7, owner);
			stmt.setString(8, currentOwner);
			stmt.setString(9, status);
			stmt.setString(10, priority);
			stmt.setString(11, email);
			int insert = stmt.executeUpdate();
		if(insert > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("updateMsg", "Data updated successfully");
			response.sendRedirect("myLeads.jsp");
			
		}
		else {
			pw.print("Something wrong with database");
		}
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
