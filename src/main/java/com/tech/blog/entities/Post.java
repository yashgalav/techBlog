package com.tech.blog.entities;

import java.security.Timestamp;

public class Post {
	private int pid;
	private String p_title;
	private String p_content;
	private String p_code;
	private String p_pic;
	private Timestamp p_date;
	private int cat_id;
	
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Post(int pid, String p_title, String p_content, String p_code, String p_pic, Timestamp p_date, int cat_id) {
		super();
		this.pid = pid;
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_code = p_code;
		this.p_pic = p_pic;
		this.p_date = p_date;
		this.cat_id = cat_id;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getP_title() {
		return p_title;
	}


	public void setP_title(String p_title) {
		this.p_title = p_title;
	}


	public String getP_content() {
		return p_content;
	}


	public void setP_content(String p_content) {
		this.p_content = p_content;
	}


	public String getP_code() {
		return p_code;
	}


	public void setP_code(String p_code) {
		this.p_code = p_code;
	}


	public String getP_pic() {
		return p_pic;
	}


	public void setP_pic(String p_pic) {
		this.p_pic = p_pic;
	}


	public Timestamp getP_date() {
		return p_date;
	}


	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}


	public int getCat_id() {
		return cat_id;
	}


	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}


	public Post(String p_title, String p_content, String p_code, String p_pic, Timestamp p_date, int cat_id) {
		super();
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_code = p_code;
		this.p_pic = p_pic;
		this.p_date = p_date;
		this.cat_id = cat_id;
	}
	
	
	
	
}	
