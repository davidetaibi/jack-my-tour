package develop.com.jackmytour.core;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
 



import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
 

 
public class FacebookRealm extends AuthorizingRealm {
 
	private static final Properties props = new FacebookProperties().getProperties();
	private static final String APP_SECRET = props.get("fbAppSecret").toString();
	private static final String APP_ID = props.get("fbAppId").toString();
	private static final String REDIRECT_URL = props.get("fbLoginRedirectURL").toString();
	 
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
				String accessToken = getAccessToken(authResponse);
				URL url = new URL("https://graph.facebook.com/me?access_token=" + accessToken);
				String fbResponse = readURL(url);
				FacebookUserDetails fud = new FacebookUserDetails(fbResponse);
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
		
	}
}	