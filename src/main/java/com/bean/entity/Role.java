package com.bean.entity;

import java.io.Serializable;

/**
 * 职务实体
 * @author SZU
 *
 */
public class Role implements Serializable {

	private Integer id;
	private String name;
	
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
