package com.build.user.main;

import com.build.pojo.DTO.GroupDTO;
import com.build.user.database.manager.HibernateDBManager;

public class TestMain {
	public static void main(String[] args){
		GroupDTO groupDTO = new GroupDTO();
		groupDTO.setTitle("Testing");
		HibernateDBManager hdbManager = new HibernateDBManager();
		System.out.println(hdbManager.insertData(groupDTO,"GRP"));
	}

}
