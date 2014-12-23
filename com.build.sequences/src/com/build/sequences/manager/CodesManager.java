package com.build.sequences.manager;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.CodesDTO;
import com.build.sequences.database.manager.HibernateDBManager;

@SuppressWarnings("serial")
public class CodesManager implements Serializable {
	HibernateDBManager hdbManager = new HibernateDBManager();

	public Object insertData(CodesDTO codeDTO) {
		return hdbManager.insertData(codeDTO);
	}

	public int updateData(CodesDTO codeDTO) {
		// TODO Auto-generated method stub
		return hdbManager.updateData(codeDTO);
	}

	public int deleteData(CodesDTO codeDTO) {
		// TODO Auto-generated method stub
		return hdbManager.updateData(codeDTO);
	}
	public List<Object> getList(){
		return hdbManager.getList(CodesDTO.class);
	}
}
