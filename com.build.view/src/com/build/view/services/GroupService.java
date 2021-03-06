package com.build.view.services;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.GroupDTO;
import com.build.pojo.DTO.RoleDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.util.ResourceUtility;
import com.build.util.BaseUtility;
import com.build.view.util.CommonUtil;

@SuppressWarnings("serial")
public class GroupService implements Serializable {
	private GroupDTO groupDTO;
	private List<GroupDTO> groupDTOList;
	private List<RoleDTO> roleDTOList;
	HibernateDBManager hdbManager = new HibernateDBManager();
	public GroupDTO getGroupDTO() {
		return groupDTO;
	}

	public void setGroupDTO(GroupDTO groupDTO) {
		this.groupDTO = groupDTO;
	}

	public List<GroupDTO> getGroupDTOList() {
		return groupDTOList;
	}

	public void setGroupDTOList(List<GroupDTO> groupDTOList) {
		this.groupDTOList = groupDTOList;
	}
	

	public List<RoleDTO> getRoleDTOList() {
		return roleDTOList;
	}

	public void setRoleDTOList(List<RoleDTO> roleDTOList) {
		this.roleDTOList = roleDTOList;
	}

	@SuppressWarnings("unchecked")
	public List<GroupDTO> getGroups() {
		return (List<GroupDTO>) (Object) hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_GROUP));
	}

	@SuppressWarnings("unchecked")
	public void getRoles(){
		roleDTOList = (List<RoleDTO>) (Object) hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_ROLE));
	}
	
	public void newRecord() {
		groupDTO = new GroupDTO();
	}

	/*public void saveRecord(){
		String id=null;
		try {
			id=dbManager.callProcedure(groupDTO,
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
		 System.out.println(groupDTO.getId());
		String id = null;
		if (BaseUtility.isEmpty(groupDTO.getId())) {
			if (BaseUtility.isNotEmpty(id = (String)hdbManager
					.insertData(groupDTO,ResourceUtility.getConfiguration(Constants.GROUP_CODE))))
				CommonUtil.displayMessage("Successfully Id Created! " + id);
			else
				CommonUtil.displayMessage("Error Occurded!");
			
		} else {
			
			if (hdbManager.updateData(groupDTO) == 1)
				CommonUtil.displayMessage("Successfully Updated!");
			else
				CommonUtil.displayMessage("Error Occurded!");
		}
	}

	public void deleteRecord() {
		for (GroupDTO groupDTO : groupDTOList) {
			/*groupDTO.setDeleted("Y");
			groupDTO.setActive("N");*/
			if (hdbManager.deleteData(groupDTO) == 1)
				CommonUtil.displayMessage(groupDTO.getTitle()
						+ "Successfully Deleted!");
			else
				CommonUtil.displayMessage("Error Occured in deleting "
						+ groupDTO.getTitle());
		}
	}
	
	public void setEdit(GroupDTO groupDTO){
		setGroupDTO(groupDTO);
		getRoles();
	}
	public void activate(GroupDTO groupDTO){
		System.out.println(groupDTO.getActive());
		setGroupDTO(groupDTO);
		saveRecord();
	}
	/*public void deleteRecord() {
		for (GroupDTO groupDTO : groupDTOList) {
			groupDTO.setDeleted("N");
			groupDTO.setActive("N");
			String id=null;
			try {
				id=dbManager.callProcedure(groupDTO,
						ResourceUtility.getQuery(Constants.GROUP_DETAILS),
				ResourceUtility.getConfiguration(Constants.GROUP_CODE));
				if(BaseUtility.isNotEmpty(id)){
					if(id.equals("Success")){
						CommonUtil.displayMessage(groupDTO.getId()+" Successfully Deleted!");
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
