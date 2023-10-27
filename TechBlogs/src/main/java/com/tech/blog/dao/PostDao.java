package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		
		this.con = con;
	}
	
	
	public ArrayList<Category>  getAllCategories(){
		ArrayList<Category> list=new ArrayList<>();
		try {
			String q="select * from categories";
			Statement stmt=this.con.createStatement();
			ResultSet set=stmt.executeQuery(q);
			while(set.next()) {
				int cid=set.getInt("Cid");
				String name=set.getString("name");
				String description=set.getString("description");
				
				Category c=new Category(cid,name,description);
				list.add(c);
			}
		}
		catch(Exception e) {
			System.out.println("chla ja ....");
		}
		
		return list;
	}
	
	
	public boolean savePost(Post p) {

		boolean f=false;
		try {
			String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1,p.getpTitle());
			pstmt.setString(2,p.getpContent());
			pstmt.setString(3,p.getpCode());
			pstmt.setString(4,p.getpPic());
			pstmt.setInt(5,p.getCatId());
			pstmt.setInt(6,p.getUserId());
			pstmt.executeUpdate();
			
			
			f=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	//get All the posts
	public List<Post> getAllPosts(){
		List<Post> list=new ArrayList<>();
		//fetch all the post
		try {
			PreparedStatement p=con.prepareStatement("select * from posts order by pid desc");
			ResultSet rs=p.executeQuery();
			while(rs.next()) {
				int pId=rs.getInt("pid");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String pCode=rs.getString("pCode");
				String pPic=rs.getString("pPic");
				Timestamp pDate=rs.getTimestamp("pDate");
				int catId=rs.getInt("catId");
				int userId=rs.getInt("userId");
				
				Post post=new Post(pId,pTitle,pContent,pCode,pPic,pDate,catId,userId); //every time for each row of the data base stored in the list 
				list.add(post);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	

	public List<Post> getPostByCatId(int catId){
		List<Post> list=new ArrayList<>();
		//fetch all the post by id
		
		try {
			PreparedStatement p=con.prepareStatement("select * from posts where catId= ?");
			p.setInt(1,catId);
			ResultSet rs=p.executeQuery();
			while(rs.next()) {
				int pId=rs.getInt("pid");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String pCode=rs.getString("pCode");
				String pPic=rs.getString("pPic");
				Timestamp pDate=rs.getTimestamp("pDate");
				
				int userId=rs.getInt("userId");
				
				Post post=new Post(pId,pTitle,pContent,pCode,pPic,pDate,catId,userId); //every time for each row of the data base stored in the list 
				list.add(post);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Post getPostByPostId(int postId) throws SQLException {
		
		Post post=null;
		
		String q="select * from posts where pid=?";
		
		PreparedStatement p=this.con.prepareStatement(q);
		
		p.setInt(1, postId);
		
		ResultSet rs=p.executeQuery();
		
		if(rs.next()) {
			
			int pId=rs.getInt("pid");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			String pPic=rs.getString("pPic");
			Timestamp pDate=rs.getTimestamp("pDate");
			int catId=rs.getInt("catId");
			int userId=rs.getInt("userId");
			
			post=new Post(pId,pTitle,pContent,pCode,pPic,pDate,catId,userId); //every time for each row of the data base stored in the list 

			
		}
		
		
		return post;
	}

}
