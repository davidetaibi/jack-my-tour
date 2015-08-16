package develop.com.jackmytour.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.json.JSONValue;








import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import develop.com.jackmytour.core.CalendarEventD;
import develop.com.jackmytour.core.CalendarEventS;
import develop.com.jackmytour.db.DBConnection;

/**
 * Servlet implementation class UpdateEvents
 */
@WebServlet("/UpdateEvents")
public class UpdateEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEvents() {
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
		
//		String eventId = request.getParameter("eventId");
//		long start = Long.parseLong(request.getParameter("start"));
//		long end = Long.parseLong(request.getParameter("end"));
//		
		
		System.out.println("Hello from UpdateEvents()");
		

		StringBuffer jb = new StringBuffer();
	    String line = null;
		
		BufferedReader reader = request.getReader();
	        //RequestMaker.requestProcess();
	        while ((line = reader.readLine()) != null) { 
	        	//if(line.contains("jsondata"))
	        	jb.append(line);
	        }
	        
	       
	        String jsonstring = jb.toString(); 
	        System.out.println(jsonstring);
	        
	        Type listType = new TypeToken<List<CalendarEventS>>() {}.getType();

	        Gson g = new Gson();
	        List<CalendarEventS> list = g.fromJson(jsonstring, listType);
	        
	        for (int i=0; i<list.size(); i++) {
	        	CalendarEventS current = list.get(i);
	        	
	        	String start = current.getStartTime();
	        	String end = current.getEndTime();
	        	
	        	
	        	
	        	start = start.replaceAll("T", " ");
	        	start = start.replaceAll("Z", "");
	        	end = end.replaceAll("T", " ");
	        	end = end.replaceAll("Z", "");
	        	
	        	System.out.println("start = " + start + " / " + "end = " + end);
	        	
	        	Date startD = null;
	        	Date endD = null;
	        	try {
		        	java.text.SimpleDateFormat sdfStart = 
		           	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
					startD = sdfStart.parse(start);
					
		           	java.text.SimpleDateFormat sdfEnd = 
			           	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			        endD = sdfEnd.parse(end);
			        
	        	} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	
	        	
	        	
	        	Calendar calStart = Calendar.getInstance();
	        	calStart.setTime(startD);
	        	
	        	Calendar calEnd = Calendar.getInstance();
	        	calEnd.setTime(endD);
	        	
	        	calStart.add(Calendar.HOUR_OF_DAY, 2);
	        	calEnd.add(Calendar.HOUR_OF_DAY, 2);
	        	
	        	System.out.println("Just parsed start & end :" + 
						"\nstart = " + calStart.getTime().toString()+
						"\nend   = " + calEnd.getTime().toString());
	        	
//	        	Date endD = new Date(Long.parseLong(endDate));
	        	java.text.SimpleDateFormat sdfStart = 
	        	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        	String startDStr = sdfStart.format(calStart.getTime());
	        	
	        	java.text.SimpleDateFormat sdfEnd = 
		        	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        String endDStr = sdfEnd.format(calEnd.getTime());
	        	
		        System.out.println("Going to insert these values in DB["+current.getEventId()+"]:" );
		        System.out.println("start: " + startDStr + " / " + "end: " + endDStr);
		        
		        
		        
		        DBConnection dbConnection2 = new DBConnection();
				dbConnection2.connect();
				Connection connection2 = dbConnection2.getConnection();
				String insertionQuery = "UPDATE item SET startDate=?,endDate=? WHERE itemId=?;";
		        PreparedStatement stmt = null;           
		        
		        try {
		        	stmt = connection2.prepareStatement(insertionQuery); 
		        	stmt.setString(1, startDStr);
		        	stmt.setString(2, endDStr);
					//System.out.println("the end date to be updated when times are known: " + new java.sql.Date(Long.parseLong(endDate)).toString());
					stmt.setString(3, String.valueOf(current.getEventId()));
					stmt.executeUpdate();
					
					
				} catch (Exception e) { e.printStackTrace();	}
				
	        	
//	        	Date endD = new Date(Long.parseLong(endDate));
//	        	java.text.SimpleDateFormat sdfEnd = 
//	        	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	        	String endDStr = sdfEnd.format(endD);
//	        	
	        	
//	        	Calendar calStart = Calendar.getInstance();
//	        	calStart.setTimeInMillis(Long.parseLong(start));
		        
//	        	DateFormat dt = DateFormat.getInstance();
//	        	dt.setLenient(true);
//	        	Date startD = null;
//	        	try {
//					startD = dt.parse(start);
//				} catch (ParseException e) { e.printStackTrace(); }
//	        	System.out.println("The UpdateEvents received startDate, converted to Calendar type = " + startD.toString());
//	        	
		        
//	        	start = start.substring(0, 19).replaceAll("T", " ");
//	        	end = end.substring(0, 19).replaceAll("T", " ");
//	        	
//	        	current.setStartTime(start);
//	        	current.setEndTime(end);
//	        	list.set(i, current);
	        }
	        
//	        System.out.println("|||| SUCCESSSSSS ||||| The first startTime in the received all_events = " + list.get(0).getStartTime());
	        
	        
	        //session.setAttribute("trip",list);
		
		
//		Map<String, String[]> bandInfo = request.getParameterMap();
//		
//        // In this case here we are not using the data sent to just do different things.
//        // Instead we are using them as information to make changes to the server,
//        // in this case, adding more bands and albums.
//       
//        String albums = Arrays.asList(bandInfo.get("albumName")).get(0);
//        MusicDatabase.getInstance()
//            .setBandAndAlbums(bandName, getAlbumNamesFromString(albums));

		
/////////////////////////////////////////////////////////		
//		String tabledata = request.getParameter("json");
//	    System.err.println(tabledata);
//	    final String JSON_DATA
//	            = "{" + "  \"geodata\": " + tabledata + "}";
//	    System.err.println(JSON_DATA);
//	    final JSONObject obj = null;
//	    String eventName;
//	    String noOfhours;
//	    try {
//	        //obj = new JSONObject(JSON_DATA);
//	    	//obj = (JSONObject) JSONValue.parse(JSON_DATA);
//	        
//	        final JSONArray geodata = (JSONArray) obj.getJSONArray("geodata");
//	        final int n = geodata.length();
//	        for (int i = 0; i < n; ++i) {
//	            final JSONObject taskinfo = geodata.getJSONObject(i);
//	            eventName = taskinfo.getString("name");
//	            //noOfhours = taskinfo.getString("No. of Hours"); 
//	            System.out.println("|||| SUCCESSSSSS ||||| eventName got from AJAX request = " + eventName);
//	        }
//	    } catch (Exception ex) {
//	        ex.printStackTrace();
//	    }
		
		
		//********  Interaction con DB - UNCOMMENT when we have success above
//		DBConnection dbConnection = new DBConnection();
//		Connection connection = dbConnection.getConnection();
//		String insertionQuery = "update item set startDate=?,endDate=? where itemId=?;";
//        PreparedStatement statement = null;
//        
//        //general item info
//        
//        try {
//        	statement = connection.prepareStatement(insertionQuery,Statement.RETURN_GENERATED_KEYS); 
//        	statement.setDate(1, new java.sql.Date(start));
//			statement.setDate(2, new java.sql.Date(end));
//			statement.setString(3, eventId);
//			statement.executeUpdate();
//		} catch (SQLException e) { e.printStackTrace();	}
        
		
		
	}

}
