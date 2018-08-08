package com.junoFlow.commons;

import java.util.HashMap;

public class SelectDateModule {

	public static HashMap<String, String> getSelectDate() {
		HashMap<String, String> result = new HashMap<String, String>();
		int year = Integer.parseInt(new GetCalendar().getDay().split("년")[0]);
		StringBuffer yearStr = new StringBuffer();
		yearStr.append("<option value=\'-1\'>년도</option>");
		for(int i = year; i >= 1920; i--) {
			yearStr.append("<option value=\'" + i + "\'>" + i + "</option>");
		}
		result.put("year", yearStr.toString());
		
		StringBuffer monthStr = new StringBuffer();
		monthStr.append("<option value=\'-1\'>월</option>");
		for(int i = 1; i <= 12; i++) {
			monthStr.append("<option value=\'" + i + "\'>" + i + "</option>");
		}
		result.put("month", monthStr.toString());
		StringBuffer dayStr = new StringBuffer();
		dayStr.append("<option value=\'-1\'>일</option>");
		for(int i = 1; i <= 31; i++) {
			dayStr.append("<option value=\'" + i + "\'>" + i + "</option>");
		}
		result.put("day", dayStr.toString());
		
		return result;
	}
	
}
