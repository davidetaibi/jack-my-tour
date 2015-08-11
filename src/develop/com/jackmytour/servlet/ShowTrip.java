package develop.com.jackmytour.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import develop.com.jackmytour.core.Item;
import develop.com.jackmytour.db.DBConnection;

/**
 * Servlet implementation class ShowTrip
 */
@WebServlet("/showTrip")
public class ShowTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTrip() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//ArrayList<Item> selectedDrinks = (ArrayList<Item>) request.getAttribute("selectedDrinks");
		ArrayList<Item> selectedDrinks = new ArrayList<Item>();
		ArrayList<Item> selectedRestaurants = new ArrayList<Item>();
		ArrayList<Item> selectedSports = new ArrayList<Item>();
		ArrayList<Item> selectedMusics = new ArrayList<Item>();
		
		
		String trip_id = request.getParameter("trip_id");
		
		//=====
		DBConnection dbConnection = new DBConnection();
		dbConnection.connect();
		
		//SQL class connection (connection established)
		Connection connection = dbConnection.getConnection();

		PreparedStatement preparedStatement = null;
		// PreparedStatements
		try {
			preparedStatement = connection.prepareStatement("SELECT * FROM trip where tripId=?",Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, trip_id);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) { 
				String location = rs.getString("city");
				String from = rs.getString("startDate");
				from.replaceAll("-", "/");
				String to = rs.getString("endDate");
				to.replaceAll("-", "/");
				session.setAttribute("location", location);
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				
				//fake addresses list
				ArrayList<String> addresses = new ArrayList<String>();
				request.setAttribute("addresses",addresses);
				
			}
			
			//====================================
			
			preparedStatement = connection.prepareStatement("SELECT * FROM itemfortrip where tripId=?",Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, trip_id);
			
			ResultSet itemsId = preparedStatement.executeQuery();
			
			while(itemsId.next()) { 
				preparedStatement = connection.prepareStatement("SELECT * FROM item where itemId=?",Statement.RETURN_GENERATED_KEYS);
				preparedStatement.setInt(1, itemsId.getInt("itemId"));
				ResultSet items = preparedStatement.executeQuery();
				
				//ResultSet rs = preparedStatement.executeQuery();
				while(items.next()) { 
					// TODO: we still have to insert all the items properties (from APIs)					
					String name = items.getString("name");
		            String address = items.getString("address");
		            
		            //all the other properties
		            String type = items.getString("type");
		            
		            java.sql.Date fromDate = items.getDate("startDate");
		            java.sql.Date toDate = items.getDate("endDate");
		           
		            String frommm = fromDate.toString();
		            String tooo = toDate.toString();
		            String[] frommms = frommm.split("-");
		            String[] tooos = tooo.split("-");
		            
		            Calendar calFrom = Calendar.getInstance(); 
		            calFrom.set(Integer.parseInt(frommms[0]), 
		            		Integer.parseInt(frommms[1])-1,
		            		Integer.parseInt(frommms[2]));
		            
		            Calendar calTo = Calendar.getInstance(); 
		            calTo.set(Integer.parseInt(tooos[0]), 
		            		Integer.parseInt(tooos[1])-1,
		            		Integer.parseInt(tooos[2]));
		            
		            		            
		            String phoneNumber = items.getString("phoneNumber");
		            String duration = items.getString("duration");
		            		            
		            
		            Item newItem = new Item(name, address, phoneNumber, duration,
		            		calFrom, calTo, false,
		        			false, false, false, type,
		        			null, null);
		            
		            
		            if(type.equals("BAR"))
		            	selectedDrinks.add(newItem);
		            else if(type.equals("RES"))
		            	selectedRestaurants.add(newItem);
			            else if(type.equals("SPORT"))
			            	selectedSports.add(newItem);
				            else if(type.equals("MUSIC"))
				            	selectedMusics.add(newItem);
				            	
		            
		            
			}
			}
			
			
		} catch (Exception e) { e.printStackTrace(); }
			
		
		session.setAttribute("StartAddress", "");
		request.setAttribute("selectedRestaurants", selectedRestaurants);
		request.setAttribute("selectedDrinks", selectedDrinks);
		request.setAttribute("selectedSports", selectedSports);
		request.setAttribute("selectedMusics", selectedMusics);
		
		
		//request.setAttribute("food-duration", 5400000);
		//request.setAttribute("music-duration", 5400000);
		//request.setAttribute("sports-duration", 5400000);
		//request.setAttribute("drinks-duration", 5400000);
		
		RequestDispatcher rd = request.getRequestDispatcher("agenda2.jsp");		
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
