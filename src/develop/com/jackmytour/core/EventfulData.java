package develop.com.jackmytour.core;

import java.util.List;

//import codingdudes.util.MysqlD;

import com.evdb.javaapi.APIConfiguration;
import com.evdb.javaapi.EVDBAPIException;
import com.evdb.javaapi.EVDBRuntimeException;
import com.evdb.javaapi.data.Event;
import com.evdb.javaapi.data.Performer;
import com.evdb.javaapi.data.SearchResult;
import com.evdb.javaapi.data.request.EventSearchRequest;
import com.evdb.javaapi.operations.EventOperations;

public class EventfulData {

	public static void main(String[] args) {
		System.out.println("Setting configuration");
		
		APIConfiguration.setEvdbUser("mogmog444");
		APIConfiguration.setEvdbPassword("mogmog444");
		APIConfiguration.setApiKey("hBvQkZXjNn5B6Xnf");

      EventOperations eo = new EventOperations();

      
      EventSearchRequest esr = new EventSearchRequest();
      esr.setLocation("Milan");
      esr.setKeywords("concert");
      esr.setPageSize(20);
      esr.setPageNumber(1);
      esr.setDateRange("next 7 days");

      System.out.println("Starting initial request.");
      
      SearchResult sr = null;
		try {
			sr = eo.search(esr);
		} catch (EVDBRuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (EVDBAPIException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
      
		int numPages = sr.getPageCount();
		System.out.println("Getting: "+numPages+" pages!");
		
		
		for(int i = 1; i < 2; i++) {
			System.out.println("Page: "+i+"/"+numPages);
			
	        //create the search request for music events in San Diego
	        /*esr = new EventSearchRequest();
	        esr.setKeywords("John McCain");
	        esr.setDateRange("2008010100-2008123100");
	        esr.setPageNumber(i);
	
	        sr = null;
			try {
				sr = eo.search(esr);
			} catch (EVDBRuntimeException e) {
				e.printStackTrace();
			} catch (EVDBAPIException e) {
				e.printStackTrace();
			}*/
	
	        //here is our list of results
	        List<Event> events = sr.getEvents();  		
	        
	        for(Event e : events) {
	        	//for(Performer p : e.getPerformers()) {
	        		//int post = e.getVenuePostalCode().equals("") ? 0 : Integer.parseInt(e.getVenuePostalCode());
	    			
	    					System.out.println("Title: "+ e.getTitle() + "-----" + "Description: " + e.getDescription() + " Date:" + e.getStartTime()
	    							+ " Venue: " + e.getVenue().getAddress()); 
	    					System.out.println("--------------------------------next-------------------------------------");
	    					/*getDescription())
	    					+MysqlD.escape((e.getStartTime() != null) ? e.getStartTime().toString() : "")+"','"
	    					+MysqlD.escape((e.getStopTime() != null) ? e.getStopTime().toString() : "")+"','"
	    					+MysqlD.escape(p.getName())+"',"
	    					+e.getVenueLatitude()+","
	    					+e.getVenueLongitude()+",'"
	    					+MysqlD.escape(e.getVenueName())+"',"
	    					+post+")"
	    					);*/
	    			
	        		//System.out.println(e.getStartTime()+" in "+e.getVenueLatitude()+"/"+e.getVenueLongitude()+" : "+e.getTitle()+" : "+p.getName());
	        		//System.out.println(e.getVenueName()+" "+e.getVenuePostalCode());
         	 	//}
	        }
		}
	}	
	
}