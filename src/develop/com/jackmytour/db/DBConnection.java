package develop.com.jackmytour.db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
 
public class DBConnection {
	
  Connection connection = null;
  
  
 
  public void connect() {
 
		System.out.println("-------- MySQL JDBC Connection Testing ------------");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			//return;
		}
	 
		System.out.println("MySQL JDBC Driver Registered!");
		
	 
		try {
			//this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmt","root", "root");
			//this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmt","root", "ping2jmt");
			this.connection = createConnection();
	 	} catch (Exception e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			//return;
		}
	 
		if (this.connection != null) {
			System.out.println("Connection enstablished");
			
		} else {
			System.out.println("Failed to make connection!");
		}
	
  }
  
  public static Connection createConnection() throws SQLException{

      String driver = "com.mysql.jdbc.Driver";
      //String url    = "jdbc:mysql://localhost:3306/jmt";
      String url    = "jdbc:mysql://localhost:3306/jmt";
      String username = "jmt";
      String password = "ping2jmt";            // Change it to your Password
      System.setProperty(driver,"");

      return DriverManager.getConnection(url,username,password);

  }
  
  public Connection getConnection() { 
	  return this.connection;
  }
}