package develop.com.jackmytour.core;


public class Item {

	String name = null;
	String address = null;
	String phoneNumber = null;
	
	
	public Item(String name,String address)  { 
		this.name = name;
		this.address = address;
	}
	
	public Item(String name,String address,String phoneNumber) { 
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
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
	
	public void setPhone(String newPhone) {
		this.phoneNumber = newPhone;
	}
	
	public String getPhone() {
		return this.phoneNumber;
	}
	
	
	
}
