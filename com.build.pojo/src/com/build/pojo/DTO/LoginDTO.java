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
	private int groupId;
	private String groupTitle;
	private List<ResultSetDTO> roles;
	private int rightsId;
	private String rightsTitle;
	private int userId;
	private String userTitle;
	private String username;
	private String password;
	private boolean loggedIn;
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
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
	public int getRightsId() {
		return rightsId;
	}
	public void setRightsId(int rightsId) {
		this.rightsId = rightsId;
	}
	public String getRightsTitle() {
		return rightsTitle;
	}
	public void setRightsTitle(String rightsTitle) {
		this.rightsTitle = rightsTitle;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
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
	}
	
	

}
