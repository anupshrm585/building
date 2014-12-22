package com.build.pojo.DTO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Entity
@Table(name="edu_user")
@SuppressWarnings("serial")
public class UserDTO implements Serializable {
	@Id
	@Column(name="id")
	private String id;
	@Column(name="title")
	private String title;
	@Column(name="username")
	private String username;
	@Column(name="password")
	private String password;
	@Column(name="email_id")
	private String emailId;
	@Column(name="is_active")
	private String active = "Y";
	@Column(name="is_deleted")
	private String deleted = "N";
	@ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinTable(name="edu_user_group", 
	                joinColumns=@JoinColumn (name="user_id"), 
	                inverseJoinColumns=@JoinColumn(name="group_id"))
	private List<GroupDTO> groupDTO = new ArrayList<GroupDTO>();

	public UserDTO(){}
	public UserDTO(String id, String title, String username, String password,
			String emailId, String active, String deleted) {
		super();
		this.id = id;
		this.title = title;
		this.username = username;
		this.password = password;
		this.emailId = emailId;
		this.active = active;
		this.deleted = deleted;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public List<GroupDTO> getGroupDTO() {
		return groupDTO;
	}

	public void setGroupDTO(List<GroupDTO> groupDTO) {
		this.groupDTO = groupDTO;
	}
	

}
