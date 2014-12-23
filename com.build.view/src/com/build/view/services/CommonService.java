package com.build.view.services;

import java.io.Serializable;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import com.build.pojo.DTO.LoginDTO;
import com.build.pojo.DTO.RoleDTO;
import com.build.user.manager.UserLoginManager;
/**
 * CommonService helps in performing common functionalities
 * @author Anup
 */
@SuppressWarnings("serial")
public class CommonService implements Serializable{
	/**
	 * Get the rights over menuitems for a particular user who is logged in
	 * @param url pass the url to check the rights of the user
	 * @return true on success otherwise false
	 */
	public boolean getMenuRights(String url){
		 HttpServletRequest request = (HttpServletRequest) (FacesContext
				.getCurrentInstance().getExternalContext().getRequest());
		 LoginDTO loginDTO = (LoginDTO)UserLoginManager.getInstance().getSessionValue(request, "loginDTO");
		 for(RoleDTO rolesDTO : loginDTO.getGroupDTO().getRoleDTO()){
			 if(rolesDTO.getUrl().equals(url))
				 return true;
		 }
		return false;
	}

}
