<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<script type="text/javaScript" src="js/myjs.js"></script>

<div class="row">
	<%
	
	
	PostDao p = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	
	List<Post> posts = null;

	if (cid == 0) {
		
		posts = p.getAllPosts();
		
	} else {
		
		posts = p.getPostByCatId(cid);
		
	}
	if(posts.size()==0){
		
		out.println("<h3>No post in this Category</h3>");
		
		return;
	}

	for (Post pst : posts) {
	%>
	<div class="col-md-10 mb-2">
	
		<div class="card">
		
			<img class="card-img-top" src="blog_pic/<%=pst.getpPic()%>" alt="Card image cap" style="width: 100%"> <b> <%=pst.getpTitle()%></b>
			
			<p><%=pst.getpContent()%></p>
			
			<pre><%=pst.getpCode()%></pre>
			
			<%  
				User user=(User)session.getAttribute("currentUser");
				LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
			%>

			<div class="card-footer text-center primary-background">
			
			<a href="#!" onclick="doLike(<%=pst.getPid()%>,<%=user.getId() %>) " class="btn btn-outline-light"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=ld.countLikeOnPost(pst.getPid()) %></span></a>
			
			<a href="show_blog_page.jsp?post_id=<%=pst.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
			
			<a href="#!" class="btn btn-outline-light"><i class="fa fa-commenting-o"></i><span> 20</span></a>
			
		</div>
		</div>
		
	</div>

	<%
	}
	%>
</div>