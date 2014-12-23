package com.build.view.services;

import java.io.Serializable;
import java.util.List;

import com.build.pojo.DTO.CodesDTO;
import com.build.sequences.manager.CodesManager;

@SuppressWarnings("serial")
public class CodeService implements Serializable {
	CodesDTO codeDTO;
	CodesManager codesManager = new CodesManager();

	public CodesDTO getCodeDTO() {
		return codeDTO;
	}

	public void setCodeDTO(CodesDTO codeDTO) {
		this.codeDTO = codeDTO;
	}
	
	@SuppressWarnings("unchecked")
	public List<CodesDTO> getCodes(){
		return (List<CodesDTO>)(Object)codesManager.getList();
	}
	public void saveRecord(){
		
	}

}
