
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">
<%
	

	PostDao d = new PostDao(connectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> list = null;
	
	
	if(cid == 0){
		 list = d.getAllPost();
	}else{
		list = d.getPostByCatId(cid);
	}
	
	
	if(list.size() == 0){
		out.println("<h3 class='display-3 text-center'>No Post in this Category...</h3>");
		return;
	}
	
	for(Post p: list){
%>
		
		<div class="col-md-6  mt-2">
			<div class="card">
				<img class="card-img-top" src="blogPic/<%= p.getP_pic() %>" alt="Card image cap">
				<div class="card-body">
					<b><%= p.getP_title() %></b>
					<p><%= p.getP_content() %></p>
					<pre style="background-color: #1a1a1a; color:white;"><%= p.getP_code() %></pre>
				</div>
				
				<div class="card-footer bg-primary text-center">
					<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
				
				</div>
				
			</div>		
		</div>
		
		
		
<%		
	}

%>
</div>