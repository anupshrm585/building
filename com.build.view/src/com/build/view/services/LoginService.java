package com.build.view.services;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import com.build.pojo.DTO.LoginDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.DatabaseManager;
import com.build.user.manager.UserLoginManager;
import com.build.user.util.ResourceUtility;


public class LoginService {
	private LoginDTO loginDTO;
	HttpServletRequest request = (HttpServletRequest) (FacesContext.getCurrentInstance().getExternalContext().getRequest());
	DatabaseManager dbManager = new DatabaseManager();
	
	public LoginDTO getLoginDTO() {
		return loginDTO;
	}
	public void setLoginDTO(LoginDTO loginDTO) {
		this.loginDTO = loginDTO;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void showMessage(String displayMsg){
	        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, displayMsg,  null);
	        FacesContext.getCurrentInstance().addMessage(null, message);
	
	}
	public String doLogin(){		
		loginDTO=dbManager.doLogin(loginDTO);		
		if(loginDTO.isLoggedIn()){
			UserLoginManager.getInstance().doLogin(request, loginDTO);
			return "view/dashboard.xhtml?faces-redirect=true";
		}
		showMessage("Credentials Provided was incorrect");
		return "";
	}
	
	
	public String doLogout(){
		UserLoginManager.getInstance().doLogout(request);
		//loginDTO.setLoggedIn(false);
		System.out.println("logged out");
		return "/login.xhtml?faces-redirect=true";
	}
	
	public void getRoles(){
		List<String> str =new ArrayList<String>();
		str.add(loginDTO.getUsername());
		loginDTO.setRoles(dbManager.fetchResults(ResourceUtility.getQuery(Constants.FETCH_ROLES),str));
	}
}
