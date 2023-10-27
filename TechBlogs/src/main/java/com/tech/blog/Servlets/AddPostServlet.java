package com.tech.blog.Servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out=response.getWriter()){
			int cid=Integer.parseInt(request.getParameter("cid"));
			String pTitle=request.getParameter("pTitle");
			String pContent=request.getParameter("pContent");
			String pCode=request.getParameter("pCode");
			Part part=request.getPart("pic");
			
			HttpSession session=request.getSession(); // It is used for get the user id inside the post table 
			User user=(User) session.getAttribute("currentUser"); 
			
			
			//out.println("your title is "+pTitle);
			
			//out.println(part.getSubmittedFileName()); 
			
			Post p=new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
			
			PostDao dao=new PostDao(ConnectionProvider.getConnection());
			
			if(dao.savePost(p)) {
				String path = request.getRealPath("/") + "blog_pic" + File.separator + part.getSubmittedFileName();
				Helper.saveFile(part.getInputStream(),path);
				out.println("done");
				
			}
			else {
				out.println("Some Error...");
				

			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
