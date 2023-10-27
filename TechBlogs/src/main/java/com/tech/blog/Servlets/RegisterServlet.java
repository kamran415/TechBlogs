package com.tech.blog.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out=response.getWriter()){
			
			
			// fetch all from the data ...
			
			
			String check=request.getParameter("check");
			if(check==null) {
				out.println("Please check term and conditions");
				
			}
			else {
				
				String name=request.getParameter("user_name");
				String email=request.getParameter("user_email");
				String password=request.getParameter("user_password");
				String gender=request.getParameter("gender");
				String about=request.getParameter("user_about");
				
				//create user object and set all data  to the object.
				
				User user=new User(name,email,password,gender,about);
				
				UserDao dao=new  UserDao(ConnectionProvider.getConnection());
				if(dao.saveUser(user)) {
					System.out.println("done");
				}
				else {
					System.out.println("error");
				}
				
			}
			
			
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
