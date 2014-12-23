package com.build.view.services;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.RoleDTO;
import com.build.user.manager.UserRoleManager;
import com.build.util.BaseUtility;
import com.build.view.util.CommonUtil;

@SuppressWarnings("serial")
public class RoleService implements Serializable {
	private RoleDTO roleDTO;
	private List<RoleDTO> roleDTOList;
	UserRoleManager roleManager = new UserRoleManager(); 

	public RoleDTO getRoleDTO() {
		return roleDTO;
	}

	public void setRoleDTO(RoleDTO roleDTO) {
		this.roleDTO = roleDTO;
	}

	public List<RoleDTO> getRoleDTOList() {
		return roleDTOList;
	}

	public void setRoleDTOList(List<RoleDTO> roleDTOList) {
		this.roleDTOList = roleDTOList;
	}

	@SuppressWarnings("unchecked")
	public List<RoleDTO> getRoles() {
		return (List<RoleDTO>) (Object) roleManager.getRoles();
	}

	public void newRecord() {
		roleDTO = new RoleDTO();
	}

	public void saveRecord() {
		 System.out.println(roleDTO.getId());
		String id = null;
		if (BaseUtility.isEmpty(roleDTO.getId())) {
			if (BaseUtility.isNotEmpty(id = (String)roleManager.insertData(roleDTO)))
				CommonUtil.displayMessage("Successfully Id Created! " + id);
			else
				CommonUtil.displayMessage("Error Occurded!");
			
		} else {
			
			if (roleManager.updateData(roleDTO) == 1)
				CommonUtil.displayMessage("Successfully Updated!");
			else
				CommonUtil.displayMessage("Error Occurded!");
		}
	}

	public void deleteRecord() {
		for (RoleDTO roleDTO : roleDTOList) {
			if (roleManager.deleteData(roleDTO) == 1)
				CommonUtil.displayMessage(roleDTO.getTitle()
						+ "Successfully Deleted!");
			else
				CommonUtil.displayMessage("Error Occured in deleting "
						+ roleDTO.getTitle());
		}
	}
	

	
}
