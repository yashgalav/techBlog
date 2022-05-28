package com.tech.blog.dao;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;
import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	// method to insert user to data base
	
	public boolean saveUser(User newUser) {
		boolean f =false;
		try {
            //user --> database
			
			String query = "insert into user(name, email, password, gender,about) values(?,?,?,?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(query); 
			pstmt.setString(1, newUser.getName());
			pstmt.setString(2, newUser.getEmail());
			pstmt.setString(3, newUser.getPassword());
			pstmt.setString(4, newUser.getGender());
			pstmt.setString(5, newUser.getAbout());
			
			pstmt.execute();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	// get user by userEmail and userPassword
	public User getUserByEmailAndPassword(String email, String password) {
		User getUser = null;
		try {
			
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set= pstmt.executeQuery();
			
			// set.next() means next represent if there is one row present then retrieve the data 
			if(set.next()) {
				
				getUser = new User();
				getUser.setId(set.getInt("id"));
				getUser.setName(set.getString("name"));
				getUser.setEmail(set.getString("email"));
				getUser.setPassword(set.getString("password"));
				getUser.setGender(set.getString("gender"));
				getUser.setAbout(set.getString("about"));
				getUser.setDateTime(set.getTimestamp("rtime"));
				getUser.setProfile(set.getString("profile"));
			}
			
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return getUser;
	}
	

	// update user
	public boolean updateUser(User user) {
		boolean f= false;
		try {
			String q = "update user set name = ?, email=?, password=?, gender=?, about=?, profile=? where id=?";
			PreparedStatement p = this.con.prepareStatement(q);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());
			
			p.executeUpdate();
			f=true;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	
	
	
}
