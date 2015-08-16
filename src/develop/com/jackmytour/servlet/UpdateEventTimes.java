package develop.com.jackmytour.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import develop.com.jackmytour.db.DBConnection;

/**
 * Servlet implementation class UpdateEventTimes
 */
@WebServlet("/UpdateEventTimes")
public class UpdateEventTimes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventTimes() {
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
		
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		String eventId = request.getParameter("eventId");
		
		DBConnection dbConnection2 = new DBConnection();
		dbConnection2.connect();
		Connection connection2 = dbConnection2.getConnection();
		String insertionQuery = "UPDATE item SET startDate=?,endDate=? WHERE itemId=?;";
        PreparedStatement stmt = null;           
        
        try {
        	stmt = connection2.prepareStatement(insertionQuery); 
        	
        	
        	//seen it is a string, use setString() or change the column type to TIMESTAMP.
        	
        	
//        	java.sql.Date startD = new java.sql.Date(Long.parseLong(startDate));
//        	java.sql.Date endD = new java.sql.Date(Long.parseLong(endDate));
////        	String startD = new Date(Long.parseLong(startDate)).toString();
////        	String endD = new Date(Long.parseLong(endDate)).toString();
        	
        	
        	Date startD = new Date(Long.parseLong(startDate));
        	java.text.SimpleDateFormat sdfStart = 
        	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	String startDStr = sdfStart.format(startD);
        	
        	Date endD = new Date(Long.parseLong(endDate));
        	java.text.SimpleDateFormat sdfEnd = 
        	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	String endDStr = sdfEnd.format(endD);
        
//        	System.err.println("eventId <itemId> = " + eventId + 
//        					 "\nreceived startDate from UpdateEventTimes = " + startDate +
//        			         "\nreceived endDate from UpdateEventTimes   = " + endDate +
//        			         "\nUpdateEventTimes startDStr = " + startDStr +
//        					 "\nUpdateEventTimes   endDStr = " + endDStr);
        	
        	
        	
//        	stmt.setDate(1,  startD);
//			stmt.setDate(2, endD); 
        	stmt.setString(1, startDStr);
        	stmt.setString(2, endDStr);
			//System.out.println("the end date to be updated when times are known: " + new java.sql.Date(Long.parseLong(endDate)).toString());
			stmt.setString(3, String.valueOf(eventId));
			stmt.executeUpdate();
			
			
		} catch (Exception e) { e.printStackTrace();	}
		
	}

}
