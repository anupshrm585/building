package com.build.pojo.DTO;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "edu_sequences")
@SuppressWarnings("serial")
public class SequenceDTO implements Serializable {

	@Id
	@Column(name="code_id")
	private int codeId;
	@Column(name = "sequence_name")
	private String sequenceName;
	@Column(name = "value")
	private String value;

	public int getCodeId() {
		return codeId;
	}

	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}

	public String getSequenceName() {
		return sequenceName;
	}

	public void setSequenceName(String sequenceName) {
		this.sequenceName = sequenceName;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
