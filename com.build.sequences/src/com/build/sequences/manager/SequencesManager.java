package com.build.sequences.manager;

import java.io.Serializable;

import com.build.pojo.DTO.SequenceDTO;
import com.build.sequences.database.manager.HibernateDBManager;

@SuppressWarnings("serial")
public class SequencesManager implements Serializable {
	HibernateDBManager hdbManager = new HibernateDBManager();

	public Object insertData(SequenceDTO sequenceDTO) {
		return hdbManager.insertData(sequenceDTO);
	}

	public int updateData(SequenceDTO sequenceDTO) {
		// TODO Auto-generated method stub
		return hdbManager.updateData(sequenceDTO);
	}

	public int deleteData(SequenceDTO sequenceDTO) {
		// TODO Auto-generated method stub
		return hdbManager.updateData(sequenceDTO);
	}
}
