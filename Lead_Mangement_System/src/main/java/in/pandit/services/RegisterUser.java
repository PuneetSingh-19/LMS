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
import javax.servlet.http.HttpSession;

import in.pandit.persistance.DatabaseConnection;


@WebServlet("/RegisterUsers")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String Admin = "false";
		String SuperAdmin = "false";
		
		try {
			Connection connect = DatabaseConnection.getConnection();
			
//			 Fetching max id from sign up table for auto increment id
			int count = 0;
			PreparedStatement st = connect.prepareStatement("select max(id) as id from users");

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				count = rs.getInt("id");
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("totalLeads", count);
			
			
			// Inserting data into data base
			PreparedStatement stmt = connect.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?, ?)");
			stmt.setInt(1, ++count);
			stmt.setString(2, username);
			stmt.setString(3, email);
			stmt.setString(4, mobile);
			stmt.setString(5, password);
			stmt.setString(6, Admin);
			stmt.setString(7, SuperAdmin);

			int status = stmt.executeUpdate();
		if(status > 0) {
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('You have registered successfully');");
			pw.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
