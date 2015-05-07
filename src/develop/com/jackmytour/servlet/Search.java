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

import com.evdb.javaapi.data.Event;

import develop.com.jackmytour.core.EventfulData;
import develop.com.jackmytour.core.Restaurant;
import develop.com.jackmytour.core.YelpData;

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
		
		
		String location = request.getParameter("location");
		//still have to work on this term
		String term = request.getParameter("term");
		
		String[] tabs = request.getParameterValues("tabs");
		for(String s: tabs) { 
			System.out.println("Item checked"+ "---> " + s);
		}
		//List tabsList = (List) Arrays.asList(tabs);
		
		
		YelpData yelp = new YelpData(location,term,request);
		ArrayList<Restaurant> rests = yelp.queryAPI();
		
		EventfulData eventFul = new EventfulData(location,null,null);
		List<Event> events = eventFul.search();
		
		request.setAttribute("restutants_yelp", rests);
		request.setAttribute("tabs",tabs);
		request.setAttribute("events",events);
		RequestDispatcher rd = request.getRequestDispatcher("activities.jsp");
		
		rd.forward(request, response);
	}

}
