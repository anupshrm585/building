package com.build.pojo.DTO;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="build_group")
@SuppressWarnings("serial")
public class GroupDTO implements Serializable{
@Id
@Column(name="id")
private String id;
@Column(name="title")
private String title;
@Column(name="is_deleted")
private String deleted ="N";
@Column(name="is_active")
private String active = "Y";


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

}
