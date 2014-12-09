package com.build.util;

import java.util.List;

public class BaseUtility {
	public static boolean isEmpty(Object obj){
	    return obj == null;
	  }	  
	public static boolean isEmpty(String obj){
	    return (obj == null) || ((obj != null) && ("".equals(obj)));
	  }
	  
	public static boolean isNotEmpty(Object obj){
	    return obj != null;
	  }
	  
	public static boolean isNotEmpty(String obj){
	    return (obj != null) && (!"".equals(obj));
	  }
	
	public static String makeString(String str,String delim,List<String> params){
		String finalStr="";
		int i=0;
		for(String tempStr : str.split("\\"+delim)){
			finalStr = finalStr + tempStr;
			if(params.size() > i){
				finalStr += "'"+params.get(i)+"'";
				i++;
			}
			
		}
		System.out.println(finalStr);
		return finalStr;
	}
/*	public static Object getSessionValue(HttpServletRequest request,String attr){
		if(isSession(request)){
			return request.getSession(false).getAttribute(attr);
		}
		return null;
	}
	
	public static boolean isSession(HttpServletRequest request){
		if(isNotEmpty(request.getSession(false))){
			return true;
		}
		return false;
	}*/
}

