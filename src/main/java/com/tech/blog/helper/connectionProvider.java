package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Iterator;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

public class connectionProvider {
	
	private static Connection con;
	public static Connection getConnection() {
		
		try {
			if(con == null) {
				// driver class load.
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				// create connection 
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","yash123");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
