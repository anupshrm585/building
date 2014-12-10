package com.build.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
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
	public static List<Object> getValues(Object obj){
		Class<?> objClass = obj.getClass();
	    Field[] fields = objClass.getDeclaredFields();
	    List<Object> value = new ArrayList<Object>();
	    for(Field field : fields) {
	        String name = field.getName();
	        name = name.substring(0, 1).toUpperCase() + name.substring(1);
			try {
				value.add(objClass.getMethod("get"+name, null).invoke(obj, null));
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		return value;
	}
	public static String createDelimStr(List<Object> items,String delim){
		String finalStr = "";
		int i=0;
		for(Object val : items){
			i++;
			if(BaseUtility.isEmpty(val))
				val="";
			if(items.size() > i)
				finalStr = finalStr + val + delim;
			else
				finalStr = finalStr + val;
		}
		System.out.println(finalStr);
		return finalStr;
	}
}

