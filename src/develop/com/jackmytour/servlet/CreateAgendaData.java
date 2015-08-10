package develop.com.jackmytour.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import develop.com.jackmytour.core.Item;
import develop.com.jackmytour.core.Restaurant;
import develop.com.jackmytour.db.DBConnection;

/**
 * Servlet implementation class CreateAgendaData
 */
@WebServlet("/createAgenda")
public class CreateAgendaData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> addresses;
	private ArrayList<Integer> itemsForTrip = new ArrayList<Integer>();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAgendaData() {
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
				
		addresses = new ArrayList<String>();
		
		//retrieve the UUID of the selected items in the activities.jsp checkbox
		// these UUID will be now used to retrieve the items to be inserted in the trip
	    
		// TODO create list of selected items with their UUID
		// TODO drop not chosen item using their UUID 
		// TODO store real item in table
		// TODO save trip with all its attributes  storeTrip()
		
		String[] rests = request.getParameterValues("rests");
		String[] drinks =request.getParameterValues("drinks");
		
		String[] musics=request.getParameterValues("musics");
		String[] sports=request.getParameterValues("sports");
		
		if(rests != null) {
			//createAddressList(rests);
			ArrayList<Item> selectedRestaurants = storeItem(rests);
			//ArrayList<Item> selectedRestaurants = parseFields(rests);
			request.setAttribute("selectedRestaurants", selectedRestaurants);
			
		}
		
		if(drinks != null) {
			//createAddressList(drinks);
			//ArrayList<Item> selectedDrinks = parseFields(drinks);
			ArrayList<Item> selectedDrinks = storeItem(drinks);
			request.setAttribute("selectedDrinks", selectedDrinks);
			
		}
		
		if(musics != null) {
			//createAddressList(musics);
			//ArrayList<Item> selectedMusics= parseFields(musics);
			ArrayList<Item> selectedMusics = storeItem(musics);
			request.setAttribute("selectedMusics", selectedMusics);
			

		}
		
		if(sports != null) {
			//createAddressList(sports);
			//ArrayList<Item> selectedSports = parseFields(sports);
			ArrayList<Item> selectedSports = storeItem(sports);
			request.setAttribute("selectedSports", selectedSports);
			
		}
		
		//store trip in db
		storeTrip(this.itemsForTrip,request);
	    		
		request.setAttribute("addresses",addresses);
		RequestDispatcher rd = request.getRequestDispatcher("agenda2.jsp");
		
		rd.forward(request, response);
		
		
	}
	
	
	// takes as input the IDs of its item and stores the trip for these items and 
	// for the logged user in the db
	private void storeTrip(List<Integer> itemsForTrip,HttpServletRequest request) {
		
		Subject currentUser = SecurityUtils.getSubject();
		System.out.println("The principal of the current logged user is = " + currentUser.getPrincipal());
        Session Shirosession = currentUser.getSession();
        String id = (String) Shirosession.getAttribute("user_id");
        System.out.println("The id of the current logged user is = " + id);
		
		HttpSession session = request.getSession();
		String location = (String) session.getAttribute("location");
		
		DBConnection dbConnection = new DBConnection();
		dbConnection.connect();
				
		//SQL class connection (connection established)
		Connection connection = dbConnection.getConnection();
		
		String tripQuery = "INSERT INTO trip VALUES (default,?,?,?,?,?,?)";
        PreparedStatement statement = null;
        try {
        	int last_inserted_trip = 0;
			statement = connection.prepareStatement(tripQuery,Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, location);
			statement.setDate(2, new java.sql.Date(2009, 12, 11));
			statement.setDate(3, new java.sql.Date(2009, 12, 11));
			statement.setString(4, "Via Splendente");
			statement.setString(5, "jackmytour.com");
			statement.setInt(6, Integer.parseInt(id));
			statement.executeUpdate();
            
            ResultSet result = statement.getGeneratedKeys();
            if(result.next())
            {
                last_inserted_trip = result.getInt(1);
                System.out.println("just stored trip number---> "+ last_inserted_trip);
            }
            
            // now add in the itemfortrip table all the items for the last inserted trip
            // in order to complete the trip insertion. 
            
            for(Integer itemId : itemsForTrip) { 
            	String q = "INSERT INTO itemfortrip values (?,?)";
            	statement = connection.prepareStatement(q);
            	statement.setInt(1,last_inserted_trip);
            	statement.setInt(2,itemId);
            	statement.executeUpdate();
            }
            
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	
	//this method stores the chosen temp_items in the real item db table e returns 
	// as values arraylists of chosen items to be then passed to the agenda.jsp page
	private ArrayList<Item> storeItem(String[] UUIDS) {
		ArrayList<Item> items = new ArrayList<Item>();
		DBConnection dbConnection = new DBConnection();
		dbConnection.connect();
				
		//SQL class connection (connection established)
		Connection connection = dbConnection.getConnection();
		
		for (String UUID : UUIDS) {           
			String query = "SELECT * FROM temp_item where UUID = ?";
			PreparedStatement preparedStatement = null; 
			try {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, UUID);
				
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()) { 
					// TODO: we still have to insert all the items properties (from APIs)
					Item newItem;
					String name = rs.getString("name");
		            String address = rs.getString("address");
		            newItem = new Item(name,address);
		            newItem.setPhoneNumber(rs.getString("phoneNumber"));
		            //all the other properties
		            newItem.setType(rs.getString("type"));
		            
		            items.add(newItem);
		            
		            String insertionQuery = "INSERT INTO item VALUES (default,?,?,?,?,?,?,?,?,?,?,?)";
		            PreparedStatement statement = null;
		            byte b = 1;
		            statement = connection.prepareStatement(insertionQuery,Statement.RETURN_GENERATED_KEYS); 
		            
		            //general item info
		            statement.setString(1, newItem.getName());
		            statement.setString(2, newItem.getAddress());
		            statement.setString(3, "191");
		            statement.setDate(4, new java.sql.Date(2009, 12, 11));
		            statement.setDate(5, new java.sql.Date(2009, 12, 11));
				    
				    //boolean fields
		            statement.setByte(6, b);
		            statement.setByte(7, b);
		            statement.setByte(8, b);
		            statement.setByte(9, b);
				   
				    //additional info
		            statement.setString(10, "www.blabla.come/imageid=123");
		            statement.setString(11, newItem.getType());
		            statement.executeUpdate();
		            
		            ResultSet result = statement.getGeneratedKeys();
	                if(result.next()) {
	                    int last_inserted_id = result.getInt(1);
	                    System.out.println("I just added item with id---> "+ last_inserted_id);
	                    this.itemsForTrip.add(last_inserted_id);
	                }
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		}
		return items;
		
	}
	
	
	public void createAddressList(String[] selectedItems) {
		ArrayList<Item> items = new ArrayList<Item>();
		
		for(String s : selectedItems) { 
			String[] parts = s.split("\\+");
			String name = parts[0]; 
			String address = parts[1];
			addresses.add(address);
			System.out.println("Nella servlet+ "+
			
					name+" "+address);
		}
	
		//return items;
	}
	

}
