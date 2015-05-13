package develop.com.jackmytour.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import develop.com.jackmytour.core.Item;
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
		String[] drinks =request.getParameterValues("drinks");
		
		String[] musics=request.getParameterValues("music");
		String[] sports=request.getParameterValues("sports");
		
		if(rests != null) {
			ArrayList<Item> selectedRestaurants = parseFields(rests);
			request.setAttribute("selectedRestaurants", selectedRestaurants);
		}
		
		if(drinks != null) {
			ArrayList<Item> selectedDrinks = parseFields(drinks);
			request.setAttribute("selectedDrinks", selectedDrinks);
		}
		
		if(musics != null) {
			ArrayList<Item> selectedMusics= parseFields(musics);
			request.setAttribute("selectedMusics", selectedMusics);

		}
		
		if(sports != null) {
			ArrayList<Item> selectedSports = parseFields(sports);
			request.setAttribute("selectedSports", selectedSports);
		}		
		
		RequestDispatcher rd = request.getRequestDispatcher("agenda2.jsp");
		
		rd.forward(request, response);
		
		
	}
	
	public ArrayList<Item> parseFields(String[] selectedItems) {
		ArrayList<Item> items = new ArrayList<Item>();
		
		for(String s : selectedItems) { 
			String[] parts = s.split("\\+");
			String name = parts[0]; 
			String address = parts[1]; 
			System.out.println(name+" "+address);
			
			Item item = new Item(name,address);
			items.add(item);
		}
	
		return items;
	}
	

}
