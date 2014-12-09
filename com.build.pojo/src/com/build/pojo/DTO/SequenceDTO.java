package com.build.pojo.DTO;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "build_sequences")
@SuppressWarnings("serial")
public class SequenceDTO implements Serializable {
	@Id
	@Column(name = "sequence_name")
	private String sequenceName;
	@Column(name = "value")
	private String value;

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
