package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.MessageClass;

public class LogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession s2 = req.getSession();
		s2.removeAttribute("currentUser");
		
		MessageClass mess = new  MessageClass("LogOut Successfully", " success", "alert-success ");
	    s2.setAttribute("msg", mess);
	    	    

	    resp.sendRedirect("login.jsp");
	
	}
	
	

}
