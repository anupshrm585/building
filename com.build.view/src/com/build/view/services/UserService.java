package com.build.view.services;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.UserDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.DatabaseManager;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.util.ResourceUtility;
import com.build.util.BaseUtility;
import com.build.view.util.CommonUtil;

@SuppressWarnings("serial")
public class UserService implements Serializable{
	private UserDTO userDTO;
	private List<UserDTO> userDTOList;
	HibernateDBManager hdbManager = new HibernateDBManager();
	DatabaseManager dbManager = new DatabaseManager();

	@SuppressWarnings("unchecked")
	public List<UserDTO> getGroups() {
		return (List<UserDTO>) (Object) hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_USER));
	}

	public void newRecord() {
		userDTO = new UserDTO();
	}

/*	public void saveRecord(){
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
		 System.out.println(userDTO.getId());
		String id = null;
		if (BaseUtility.isEmpty(userDTO.getId())) {
			if (BaseUtility.isNotEmpty(id = (String)hdbManager
					.insertData(userDTO,ResourceUtility.getConfiguration(Constants.USER_CODE))))
				CommonUtil.displayMessage("Successfully Id Created! " + id);
			else
				CommonUtil.displayMessage("Error Occurded!");
			
		} else {
			
			if (hdbManager.updateData(userDTO) == 1)
				CommonUtil.displayMessage("Successfully Updated!");
			else
				CommonUtil.displayMessage("Error Occurded!");
		}
	}

	public void deleteRecord() {
		for (UserDTO userDTO : userDTOList) {
			userDTO.setDeleted("N");
			userDTO.setActive("N");
			if (hdbManager.updateData(userDTO) == 1)
				CommonUtil.displayMessage(userDTO.getTitle()
						+ " Successfully Deleted!");
			else
				CommonUtil.displayMessage("Error Occured in deleting "
						+ userDTO.getTitle());
		}
	}
	
/*	public void deleteRecord() {
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
