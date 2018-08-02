package com.junoFlow.commons;

import java.util.HashMap;

public class PageModule {

	public static String makePage(String pagename, HashMap<String, String> pageDTO) {
		
		StringBuffer sb = new StringBuffer(); 
		int listsize = Integer.parseInt(pageDTO.get("ls"));
		int pagesize = Integer.parseInt(pageDTO.get("ps"));
		int cp = Integer.parseInt(pageDTO.get("cp"));
		int totalcnt = Integer.parseInt(pageDTO.get("totalcnt"));
		int totalpage = totalcnt / listsize + 1 + (totalcnt % listsize == 0 ? -1 : 0);
		int usergroup = cp/pagesize + (cp % pagesize == 0 ? -1 : 0);
		
		if(usergroup != 0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (usergroup-1)*pagesize+pagesize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}
		for(int i = (usergroup*pagesize+1); i <= (usergroup*pagesize+pagesize); i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if(i==totalpage)break;
		}
		
		if(usergroup != (totalpage/pagesize-(totalpage%pagesize==0?1:0))) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (usergroup + 1) * pagesize + 1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}
	
}
