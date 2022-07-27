package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.helper.connectionProvider;
import java.sql.*;
import java.util.ArrayList;


public class PostDao {
	
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<Category>();
		
		try {
			String q = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(q);
			
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("c_name");
				String desc = set.getString("description");
				Category category = new Category(cid,name, desc);
				list.add(category);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
}
