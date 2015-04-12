package develop.com.jackmytour.core;

public class Restaurant {

	String name = null;
	String address = null;
	
	public Restaurant(String name,String address) { 
		this.name = name;
		this.address = address;
	}
	
	public String getName() { 
		return this.name;
	}
	
	public String getAddress() { 
		return this.address;
	}
	
	public void setName(String newName) {
		this.name = newName;
	}
	
	public void setAddress(String newAddress) {
		this.name = newAddress;
	}
	
	
}
