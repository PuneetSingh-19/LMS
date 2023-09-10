package in.pandit.persistance;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			String url = "jdbc:postgresql://localhost:5432/LMS";
			String user = "postgres";
			String pass = "1234@";
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, user, pass);
			if (conn != null) {
//				System.out.println("Database connected successfully");
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return conn;
	}
}
