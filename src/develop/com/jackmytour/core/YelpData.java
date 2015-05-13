package develop.com.jackmytour.core;

import java.awt.List;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.scribe.builder.ServiceBuilder;
import org.scribe.model.*;
import org.scribe.oauth.OAuthService;

//import com.beust.jcommander.JCommander;
//import com.beust.jcommander.Parameter;

public class YelpData {

	private static final String API_HOST = "api.yelp.com";
	private static final int SEARCH_LIMIT = 20;
	private static final String SEARCH_PATH = "/v2/search";
	private static final String BUSINESS_PATH = "/v2/business";

	/*
	 * Update OAuth credentials below from the Yelp Developers API site:
	 * http://www.yelp.com/developers/getting_started/api_access
	 */
	private static final String CONSUMER_KEY = "zQpsQbxZ5g2qEVt4XXYwYQ";
	private static final String CONSUMER_SECRET = "4uyN-uyv0LpWXAyhJNGDLxfni_U";
	private static final String TOKEN = "_IEUeDDHnPmt-n4yKQqiBtdmZ9bZe1H2";
	private static final String TOKEN_SECRET = "zhz9tatUdi-SVctDVRzCD_HuIr8";

	String location;
	String term;
	OAuthService service;
	Token accessToken;
	HttpServletRequest request;

	/**
	 * Setup the Yelp API OAuth credentials.
	 * 
	 * @param consumerKey
	 *            Consumer key
	 * @param consumerSecret
	 *            Consumer secret
	 * @param token
	 *            Token
	 * @param tokenSecret
	 *            Token secret
	 */
	public YelpData(String location, String term,HttpServletRequest request) {
		this.request = request;
		this.service = new ServiceBuilder().provider(TwoStepOAuth.class)
				.apiKey(YelpData.CONSUMER_KEY)
				.apiSecret(YelpData.CONSUMER_SECRET).build();
		this.accessToken = new Token(YelpData.TOKEN, YelpData.TOKEN_SECRET);

		this.location = location;
		this.term = term;

		// queryAPI();
	}

	/**
	 * Creates and sends a request to the Search API by term and location.
	 * <p>
	 * See <a
	 * href="http://www.yelp.com/developers/documentation/v2/search_api">Yelp
	 * Search API V2</a> for more info.
	 * 
	 * @param term
	 *            <tt>String</tt> of the search term to be queried
	 * @param location
	 *            <tt>String</tt> of the location
	 * @return <tt>String</tt> JSON Response
	 */
	public String searchForBusinessesByLocation(String location, String term) {
		OAuthRequest request = createOAuthRequest(SEARCH_PATH);
		request.addQuerystringParameter("term", term);
		request.addQuerystringParameter("location", location);
		request.addQuerystringParameter("limit", String.valueOf(SEARCH_LIMIT));
		return sendRequestAndGetResponse(request);
	}

	/**
	 * Creates and sends a request to the Business API by business ID.
	 * <p>
	 * See <a
	 * href="http://www.yelp.com/developers/documentation/v2/business">Yelp
	 * Business API V2</a> for more info.
	 * 
	 * @param businessID
	 *            <tt>String</tt> business ID of the requested business
	 * @return <tt>String</tt> JSON Response
	 */
	public String searchByBusinessId(String businessID) {
		OAuthRequest request = createOAuthRequest(BUSINESS_PATH + "/"
				+ businessID);
		return sendRequestAndGetResponse(request);
	}

	/**
	 * Creates and returns an {@link OAuthRequest} based on the API endpoint
	 * specified.
	 * 
	 * @param path
	 *            API endpoint to be queried
	 * @return <tt>OAuthRequest</tt>
	 */
	private OAuthRequest createOAuthRequest(String path) {
		OAuthRequest request;
		if (this.request.getRequestURL().toString()
						.contains("jmt.inf")) {
			request = new ProxyOAuthRequest(Verb.GET, "http://" + API_HOST
					+ path, "passage.inf.unibz.it", 8080);
		} else {
			request = new OAuthRequest(Verb.GET, "http://" + API_HOST + path);
		}
		return request;
	}

	/**
	 * Sends an {@link OAuthRequest} and returns the {@link Response} body.
	 * 
	 * @param request
	 *            {@link OAuthRequest} corresponding to the API request
	 * @return <tt>String</tt> body of API response
	 */
	private String sendRequestAndGetResponse(OAuthRequest request) {
		System.out.println("Querying " + request.getCompleteUrl() + " ...");
		this.service.signRequest(this.accessToken, request);
		Response response = request.send();
		return response.getBody();
	}

	/**
	 * Queries the Search API based on the command line arguments and takes the
	 * first result to query the Business API.
	 * 
	 * @param yelpApi
	 *            <tt>YelpAPI</tt> service instance
	 * @param yelpApiCli
	 *            <tt>YelpAPICLI</tt> command line arguments
	 */
	public ArrayList<Item> queryAPI(String category) {
		
		ArrayList<Item> items = new ArrayList<Item>();
		String searchResponseJSON = searchForBusinessesByLocation(
				this.location, this.term);

		JSONParser parser = new JSONParser();
		JSONObject response = null;
		try {
			response = (JSONObject) parser.parse(searchResponseJSON);
		} catch (ParseException pe) {
			System.out.println("Error: could not parse JSON response:");
			System.out.println(searchResponseJSON);
			System.exit(1);
		}

		JSONArray businesses = (JSONArray) response.get("businesses");

		for (int i = 0; i < businesses.size(); i++) {
			JSONObject business = (JSONObject) businesses.get(i);
			String name = (String) business.get("name");

			JSONObject location = (JSONObject) business.get("location");
			JSONArray addressArray = (JSONArray) location.get("address");
			String address = null;
			for (int j = 0; j < addressArray.size(); j++) {
				address = (String) addressArray.get(j);

			}
			Item item = null;
			if(category == "Restaurant") {
				 item = new Restaurant(name, address);
			}else if(category == "Drink") { 
				item = new DrinkBar(name,address);
			}
			
			items.add(item);
		}

		/*
		 * JSONObject firstBusiness = (JSONObject) businesses.get(0); String
		 * firstBusinessID = firstBusiness.get("id").toString();
		 * 
		 * 
		 * System.out.println(String.format(
		 * "%s businesses found, querying business info for the top result \"%s\" ..."
		 * , businesses.size(), firstBusinessID));
		 */

		// Select the first business and display business details
		// String businessResponseJSON =
		// searchByBusinessId(firstBusinessID.toString());
		// return(firstBusiness.get("name") + " " +
		// firstBusiness.getJSONObject("location").get("address").toString());

		return items;

		// System.out.println(String.format("Result for business \"%s\" found:",
		// firstBusinessID));
		// System.out.println(businessResponseJSON);
	}

	/**
	 * Command-line interface for the sample Yelp API runner.
	 */
	/*
	 * private static class YelpAPICLI {
	 * 
	 * @Parameter(names = {"-q", "--term"}, description = "Search Query Term")
	 * public String term = DEFAULT_TERM;
	 * 
	 * @Parameter(names = {"-l", "--location"}, description =
	 * "Location to be Queried") public String location = DEFAULT_LOCATION; }
	 */

	/**
	 * Main entry for sample Yelp API requests.
	 * <p>
	 * After entering your OAuth credentials, execute <tt><b>run.sh</b></tt> to
	 * run this example.
	 *
	 * public static void main(String[] args) { //YelpAPICLI yelpApiCli = new
	 * YelpAPICLI(); //new JCommander(yelpApiCli, args);
	 * 
	 * YelpData yelpApi = new YelpData(CONSUMER_KEY, CONSUMER_SECRET, TOKEN,
	 * TOKEN_SECRET); queryAPI(yelpApi); }
	 */
}