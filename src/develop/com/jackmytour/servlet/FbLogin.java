package develop.com.jackmytour.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
 






import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import develop.com.jackmytour.core.FacebookProperties;
import develop.com.jackmytour.core.FacebookToken;
 
/**
* Simple Facebook Login Handling, doesn't actually do anything except display page confirming login
* successfull.
*
*
*/
@WebServlet("/fblogin")
public class FbLogin extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
 
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FacebookLoginServlet getting..");
		 
		String code = request.getParameter("code");
		FacebookToken facebookToken = new FacebookToken(code);
		facebookToken.setRememberMe(true);
		try{
			SecurityUtils.getSubject().login(facebookToken);
			response.sendRedirect(response.encodeRedirectURL("secondHome.jsp"));
		}catch(AuthenticationException ae){
			throw new ServletException(ae);
		 }
	}

	/**
	* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	*      response)
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
		IOException {
		System.out.println("Unexpected doPost ...");
	}
	 
	/**
	* Makes call to Facebook to get access_token, and then to get id, name etc.
	* for the facebook user relating to that token. Returns FacebookUserDetails
	* object for that user, or null if unable to complete authentication.
	*
	* @param request
	* @param response
	* @param code
	* @return FacebookUserDetails
	* @throws MalformedURLException
	* @throws IOException
	*/
	/*private FacebookUserDetails authenticate(HttpServletRequest request, HttpServletResponse response)
			throws MalformedURLException, IOException {
		FacebookUserDetails fud = null;
		String code = request.getParameter("code");
		System.out.println("code parameter: " + code);
		if (code != null && code.trim().length() > 0) {
			URL authUrl = new URL("https://graph.facebook.com/v2.3/oauth/access_token?" + "client_id="
					+ APP_ID + "&redirect_uri=" + REDIRECT_URL + "&client_secret="
					+ APP_SECRET + "&code=" + code);
	 
			String authResponse = readURL(authUrl);
			System.out.println(authResponse);
	 
			try {
				//String accessToken = getPropsMap(authResponse).get("access_token");
				String accessToken = getAccessToken(authResponse);
				URL url = new URL("https://graph.facebook.com/me?access_token=" + accessToken);
				String fbResponse = readURL(url);
	 
				System.out.println(fbResponse);
	 
				fud = new FacebookUserDetails(fbResponse);
	 
			} catch (Throwable e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return fud;
	}
	
	private String readURL(URL url) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		InputStream is = url.openStream();
		int r;
		while ((r = is.read()) != -1) {
			baos.write(r);
		}
		return new String(baos.toByteArray());
	}

	
	private String getAccessToken(String resultJson) { 
		JSONObject json = (JSONObject) JSONValue.parse(resultJson);
		String access_token = (String) json.get("access_token");
		return access_token;
		
	}*/
	 

 
/**
* Simple class for holding data relating to a facebook user
* currentyl just holds jsonString, but could have extra properties added backed by the json
* e.g. id, firstName, lastName, link ,education[], etc.
*
* @author Mike
*
*/
	class FacebookUserDetails {
 
	// jsonString Expected to be something like this, although I'm sure it used to include
	// email
	// {
	// "education": [{
	// "school": {
	// "id": "123456789012345",
	// "name": "University of Sheffield"
	// },
	// "type": "Graduate School",
	// "with": [{
	// "id": "123456789",
	// "name": "Daffy Duck"
	// }]
	// }],
	// "first_name": "Mike",
	// "id": "121212121",
	// "last_name": "Warren",
	// "link":
	// "http://www.facebook.com/profile.php?id=121212121",
	// "locale": "en_US",
	// "name": "Mike Warren",
	// "updated_time": "2011-08-15T14:51:05+0000",
	// "verified": true
	// }
		private String jsonString;
 
		FacebookUserDetails(String fbResponse) {
			jsonString = fbResponse;
		}
 
		public String toString(){
			return jsonString;
		}
	}
 
}