package develop.com.jackmytour.servlet;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		//List tabsList = (List) Arrays.asList(tabs);
		
				
		
		
			
		request.setAttribute("tabs",tabs);
		
		if(rests.size() != 0) {
			request.setAttribute("restutants_yelp", rests);
		}	
		
		if(drinks.size() != 0) { 
			request.setAttribute("drinks", drinks);
		}
		
		if(sports != null) { 
			request.setAttribute("sports", sports);
		}
		
		if(musics != null) { 
			request.setAttribute("musics", musics);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("activities.jsp");
		
		rd.forward(request, response);
	}

}
