package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.connectionProvider;

import java.sql.Timestamp;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


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
	
	public boolean savePost(Post p) {
		boolean f = false;
		try {
			
			String q = "insert into post(p_title, p_content, p_code, p_pic, category_id, userId ) value(?,?,?,?,?,?)";
			 PreparedStatement pstmt = con.prepareStatement(q);
			 pstmt.setString(1, p.getP_title());
			 pstmt.setString(2, p.getP_content());
			 pstmt.setString(3, p.getP_code());
			 pstmt.setString(4, p.getP_pic());			
			 pstmt.setInt(5, p.getCat_id());
			 pstmt.setInt(6, p.getUserId());
			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	
	List< Post> list;
	//get all the post
	public List<Post> getAllPost(){
		list = new ArrayList<Post>();
		
		// fetch all post from database
		try {
			PreparedStatement p = this.con.prepareStatement("select * from post order by pid desc");
			
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String  pTitle = set.getString("p_Title");
				String  pContent = set.getString("p_Content");
				String  pCode = set.getString("p_Code");
				Timestamp  pTime = set.getTimestamp("p_date");
				String  pPic = set.getString("p_pic");
				int catId = set.getInt("category_id");
				int userId = set.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pTime, catId, userId);
				
				list.add(post);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	// get post by category Id
	public List<Post> getPostByCatId(int cid){
		list = new ArrayList<Post>();
		
		try {
			PreparedStatement p = this.con.prepareStatement("select * from post where category_id =?");
			p.setInt(1, cid);
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String  pTitle = set.getString("p_Title");
				String  pContent = set.getString("p_Content");
				String  pCode = set.getString("p_Code");
				Timestamp  pTime = set.getTimestamp("p_date");
				String  pPic = set.getString("p_pic");
				int userId = set.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pTime, cid, userId);
				
				list.add(post);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	// get post by post Id
		public Post getPostByPostId(int pid){
			Post post = null;
			
			try {
				PreparedStatement p = this.con.prepareStatement("select * from post where pid =?");
				p.setInt(1, pid);
				ResultSet set = p.executeQuery();
				
				if(set.next()) {
					
					String  pTitle = set.getString("p_Title");
					String  pContent = set.getString("p_Content");
					String  pCode = set.getString("p_Code");
					Timestamp  pTime = set.getTimestamp("p_date");
					String  pPic = set.getString("p_pic");
					int userId = set.getInt("userId");
					int cid = set.getInt("category_id");
					
					post = new Post(pid, pTitle, pContent, pCode, pPic, pTime, cid, userId);
					
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return post;
		}
	

	
}
