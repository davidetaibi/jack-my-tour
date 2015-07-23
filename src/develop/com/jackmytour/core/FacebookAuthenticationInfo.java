package develop.com.jackmytour.core;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;

public class FacebookAuthenticationInfo implements AuthenticationInfo {
	 
	private static final long serialVersionUID = 1L;
	 
	private PrincipalCollection principalCollection;
	 
	public FacebookAuthenticationInfo(String principal,FacebookUserDetails facebookUserDetails, String realmName){
		Collection<String> principals = new ArrayList<String>();
		principals.add(facebookUserDetails.getId());
		principals.add(facebookUserDetails.getFirstName()+" "+facebookUserDetails.getLastName()); // Is this appropriate is the name not really a Principal ?
		this.principalCollection = new SimplePrincipalCollection(principal, realmName);
	}
	 
	@Override
	public PrincipalCollection getPrincipals() {
		return principalCollection;
	}
	 
	@Override
	public Object getCredentials() {
		return null;// no credentials required
	}
}