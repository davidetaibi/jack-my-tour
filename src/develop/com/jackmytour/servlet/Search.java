package develop.com.jackmytour.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.UUID;

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
import org.scribe.model.OAuthRequest;
import org.scribe.model.ProxyOAuthRequest;
import org.scribe.model.Verb;

import com.evdb.javaapi.data.Event;

import develop.com.jackmytour.core.DrinkBar;
import develop.com.jackmytour.core.EventfulData;
import develop.com.jackmytour.core.Item;
import develop.com.jackmytour.core.MusicEvent;
import develop.com.jackmytour.core.Restaurant;
import develop.com.jackmytour.core.SportEvent;
import develop.com.jackmytour.core.YelpData;
import develop.com.jackmytour.db.DBConnection;

/**
 * Servlet implementation class Search
 */

@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String user = request.getParameter("user");
		//String pass = request.getParameter("password");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Subject currentUser = SecurityUtils.getSubject();
		System.out.println("The principal of the current logged user is = " + currentUser.getPrincipal());
        Session Shirosession = currentUser.getSession();
        String id = (String) Shirosession.getAttribute("user_id");
        System.out.println("The id of the current logged user is = " + id);
        
      				
		HttpSession session = request.getSession();
		
		String location = request.getParameter("location");
		session.setAttribute("location",location);
		//still have to work on this term
		String term = request.getParameter("term");		
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		session.setAttribute("from", from);
		session.setAttribute("to", to);
		
		String address = request.getParameter("StartAddress");
		session.setAttribute("StartAddress", address);
		
		ArrayList<Item> rests= new ArrayList<Item>();
		ArrayList<Item> drinks= new ArrayList<Item>();
		List<Event> sports= null;
		List<Event> musics=null;
		
		String[] tabs = request.getParameterValues("tabs");
		for(String tab: tabs) {
			if (request.getRequestURL().toString().contains("jmt.inf")) {
				System.setProperty("http.proxyHost", "passage.inf.unibz.it");
				System.setProperty("http.proxyPort", "8080");
		    } 
			System.out.println("Item checked"+ "---> " + tab);
			switch(tab) { 
				case "Food": 
					YelpData food = new YelpData(location,"restaurant",request);
					rests = food.queryAPI("Restaurant");
					break;
				case "Drinks":
					YelpData drink = new YelpData(location,"bar",request);
					drinks = drink.queryAPI("Drink");
					break;
				case "Sports":
					EventfulData sport = new EventfulData(location,null,"sport");
					sports = sport.search();
					break;
				case "Music":
					EventfulData music = new EventfulData(location,null,"music");
					musics = music.search();
					break;
			}
		}
				
		request.setAttribute("tabs",tabs);
		
		if(rests.size() != 0) {
			addType(rests,"RES");
			storeTempItem(rests);
			request.setAttribute("restutants_yelp", rests);
		}	
		
		if(drinks.size() != 0) {
			addType(drinks,"BAR");
			storeTempItem(drinks);
			request.setAttribute("drinks", drinks);
		}
		
		if(sports != null) { 
			ArrayList<Item> sportItem = transformToItem(sports,"SPORT");
			storeTempItem(sportItem);
			request.setAttribute("sports", sportItem);
		}
		
		if(musics != null) {
			ArrayList<Item> musicItem = transformToItem(musics,"MUSIC");
			storeTempItem(musicItem);
			request.setAttribute("musics", musicItem);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("activities.jsp");
		
		rd.forward(request, response);
	}
	
	// stores temporary items with an UUID in order to be than retrieved only the objects
	// selected in the activities page and show them in the agenda. When an item is selected it 
	// becomes an actual item and it is stored in the real item table. Instead the others not chosen
	// for now are simply dropped
	public void storeTempItem(ArrayList<Item> items) { 
		//custom connection with mysql jdbc driver to jmt db
				DBConnection dbConnection = new DBConnection();
				dbConnection.connect();
				
				//SQL class connection (connection established)
				Connection connection = dbConnection.getConnection();
				Iterator<Item> iter = items.iterator();
				
				while(iter.hasNext()) {
					Item newItem = (Item) iter.next();
					PreparedStatement preparedStatement = null;
					
					byte b = 1;
					// PreparedStatements
				    try {
						preparedStatement = connection.prepareStatement("insert into temp_item values (default,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
						
						//general item info
						preparedStatement.setString(1, newItem.getName());
					    preparedStatement.setString(2, newItem.getAddress());
					    preparedStatement.setString(3, "191");
					    preparedStatement.setDate(4, new java.sql.Date(2009, 12, 11));
					    preparedStatement.setDate(5, new java.sql.Date(2009, 12, 11));
					    
					    //boolean fields
					    preparedStatement.setByte(6, b);
					    preparedStatement.setByte(7, b);
					    preparedStatement.setByte(8, b);
					    preparedStatement.setByte(9, b);
					   
					    //additional info
					    preparedStatement.setString(10, "www.blabla.come/imageid=123");
					    preparedStatement.setString(11, newItem.getType());
					    preparedStatement.setString(12, newItem.getUUID());
					    preparedStatement.executeUpdate();
					    
					    ResultSet rs = preparedStatement.getGeneratedKeys();
		                if(rs.next())
		                {
		                    int last_inserted_id = rs.getInt(1);
		                    System.out.println(last_inserted_id);
		                }
	
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				    } finally { 
				    	// TODO implement close() Connection method
				    	//close();
				    	System.out.println("new temp_item inserted");
				    }
			   }   
		
	}
	
	
	// since in the db we store only item we translate the event(Eventful) lists into items list
	// maybe this could be done before in the Eventful class. This method also adds to the item object its type
	// such as MUSIC,SPORT
	public ArrayList<Item> transformToItem(List<Event> events,String type) {  
		ArrayList<Item> items = new ArrayList<Item>();
		Iterator<Event> iter = events.iterator();
		while(iter.hasNext()) { 
			Item newItem = null;
			Event event = iter.next();
			newItem = new Item(event.getTitle(),event.getVenue().getAddress());
			newItem.setType(type);
			String myObjectId = UUID.randomUUID().toString();
			newItem.setUUID(myObjectId);
			items.add(newItem);
		}
		return items;
	}
	
	//this method adds the type property to the lists rests and drinks (RES,BAR)
	
	public ArrayList<Item> addType(ArrayList<Item> items,String type) { 
		Iterator<Item> iter = items.iterator();
		while(iter.hasNext()) { 
			Item item = iter.next();
			String myObjectId = UUID.randomUUID().toString();
			
			item.setType(type);
			item.setUUID(myObjectId);
		}
		
		return items;
	}
	
	

}
