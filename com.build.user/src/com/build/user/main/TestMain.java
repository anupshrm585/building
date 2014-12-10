package com.build.user.main;

import java.lang.reflect.Field;

import com.build.pojo.DTO.GroupDTO;
import com.build.user.database.manager.DatabaseManager;
import com.build.user.database.manager.HibernateDBManager;

public class TestMain {
	public static void main(String[] args){
		GroupDTO groupDTO = new GroupDTO();
		groupDTO.setTitle("Testing");
		DatabaseManager dbManager = new DatabaseManager();
		/*HibernateDBManager hdbManager = new HibernateDBManager();
		System.out.println(hdbManager.insertData(groupDTO,"GRP"));*/
		try {
			//dbManager.printFields(groupDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
