package com.build.user.util;

import java.util.ResourceBundle;

public class ResourceUtility {
public static String getQuery(String key){
	ResourceBundle rb = ResourceBundle.getBundle("com.build.user.database.resource.query");
	return rb.getString(key);
}
public static String getHQL(String key){
	ResourceBundle rb = ResourceBundle.getBundle("com.build.user.database.resource.hql");
	return rb.getString(key);
}
public static String getConfiguration(String key){
	ResourceBundle rb = ResourceBundle.getBundle("com.build.user.database.resource.config");
	return rb.getString(key);
}
}
