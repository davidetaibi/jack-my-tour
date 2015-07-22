package develop.com.jackmytour.core;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;
 

public class FacebookUserDetails {
	
	private String id;
	private String firstName;
	private String lastName;
	private String email;
	private String jsonString;
 
	public FacebookUserDetails(String fbResponse) {
		jsonString = fbResponse;
		JSONObject respjson;
		try {
			respjson = (JSONObject) JSONValue.parse(fbResponse);
			this.id = (String) respjson.get("id");
			this.firstName = (String) respjson.get("first_name");
			this.lastName = (String) respjson.get("last_name");
			//this.email = (String) respjson.get("id");
			
		} catch (Exception e) {
			System.out.println("fbResponse:"+fbResponse );
			e.printStackTrace();
			throw new RuntimeException(e);
		}
 
	}
	
	public String toString(){
		return jsonString;
	}
 
	public String getId() {
		return id;
	}	
 
	public void setId(String id) {
		this.id = id;
	}
 
	public String getFirstName() {
		return firstName;
	}
 
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
 
	public String getLastName() {
		return lastName;
	}
 
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
 
	public String getEmail() {
		return email;
	}
 
	public void setEmail(String email) {
		this.email = email;
	}
}