package com.build.connection.util;

import java.util.ResourceBundle;

public class ResourceUtility {
	public static String MYSQL = "mysql.config.properties";
	public static String getKey(String key){
		ResourceBundle rb=ResourceBundle.getBundle("com.build.connection.resources");
		System.out.println(rb.getKeys());
		return null;	
	}
	public static String getConfiguration(String key){
		
		return ResourceBundle.getBundle(getKey(MYSQL)).getString(key);
		
		}
	}

