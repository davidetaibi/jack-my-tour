package develop.com.jackmytour.core;

import java.util.Date;

public class CalendarEventS {
	private String name, location, startTime, endTime, instructor, description;	
	private int eventId;
	private boolean allDay;
	private CalStart calStart;
	private CalEnd calEnd;
	

	public CalendarEventS(String name, String location, String startTime,
			String endTime, String instructor, String description, int eventId,
			boolean allDay, CalStart calStart, CalEnd calEnd) {
		this.name = name;
		this.location = location;
		this.startTime = startTime;
		this.endTime = endTime;
		this.instructor = instructor;
		this.description = description;
		this.eventId = eventId;
		this.allDay = allDay;
		this.calStart = calStart;
		this.calEnd = calEnd;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public CalStart getCalStart() {
		return calStart;
	}

	public void setCalStart(CalStart calStart) {
		this.calStart = calStart;
	}

	public CalEnd getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(CalEnd calEnd) {
		this.calEnd = calEnd;
	}





	private class CalEnd {
		private String date;
		private boolean useUTC;
		
		public CalEnd(String date, boolean useUTC) {
			this.date = date;
			this.useUTC = useUTC;
		}
		
	}
	
	private class CalStart {
		private String date;
		private boolean useUTC;
		
		public CalStart(String date, boolean useUTC) {
			super();
			this.date = date;
			this.useUTC = useUTC;
		}
		
	}
	
}


