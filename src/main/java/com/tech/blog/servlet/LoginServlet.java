package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.mysql.cj.Session;
import com.mysql.cj.protocol.Message;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.MessageClass;
import com.tech.blog.entities.User;
import com.tech.blog.helper.connectionProvider;

public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		// fetching email and password from login page
		String email= req.getParameter("user_email");
		String password = req.getParameter("user_password");
		
		
		UserDao dao = new UserDao(connectionProvider.getConnection());
		
	    User u = dao.getUserByEmailAndPassword(email,password);
		
	    if(u == null) {
	    	//login error...
//	    	out.println("invalid");
	    	MessageClass msg = new MessageClass("Invalid details ! please try another","error","alert-danger");
	    	HttpSession s = req.getSession();
	    	s.setAttribute("msg", msg);
	    	resp.sendRedirect("login.jsp");
	    	
	    }else {
	    	//login successful...
	    	HttpSession session= req.getSession();
	    	session.setAttribute("currentUser", u);
	    	resp.sendRedirect("profile.jsp");
	    	
	    }
		
		
		
	}
}
