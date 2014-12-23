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
import com.build.user.manager.UserLoginManager;
import com.build.view.util.CommonUtil;

public class LoginService {
	private UserDTO userDTO;
	private GroupDTO groupDTO;
	private LoginDTO loginDTO;
	HttpServletRequest request = (HttpServletRequest) (FacesContext
			.getCurrentInstance().getExternalContext().getRequest());

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
		List<Object> res = UserLoginManager.getInstance().validateUser(userDTO);
		if (res.size() > 0) {
			UserDTO userDTO = (UserDTO) res.get(0);
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
	}

	public String doLogout() {
		UserLoginManager.getInstance().doLogout(request);
		System.out.println("logged out");
		return "/login.xhtml?faces-redirect=true";
	}

	public void getRoles() {
		List<ResultSetDTO> resDTO = new ArrayList<ResultSetDTO>();
		List<Object> obj = UserLoginManager.getInstance().getUser(userDTO);
		if (obj.size() > 0) {
			UserDTO userDTO = (UserDTO) (obj.get(0));
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
	}
}
