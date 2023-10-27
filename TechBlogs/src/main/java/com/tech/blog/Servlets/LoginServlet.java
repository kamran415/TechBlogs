package com.tech.blog.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		// fetch user name  and password by the request
		
		PrintWriter out=response.getWriter();
		
		out.println("<html>");
		out.println("<title>Servlet LoginServlet</title>");
		out.println("<body>");
		
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		
		System.out.println(email);
		System.out.println(password);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		User u=dao.getUserByEmailAndPassword(email, password);
		
		if(u==null) {
			// login......
			//out.println("Invalid Details...try again..");
			Message msg=new Message("Email or Password doesn't match...","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			
			response.sendRedirect("Login.jsp");
		}
		else {
			
			//success......
			HttpSession s=request.getSession();
			s.setAttribute("currentUser", u);
			
			response.sendRedirect("profile.jsp");
		}
		out.println("</body>");
		out.println("</html>");
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
