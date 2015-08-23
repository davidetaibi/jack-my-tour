package develop.com.jackmytour.facebook;

import java.util.Properties;

public class FacebookProperties {
	
	private static final Properties props = new Properties();
	
	public Properties getProperties() { 
		props.setProperty("fbAppSecret","14e22274291239fb332feee368657ccc");
		props.setProperty("fbAppId","389121671278273");
		props.setProperty("fbLoginRedirectURL","http://jmt.inf.unibz.it/jack-my-tour/fblogin");
		return props;
	}
}
