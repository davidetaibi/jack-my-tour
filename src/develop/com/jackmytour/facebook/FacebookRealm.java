package develop.com.jackmytour.facebook;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
 















import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import develop.com.jackmytour.db.DBConnection;
 

 
public class FacebookRealm extends AuthorizingRealm {
 
	private static final Properties props = new FacebookProperties().getProperties();
	private static final String APP_SECRET = props.get("fbAppSecret").toString();
	private static final String APP_ID = props.get("fbAppId").toString();
	private static final String REDIRECT_URL = props.get("fbLoginRedirectURL").toString();
	
	private ResultSet result;
	 
	@Override
	public boolean supports(AuthenticationToken token) {
		System.out.println("entri nel support method facebook");
		if (token instanceof FacebookToken) {
			return true;
		}
		return false;
	}
	

	 
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}
	 
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("login with fb");
		FacebookToken facebookToken = (FacebookToken) token;
	 
	// do all the facebook gubbins
		if (facebookToken.getCode() != null && facebookToken.getCode().trim().length() > 0) {
			URL authUrl;
			try {
				authUrl = new URL("https://graph.facebook.com/v2.3/oauth/access_token?" + "client_id=" + APP_ID
						+ "&redirect_uri=" + REDIRECT_URL + "&client_secret=" + APP_SECRET + "&code="
						+ facebookToken.getCode());
		 
				String authResponse = readURL(authUrl);
				System.out.println(authResponse);
				// access token for specific facebook user
				String accessToken = getAccessToken(authResponse);
				URL url = new URL("https://graph.facebook.com/me?access_token=" + accessToken);
				String fbResponse = readURL(url);
				System.out.println(fbResponse);
				FacebookUserDetails fud = new FacebookUserDetails(fbResponse);
				String id = getUserId(fbResponse);
				boolean present = isThisFbUserAlreadyIn(id);
				if(!present) { 
					//insert fb user details in db and login
					System.out.println("creo nuovo fb user");
					insertFbUser(fud);
				} else { 
					System.out.println("fb user gia´registrato in precedenza");
					//user already registered --> simply login and TODO Session management 
				}
				
				
				return new FacebookAuthenticationInfo(fud.getFirstName(),fud, this.getName());
			} catch (MalformedURLException e1) {
				e1.printStackTrace();
				throw new AuthenticationException(e1);
			} catch (IOException ioe) {
				ioe.printStackTrace();
				throw new AuthenticationException(ioe);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	private void insertFbUser(FacebookUserDetails fud) { 
		
		//custom connection with mysql jdbc driver to jmt db
		DBConnection dbConnection = new DBConnection();
		dbConnection.connect();
		
		//SQL class connection (connection established)
		Connection connection = dbConnection.getConnection();
		PreparedStatement preparedStatement = null;
		// PreparedStatements
	    try {
			preparedStatement = connection.prepareStatement("insert into traveller values (default, ?, ?, ?, ? , ?, ?, ?, ?,?)");
			preparedStatement.setString(1, fud.getFirstName());
		    preparedStatement.setString(2, fud.getLastName());
		    preparedStatement.setString(3, fud.getEmail());
		    preparedStatement.setNull(4, java.sql.Types.VARCHAR);
		    preparedStatement.setNull(5, java.sql.Types.VARCHAR);
		    preparedStatement.setString(6, "Bolzano");
		    preparedStatement.setDate(7, new java.sql.Date(2009, 12, 11));
		    preparedStatement.setString(8, "blabla");
		    preparedStatement.setString(9, fud.getId());
		    preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    } finally { 
	    	// TODO implement close() Connection method
	    	//close();
	    	System.out.println("new traveller registered");
	    }
		
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
	
	private String getUserId(String fbResponse) { 
		JSONObject json = (JSONObject) JSONValue.parse(fbResponse);
		String id = (String) json.get("id");
		return id;
		
	}
	
	private String getAccessToken(String resultJson) { 
		JSONObject json = (JSONObject) JSONValue.parse(resultJson);
		String access_token = (String) json.get("access_token");
		return access_token;
		
	}
	
	private boolean isThisFbUserAlreadyIn(String id) { 
		//custom connection with mysql jdbc driver to jmt db
		DBConnection dbConnection = new DBConnection();
		dbConnection.connect();
				
		//SQL class connection (connection established)
		Connection connection = dbConnection.getConnection();
		
		String query = "SELECT * FROM traveller WHERE facebook_id = ?";
		PreparedStatement preparedStatement = null; 
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(!rs.next()) { 
				//no such fb user in db
				this.result = rs;
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
}	