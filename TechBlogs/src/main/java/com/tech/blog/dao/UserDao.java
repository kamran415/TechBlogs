package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;


public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean  saveUser(User user) {
		boolean  f=false;
		try {
			//user--> database
		   
			String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			
			f=true;
			pstmt.executeUpdate();	
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User getUserByEmailAndPassword(String email,String password) {
		User user=null;
		
		try {
			
			String query="select * from user where email=? and password=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user=new User();
				
				
				//data from db
				
				String name=rs.getString("name");
				
				//set to the user object  
				
				user.setName(name);
				
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile(rs.getString("profile"));
				user.setDateTime(rs.getTimestamp("rdate"));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return user;
	}

	public boolean updateUser(User user) {
		
		boolean f=false;
		try {
			String query="update user set name=? , email=? ,password=? , gender=? , about=? , profile=? where id=?";
			
			PreparedStatement  p= con.prepareStatement(query);
			
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7 , user.getId());
			
			
			f=true;
			p.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;  
	}

	
	public User getUserByUserId(int userId) {
		User user=null;
		
		try {
			
			String query="select * from user where id=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1,userId);
			
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user=new User();
				
				
				//data from db
				
				String name=rs.getString("name");
				
				//set to the user object  
				
				user.setName(name);
				
				
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile(rs.getString("profile"));
				user.setDateTime(rs.getTimestamp("rdate"));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return user;
	}
}










