package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.connectionProvider;

@MultipartConfig
public class addPostServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		
		Integer cid = Integer.parseInt(req.getParameter("cid"));
		String pTitle = req.getParameter("pTitle");
		String pContent = req.getParameter("pContent");
		String pCode = req.getParameter("pCode");
		Part part = req.getPart("pic");
		
		
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("currentUser");
		
		
		Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(),null, cid, user.getId());
		
		PostDao dao = new PostDao(connectionProvider.getConnection());
		
		if(dao.savePost(post)) {
			String Path = req.getRealPath("/")+"blogPic"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), Path);
			out.println("done");
		}else {
			out.println("error");
		}
	}
	
	
}
