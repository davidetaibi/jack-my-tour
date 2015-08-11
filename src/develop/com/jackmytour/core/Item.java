package develop.com.jackmytour.core;

import java.util.Calendar;


public class Item {

	String name = null;
	String address = null;
	String phoneNumber = null;
	String duration = null;
	Calendar startTime = null;
	Calendar endTime = null;
	boolean weatherSensitive;
	boolean allDay; //se hanno un orario. E.g. muyseo otzi ha un orario e non puoi andare alle 3 am -> false. Statua walther, si invece, allora true
	boolean booked;
	boolean fixedTime; //se l'evento non si puo spostare. E.g. una partita di calcio, comincia esattamente alle 20:45^
	String type = null;
	String picUrl = null;
	//only for temporary stores items
	String UUID = null;

	
	public Item(String name,String address)  { 
		this.name = name;
		this.address = address;
	}
	
	public Item(String name,String address,String phoneNumber) { 
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}
	
	public Item(String name, String address, String phoneNumber,
			String duration, Calendar startTime, Calendar endTime,
			boolean weatherSensitive, boolean allDay, boolean booked,
			boolean fixedTime, String type, String picUrl, String uUID) {
		super();
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.duration = duration;
		this.startTime = startTime;
		this.endTime = endTime;
		this.weatherSensitive = weatherSensitive;
		this.allDay = allDay;
		this.booked = booked;
		this.fixedTime = fixedTime;
		this.type = type;
		this.picUrl = picUrl;
		UUID = uUID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public Calendar getStartTime() {
		return startTime;
	}

	public void setStartTime(Calendar startDate) {
		this.startTime = startDate;
	}

	public Calendar getEndTime() {
		return endTime;
	}

	public void setEndTime(Calendar endDate) {
		this.endTime = endDate;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getUUID() {
		return UUID;
	}

	public void setUUID(String uUID) {
		UUID = uUID;
	}
	
	
	
}