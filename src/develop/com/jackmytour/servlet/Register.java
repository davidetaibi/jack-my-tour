package develop.com.jackmytour.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import develop.com.jackmytour.db.DBConnection;

/**
 * Sign up servlet
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	//private ResultSet resultSet = null;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//catch registration form parameters
		String name = request.getParameter("name");
		String surName = request.getParameter("surname");
		String email = request.getParameter("email");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		//custom connection with mysql jdbc driver to jmt db
		DBConnection dbConnection = new DBConnection();
		dbConnection.connect();
		
		//SQL class connection (connection established)
		Connection connection = dbConnection.getConnection();
		
		// PreparedStatements
	    try {
			preparedStatement = connection.prepareStatement("insert into traveller values (default, ?, ?, ?, ? , ?, ?, ?, ?,?)");
			preparedStatement.setString(1, name);
		    preparedStatement.setString(2, surName);
		    preparedStatement.setString(3, email);
		    preparedStatement.setString(4, userName);
		    preparedStatement.setString(5, password);
		    preparedStatement.setString(6, "Bolzano");
		    preparedStatement.setDate(7, new java.sql.Date(2009, 12, 11));
		    preparedStatement.setString(8, "blabla");
		    preparedStatement.setString(8, "blabla");
		    preparedStatement.setNull(9, java.sql.Types.VARCHAR);
		    preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    } finally { 
	    	// TODO implement close() Connection method
	    	//close();
	    	System.out.println("new traveller registered");
	    }
	    
	    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");		
		rd.forward(request, response);
    }

}
