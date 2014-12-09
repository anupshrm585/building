package com.build.util;

import java.util.ResourceBundle;

public class ResourceUtility {
public static String getKey(String key){
	ResourceBundle rb = ResourceBundle.getBundle("");
	return rb.getString(key);
}
}
