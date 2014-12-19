package com.build.view.services;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import com.build.pojo.DTO.GroupDTO;
import com.build.pojo.DTO.LoginDTO;
import com.build.pojo.DTO.ResultSetDTO;
import com.build.pojo.DTO.UserDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.manager.UserLoginManager;
import com.build.user.util.ResourceUtility;
import com.build.util.BaseUtility;
import com.build.view.util.CommonUtil;

public class LoginService {
	private UserDTO userDTO;
	private GroupDTO groupDTO;
	private LoginDTO loginDTO;
	HttpServletRequest request = (HttpServletRequest) (FacesContext
			.getCurrentInstance().getExternalContext().getRequest());
	HibernateDBManager hdbManager = new HibernateDBManager();

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public GroupDTO getGroupDTO() {
		return groupDTO;
	}

	public void setGroupDTO(GroupDTO groupDTO) {
		this.groupDTO = groupDTO;
	}

	public LoginDTO getLoginDTO() {
		return loginDTO;
	}

	public void setLoginDTO(LoginDTO loginDTO) {
		this.loginDTO = loginDTO;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void showMessage(String displayMsg) {
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO,
				displayMsg, null);
		FacesContext.getCurrentInstance().addMessage(null, message);

	}

	public String doLogin() {
		System.out.println(userDTO.getGroupDTO());
		System.out.println(loginDTO.getRoleId());
		// UserDTO userDTO=null;
		List<Object> res = hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_USER)
				+ " AND U.username = '"
				+ this.userDTO.getUsername()
				+ "' AND U.password = '"
				+ this.userDTO.getPassword() + "'");
		if (res.size() > 0) {
			UserDTO userDTO = (UserDTO)res.get(0);
			this.userDTO = userDTO;
			for (GroupDTO grp : userDTO.getGroupDTO()) {
				if (loginDTO.getRoleId().equals(grp.getId()))
					groupDTO = grp;
			}
			loginDTO.setUserDTO(userDTO);
			loginDTO.setGroupDTO(groupDTO);
			loginDTO.setLoggedIn(true);
			UserLoginManager.getInstance().doLogin(request, loginDTO);
			return "view/dashboard.xhtml?faces-redirect=true";
		}
		CommonUtil.displayMessage("Credentials Provided was incorrect!");
		return "";
		/*
		 * loginDTO=dbManager.doLogin(loginDTO); if(loginDTO.isLoggedIn()){ }
		 * showMessage("Credentials Provided was incorrect");
		 */
		// return "";
	}

	public String doLogout() {
		UserLoginManager.getInstance().doLogout(request);
		// loginDTO.setLoggedIn(false);
		System.out.println("logged out");
		return "/login.xhtml?faces-redirect=true";
	}

	public void getRoles() {
		List<ResultSetDTO> resDTO = new ArrayList<ResultSetDTO>();
		List<Object> obj = (hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_USER)
				+ " AND U.username = '"
				+ userDTO.getUsername() + "'"));
		if (obj.size() > 0) {
			UserDTO userDTO = (UserDTO) (obj.get(0));
			System.out.println(obj.get(0));
			this.userDTO = userDTO;
			ResultSetDTO temp = null;

			for (GroupDTO grp : userDTO.getGroupDTO()) {
				temp = new ResultSetDTO();
				temp.setId(grp.getId());
				temp.setTitle(grp.getTitle());
				System.out.println(temp.getId());
				resDTO.add(temp);
			}
			loginDTO.setRoles(resDTO);
		}
		/*
		 * List<String> str =new ArrayList<String>();
		 * str.add(loginDTO.getUsername());
		 * loginDTO.setRoles(dbManager.fetchResults
		 * (ResourceUtility.getQuery(Constants.FETCH_ROLES),str));
		 */
	}
}
