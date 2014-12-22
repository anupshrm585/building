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
@Table(name = "edu_group")
@SuppressWarnings("serial")
public class GroupDTO implements Serializable {
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "title")
	private String title;
	@Column(name = "is_deleted")
	private String deleted = "N";
	@Column(name = "is_active")
	private String active = "Y";
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "groupDTO")
	private List<UserDTO> userDTO = new ArrayList<UserDTO>();
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "edu_group_roles", joinColumns = @JoinColumn(name = "group_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private List<RoleDTO> roleDTO = new ArrayList<RoleDTO>();

	public GroupDTO() {
	}

	public GroupDTO(String id, String title, String deleted, String active) {
		super();
		this.id = id;
		this.title = title;
		this.deleted = deleted;
		this.active = active;
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

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public List<RoleDTO> getRoleDTO() {
		return roleDTO;
	}

	public void setRoleDTO(List<RoleDTO> roleDTO) {
		this.roleDTO = roleDTO;
	}

	public List<UserDTO> getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(List<UserDTO> userDTO) {
		this.userDTO = userDTO;
	}

}
