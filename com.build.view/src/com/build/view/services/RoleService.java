package com.build.view.services;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.RoleDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.util.ResourceUtility;
import com.build.util.BaseUtility;
import com.build.view.util.CommonUtil;

@SuppressWarnings("serial")
public class RoleService implements Serializable {
	private RoleDTO roleDTO;
	private List<RoleDTO> roleDTOList;
	HibernateDBManager hdbManager = new HibernateDBManager();


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
		return (List<RoleDTO>) (Object) hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_ROLE));
	}

	public void newRecord() {
		roleDTO = new RoleDTO();
	}

	/*public void saveRecord(){
		String id=null;
		try {
			id=dbManager.callProcedure(roleDTO,
					ResourceUtility.getQuery(Constants.GROUP_DETAILS),
			ResourceUtility.getConfiguration(Constants.GROUP_CODE));
			if(BaseUtility.isNotEmpty(id)){
				if(id.equals("Success")){
					CommonUtil.displayMessage("Successfully Updated!");
				}
				else
					CommonUtil.displayMessage(id+ " Created Successfully!");
			}else{
				CommonUtil.displayMessage("Error Occurded!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}*/
	public void saveRecord() {
		 System.out.println(roleDTO.getId());
		String id = null;
		if (BaseUtility.isEmpty(roleDTO.getId())) {
			if (BaseUtility.isNotEmpty(id = (String)hdbManager
					.insertData(roleDTO,ResourceUtility.getConfiguration(Constants.ROLE_CODE))))
				CommonUtil.displayMessage("Successfully Id Created! " + id);
			else
				CommonUtil.displayMessage("Error Occurded!");
			
		} else {
			
			if (hdbManager.updateData(roleDTO) == 1)
				CommonUtil.displayMessage("Successfully Updated!");
			else
				CommonUtil.displayMessage("Error Occurded!");
		}
	}

	public void deleteRecord() {
		for (RoleDTO roleDTO : roleDTOList) {
			/*roleDTO.setDeleted("Y");
			roleDTO.setActive("N");*/
			if (hdbManager.deleteData(roleDTO) == 1)
				CommonUtil.displayMessage(roleDTO.getTitle()
						+ "Successfully Deleted!");
			else
				CommonUtil.displayMessage("Error Occured in deleting "
						+ roleDTO.getTitle());
		}
	}
	
	/*public void deleteRecord() {
		for (roleDTO roleDTO : roleDTOList) {
			roleDTO.setDeleted("N");
			roleDTO.setActive("N");
			String id=null;
			try {
				id=dbManager.callProcedure(roleDTO,
						ResourceUtility.getQuery(Constants.GROUP_DETAILS),
				ResourceUtility.getConfiguration(Constants.GROUP_CODE));
				if(BaseUtility.isNotEmpty(id)){
					if(id.equals("Success")){
						CommonUtil.displayMessage(roleDTO.getId()+" Successfully Deleted!");
					}
					
				}else{
					CommonUtil.displayMessage("Error Occurded!");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}*/

	
}
