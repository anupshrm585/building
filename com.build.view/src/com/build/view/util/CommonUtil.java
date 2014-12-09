package com.build.view.util;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

public class CommonUtil {
	public static void displayMessage(String msg){
		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(msg));
	}
	 public static void reset(String component) {
	        RequestContext.getCurrentInstance().reset(component);
	    }
	 
}
