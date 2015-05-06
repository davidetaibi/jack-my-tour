package develop.com.jackmytour.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import develop.com.jackmytour.core.Restaurant;

/**
 * Servlet implementation class CreateAgendaData
 */
@WebServlet("/createAgenda")
public class CreateAgendaData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		String[] rests = request.getParameterValues("rests");
		ArrayList<Restaurant> SelectedRestaurants = new ArrayList<Restaurant>();
		
		for(String s : rests) { 
			String[] parts = s.split("\\+");
			String name = parts[0]; 
			String address = parts[1]; 
			System.out.println(name+" "+address);
			
			Restaurant res = new Restaurant(name,address);
			SelectedRestaurants.add(res);
		}
		
		for(Restaurant r : SelectedRestaurants) { 
			System.out.println(r.getName() + "+" + r.getAddress());
		}
		
		request.setAttribute("selectedRestaurants", SelectedRestaurants);
		
		RequestDispatcher rd = request.getRequestDispatcher("agenda.jsp");
		
		rd.forward(request, response);
		
		
	}
	

}
