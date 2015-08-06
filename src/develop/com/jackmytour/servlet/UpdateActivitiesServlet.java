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


@WebServlet("/UpdateActivities")
public class UpdateActivitiesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String location = (String) session.getAttribute("location");
		String keyword = request.getParameter("term");
		String duration = request.getParameter("duration");
		System.out.println("u print " + keyword);
		System.out.println("duration: " + duration);

		
		ArrayList<Item> rests = new ArrayList<Item>();
		
		YelpData food = new YelpData(location, keyword ,request);
		rests = food.queryAPI("Restaurant");
		
		 PrintWriter out = response.getWriter();
		 
		 out.println(rests);
		 out.close();
		
//RequestDispatcher rd = request.getRequestDispatcher("activities.jsp");
		
	//	rd.forward(request, response);
	}
}