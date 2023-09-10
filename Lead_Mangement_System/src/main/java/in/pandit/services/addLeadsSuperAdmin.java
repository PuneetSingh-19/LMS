package in.pandit.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.pandit.persistance.DatabaseConnection;


@WebServlet("/addLeadsSuperAdmin")
public class addLeadsSuperAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String mobile = request.getParameter("mobile");
		String source = request.getParameter("source").toLowerCase();
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String owner = request.getParameter("owner");
		String currentOwner = request.getParameter("currentOwner");
		String status = request.getParameter("status");
		String priority = request.getParameter("priority");
		
		try {
			Connection connect = DatabaseConnection.getConnection();
			
//			 Fetching max id from sign up table for auto increment id
			int count = 0;
			PreparedStatement st = connect.prepareStatement("select max(id) as id from leads");

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				count = rs.getInt("id");
			}
			
			
			// Inserting data into data base
			PreparedStatement stmt = connect.prepareStatement("insert into leads values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			stmt.setInt(1, ++count);
			stmt.setString(2, name);
			stmt.setString(3, email);
			stmt.setString(4, address);
			stmt.setString(5, mobile);
			stmt.setString(6, source);
			stmt.setString(7, date);
			stmt.setString(8, time);
			stmt.setString(9, owner);
			stmt.setString(10, currentOwner);
			stmt.setString(11, status);
			stmt.setString(12, priority);
			int insert = stmt.executeUpdate();
		if(insert > 0) {
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Lead added successfully');");
			pw.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("allLeadsSuperAdmin.jsp");
			rd.include(request, response);
			
		}
		else {
			pw.print("Something wrong with database");
		}
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
