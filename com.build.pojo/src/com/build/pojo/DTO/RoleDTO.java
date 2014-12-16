package com.build.pojo.DTO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "build_roles")
@SuppressWarnings("serial")
public class RoleDTO implements Serializable {
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "title")
	private String title;
	@Column(name = "is_deleted")
	private String deleted = "N";
	@Column(name = "is_active")
	private String active = "Y";
	@Column(name = "url")
	private String url;
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "roleDTO")
	private List<GroupDTO> groupDTO = new ArrayList<GroupDTO>();

	public RoleDTO() {
	}

	public RoleDTO(String id, String title, String deleted, String active,
			String url) {
		super();
		this.id = id;
		this.title = title;
		this.deleted = deleted;
		this.active = active;
		this.url = url;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<GroupDTO> getGroupDTO() {
		return groupDTO;
	}

	public void setGroupDTO(List<GroupDTO> groupDTO) {
		this.groupDTO = groupDTO;
	}

}
