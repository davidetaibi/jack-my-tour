package develop.com.jackmytour.core;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Utils {

	public static List<Date> getDaysBetweenDates(String startdateStr,
			String enddateStr) {
		Date startdate = new Date(startdateStr);
		Date enddate = new Date(enddateStr);
		List<Date> dates = new ArrayList<Date>();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(startdate);

		while (calendar.getTime().before(enddate)) {
			Date result = calendar.getTime();
			dates.add(result);
			calendar.add(Calendar.DATE, 1);
		}
		return dates;
	}

	public static List<Date> getDaysBetweenDatesPlusOne(String startdateStr,
			String enddateStr) {
		Date startdate = new Date("12/13/2001");
		Date enddate = new Date("12/15/2001");
		List<Date> dates = new ArrayList<Date>();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(startdate);

		while (calendar.getTime().before(enddate)) {
			Date result = calendar.getTime();
			dates.add(result);
			calendar.add(Calendar.DATE, 1);
		}
		dates.add(new Date(enddate.getTime() ));
		return dates;
	}
	
	public static String formatDate(Date day) {

		DateFormat formatter;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date lDate = day;
		return formatter.format(lDate);

	}
	
	public static Calendar addDate(Calendar date, long units) {
		Calendar result = Calendar.getInstance();
		result.setTimeInMillis(date.getTimeInMillis() + units); 
//		System.out.println("===================addDate");
//		System.out.println("date.getTime() = " + date.getTime().getTime());
//		System.out.println("result.getTime() = " + result.getTime().getTime());
		
		return result;
	}
}
