package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.MessageClass;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.connectionProvider;

@MultipartConfig
public class profileEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
       //fetching all data for edit ...
		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String password = req.getParameter("user_password");
		String about = req.getParameter("about");
		Part part = req.getPart("user_pic");
		String imgName = part.getSubmittedFileName();
		
		//get user from the session..
		HttpSession s = req.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		String oldPic = user.getProfile();
		user.setProfile(imgName);
		
		//update query
		UserDao userDao = new UserDao(connectionProvider.getConnection());
		boolean ans =userDao.updateUser(user); 
		if(ans) {
				System.out.println("success..");
				
				// old File path
				String oldFilePath = req.getRealPath("/")+"pics"+File.separator+oldPic; 
				
				// new File path
				String path = req.getRealPath("/")+"pics"+File.separator+user.getProfile(); 
				
				// old profile delete 
				Helper.deleteFile(oldFilePath);
				
				// new profile save
				if(Helper.saveFile(part.getInputStream(), path)) {
					System.out.println("profile updated...");
					System.out.println(path);
					MessageClass msg = new MessageClass("profile updated...","success","alert-success");
			    	s.setAttribute("msg", msg);
				}else {
					MessageClass msg = new MessageClass("something went wrong!","error","alert-danger");
			    	s.setAttribute("msg", msg);
				}
				
				
		}else {
				System.out.println("not success..");
				MessageClass msg = new MessageClass("something went wrong!","error","alert-danger");
		    	s.setAttribute("msg", msg);
		}
		resp.sendRedirect("profile.jsp");
	}
}
