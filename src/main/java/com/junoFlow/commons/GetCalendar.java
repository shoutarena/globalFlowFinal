package com.junoFlow.commons;

import java.util.Calendar;

public class GetCalendar {

	public String getTime() {
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		return h + ":" + m + ":" + s;
	}
	
	public String getDay() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		return y + "년" + m + "월" + d + "일";
	}
	public String saveTime() {
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		return ""+h + m + s;
	}
}
