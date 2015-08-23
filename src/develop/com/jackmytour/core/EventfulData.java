package develop.com.jackmytour.core;

import java.util.Iterator;
import java.util.List;

import com.evdb.javaapi.data.Event;
//import codingdudes.util.MysqlD;
import com.evdb.javaapi.operations.VenueOperations;
import com.evdb.javaapi.EVDBAPIException;
import com.evdb.javaapi.EVDBRuntimeException;
import com.evdb.javaapi.data.SearchResult;
import com.evdb.javaapi.data.request.EventSearchRequest;
import com.evdb.javaapi.operations.EventOperations;
import com.evdb.javaapi.APIConfiguration;

public class EventfulData {
	
	String location;
	String dateRange;
	String keyword;
	
	public EventfulData(String location,String dateRange,String keyword) {
		this.location = location;
		this.dateRange = dateRange;
		this.keyword = keyword;
	}
	
	public String getLocation() { 
		return this.location;
	}
	
	public String getDateRange() { 
		return this.dateRange;
	}
	
	public String getKeyWords() { 
		return this.keyword;
	}
	
	public List<Event> search() {
		
		  System.out.println("Setting configuration");
			
		  APIConfiguration.setEvdbUser("mogmog444");
		  APIConfiguration.setEvdbPassword("mogmog444");
		  APIConfiguration.setApiKey("hBvQkZXjNn5B6Xnf");
	
		  EventOperations eo = new EventOperations();
		  
	      
	      EventSearchRequest esr = new EventSearchRequest();
	      esr.setLocation(this.location);
	      esr.setKeywords(this.keyword);
	      //esr.setKeywords("image_sizes=block188");
	      esr.setPageSize(20);
	      esr.setPageNumber(1);
	      esr.setIncludes("image_sizes=block");
	      
	      
	      //System.out.println("EventOperations props: " + eo.getProperties(seid))
	      //eo.addProperty(seid, property)
	      
	      //esr.setDateRange("today");
	
	      System.out.println("Starting initial request -> " + esr.getIncludes());
	      
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
			
			List<Event> events = sr.getEvents(); 
			Iterator<Event> iter = events.iterator();
			
			//while loop removing items without addresses. Rule: no address ---> no item
			while(iter.hasNext()) { 
				Event event = iter.next();
//				List<Image> a = event.getImages();  //go on, go on....
//				a.get(0).getUrl()
				if(event.getVenue().getAddress() == null || event.getVenue().getAddress().equals("") || event.getVenue().getAddress().equals(this.location) ) { 
					iter.remove();
				}
			}
						
			return events;
			
		
/*		for(int i = 1; i < 2; i++) {
			System.out.println("Page: "+i+"/"+numPages);

	        List<Event> events = sr.getEvents();  		
	        
	        for(Event e : events) {
	        	//for(Performer p : e.getPerformers()) {
	        		//int post = e.getVenuePostalCode().equals("") ? 0 : Integer.parseInt(e.getVenuePostalCode());
	    			
	    					System.out.println("Title: "+ e.getTitle() + "-----" + "Description: " + e.getDescription() + " Date:" + e.getStartTime()
	    							+ " Venue: " + e.getVenue().getAddress()); 
	    					System.out.println("--------------------------------next-------------------------------------");
	    					getDescription())
	    					+MysqlD.escape((e.getStartTime() != null) ? e.getStartTime().toString() : "")+"','"
	    					+MysqlD.escape((e.getStopTime() != null) ? e.getStopTime().toString() : "")+"','"
	    					+MysqlD.escape(p.getName())+"',"
	    					+e.getVenueLatitude()+","
	    					+e.getVenueLongitude()+",'"
	    					+MysqlD.escape(e.getVenueName())+"',"
	    					+post+")"
	    					);
	    			
	        		//System.out.println(e.getStartTime()+" in "+e.getVenueLatitude()+"/"+e.getVenueLongitude()+" : "+e.getTitle()+" : "+p.getName());
	        		//System.out.println(e.getVenueName()+" "+e.getVenuePostalCode());
         	 	//}
	        }
		}*/
	}	
	
}