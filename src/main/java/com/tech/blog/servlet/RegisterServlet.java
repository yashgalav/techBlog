package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.connectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//fetch all data from register servlet
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String check = req.getParameter("check");
		
		
		if(check == null) {
			out.println("box not checked");
		}else {
			// rest of the data here
			String name = req.getParameter("user_name");
			String email = req.getParameter("user_email");
			String password = req.getParameter("user_password");
			String gender = req.getParameter("gender");
			String about = req.getParameter("about");
			
			//create User object and set all data to that object...
			User setUserDetail  = new User(name,email,password,gender,about);
			
			
			
			//create UserDao object....
			UserDao dao = new UserDao(connectionProvider.getConnection());
			
			if(dao.saveUser(setUserDetail)) {
				// dao returns boolean  value if its true then if block is execute.
				out.println("done");
			}else {
				out.println("error");
			}
		}
		
		
	}

	
	
	
	
	
	
	
	
}
