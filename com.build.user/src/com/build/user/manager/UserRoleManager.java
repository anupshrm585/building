package com.build.user.manager;

import java.io.Serializable;

import com.build.pojo.DTO.RoleDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.util.ResourceUtility;

@SuppressWarnings("serial")
public class UserRoleManager implements Serializable {
	HibernateDBManager hdbManager = new HibernateDBManager();

	public Object insertData(RoleDTO roleDTO) {
		return hdbManager.insertData(roleDTO,
				ResourceUtility.getConfiguration(Constants.ROLE_CODE));
	}

	public int updateData(RoleDTO roleDTO) {
		// TODO Auto-generated method stub
		return hdbManager.updateData(roleDTO);
	}

	public Object getRoles() {
		// TODO Auto-generated method stub
		return hdbManager.getList(ResourceUtility.getHQL(Constants.FETCH_ROLE));
	}

	public int deleteData(RoleDTO roleDTO) {
		// TODO Auto-generated method stub
		return hdbManager.updateData(roleDTO);
	}

}
