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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		response.setContentType("text/html");

		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();

		// get the user from the session

		HttpSession s = request.getSession();

		User user = (User) s.getAttribute("currentUser");

		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String 	oldFile=user.getProfile();
		user.setProfile(imageName);

		// Update database......
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());

		boolean ans = userDao.updateUser(user);

		if (ans) {

			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
			
			//delete old file 
			
			String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
			if(!oldFile.equals("default.png")) {
				Helper.deleteFile(pathOldFile);
			}
			
			
			
			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("updated profile....");
				Message msg = new Message("Profile updated succesfuly", "success", "alert-success");
				s.setAttribute("msg", msg);
				
				response.sendRedirect("profile.jsp");

				
			}

		} 
		else {
			
			Message msg1 = new Message("Something went wrong..", "error", "alert-danger");
			s.setAttribute("msg", msg1);
			
			
			response.sendRedirect("profile.jsp");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
