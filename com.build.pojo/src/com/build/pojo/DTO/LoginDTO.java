package com.build.pojo.DTO;

import java.io.Serializable;
import java.util.List;
/**
 * This class stores the necessary information of user login 
 * @author Anup
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LoginDTO implements Serializable{
	private UserDTO userDTO;
	private GroupDTO groupDTO;
	private String roleId;
	private boolean loggedIn;
	private List<ResultSetDTO> roles;
	
	public UserDTO getUserDTO() {
		return userDTO;
	}
	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}
	public GroupDTO getGroupDTO() {
		return groupDTO;
	}
	public void setGroupDTO(GroupDTO groupDTO) {
		this.groupDTO = groupDTO;
	}
	public List<ResultSetDTO> getRoles() {
		return roles;
	}
	public void setRoles(List<ResultSetDTO> roles) {
		this.roles = roles;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
	
	
	/*private String groupId;
	private String groupTitle;
	private List<ResultSetDTO> roles;
	private String rightsId;
	private String rightsTitle;
	private String userId;
	private String userTitle;
	private String username;
	private String password;
	private boolean loggedIn;

	public String getGroupTitle() {
		return groupTitle;
	}
	public void setGroupTitle(String groupTitle) {
		this.groupTitle = groupTitle;
	}
	
	
	public List<ResultSetDTO> getRoles() {
		return roles;
	}
	public void setRoles(List<ResultSetDTO> roles) {
		this.roles = roles;
	}

	public String getRightsTitle() {
		return rightsTitle;
	}
	public void setRightsTitle(String rightsTitle) {
		this.rightsTitle = rightsTitle;
	}

	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getRightsId() {
		return rightsId;
	}
	public void setRightsId(String rightsId) {
		this.rightsId = rightsId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserTitle() {
		return userTitle;
	}
	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}*/
	
	

}
