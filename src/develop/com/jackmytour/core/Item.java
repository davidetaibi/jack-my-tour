package develop.com.jackmytour.core;


public class Item {

	String name = null;
	String address = null;
	String phoneNumber = null;
	String startDate = null;
	String endDate = null;
	boolean weatherSensitive;
	boolean allDay; //se hanno un orario. E.g. muyseo otzi ha un orario e non puoi andare alle 3 am -> false. Statua walther, si invece, allora true
	boolean booked;
	boolean fixedTime; //se l'evento non si puo spostare. E.g. una partita di calcio, comincia esattamente alle 20:45^
	String type = null;
	String picUrl = null;
	//only for temporary stores items
	String UUID = null;

	
	public String getUUID() {
		return UUID;
	}

	public void setUUID(String uUID) {
		UUID = uUID;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public boolean isWeatherSensitive() {
		return weatherSensitive;
	}

	public void setWeatherSensitive(boolean weatherSensitive) {
		this.weatherSensitive = weatherSensitive;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public boolean isBooked() {
		return booked;
	}

	public void setBooked(boolean booked) {
		this.booked = booked;
	}

	public boolean isFixedTime() {
		return fixedTime;
	}

	public void setFixedTime(boolean fixedTime) {
		this.fixedTime = fixedTime;
	}

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
