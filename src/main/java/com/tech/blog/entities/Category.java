package com.tech.blog.entities;

public class Category {
	private int cid;
	private String c_name;
	private String description;
	
	public Category(int cid, String c_name, String description) {
		super();
		this.cid = cid;
		this.c_name = c_name;
		this.description = description;
	}
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}
