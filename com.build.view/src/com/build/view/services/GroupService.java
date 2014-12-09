package com.build.view.services;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.GroupDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.util.ResourceUtility;
import com.build.util.BaseUtility;
import com.build.view.util.CommonUtil;

@SuppressWarnings("serial")
public class GroupService implements Serializable {
	private GroupDTO groupDTO;
	private List<GroupDTO> groupDTOList;
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

	@SuppressWarnings("unchecked")
	public List<GroupDTO> getGroups() {
		return (List<GroupDTO>) (Object) hdbManager.getList(ResourceUtility
				.getHQL(Constants.FETCH_GROUP));
	}

	public void newRecord() {
		groupDTO = new GroupDTO();
	}

	public void saveRecord() {
		// System.out.println(groupDTO.getId());
		int id = 0;
		if (groupDTO.getId() != 0) {
			if (hdbManager.updateData(groupDTO) == 1)
				CommonUtil.displayMessage("Successfully Updated!");
			else
				CommonUtil.displayMessage("Error Occurded!");
		} else {
			if (BaseUtility.isNotEmpty(id = (Integer) hdbManager
					.insertData(groupDTO)))
				CommonUtil.displayMessage("Successfully Id Created! " + id);
			else
				CommonUtil.displayMessage("Error Occurded!");
		}
	}

	public void deleteRecord() {
		for (GroupDTO groupDTO : groupDTOList) {
			groupDTO.setDeleted("N");
			groupDTO.setActive("N");
			if (hdbManager.updateData(groupDTO) == 1)
				CommonUtil.displayMessage(groupDTO.getTitle()
						+ "Successfully Deleted!");
			else
				CommonUtil.displayMessage("Error Occured in deleting "
						+ groupDTO.getTitle());
		}
	}

	
}
