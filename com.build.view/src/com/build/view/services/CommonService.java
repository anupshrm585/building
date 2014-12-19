package com.build.view.services;

import java.io.Serializable;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import com.build.pojo.DTO.LoginDTO;
import com.build.pojo.DTO.RoleDTO;
import com.build.user.manager.UserLoginManager;

@SuppressWarnings("serial")
public class CommonService implements Serializable{
	public boolean getMenuRights(String url){
		System.out.println(url);
		 HttpServletRequest request = (HttpServletRequest) (FacesContext
				.getCurrentInstance().getExternalContext().getRequest());
		 LoginDTO loginDTO = (LoginDTO)UserLoginManager.getInstance().getSessionValue(request, "loginDTO");
		 System.out.println(loginDTO.getGroupDTO().getRoleDTO().size());
		 for(RoleDTO rolesDTO : loginDTO.getGroupDTO().getRoleDTO()){
			 System.out.println(rolesDTO.getUrl());
			 if(rolesDTO.getUrl().equals(url))
				 return true;
		 }
		return false;
	}

}
