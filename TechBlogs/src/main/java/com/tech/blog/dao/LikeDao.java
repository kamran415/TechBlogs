package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		
		this.con = con;
	}
	
	public boolean insertLike(int pid,int uid) {
		
		boolean f=false;
		try {
			String q="insert into liked(pId,Uid) values(?,?)";
			PreparedStatement p=this.con.prepareStatement(q);
			// values set.........
			
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			
			f=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLikeOnPost(int pid) {
		int count=0;
		
		try {
			String q="select count(*) from liked where pId=? ";
			PreparedStatement p=this.con.prepareStatement(q);
			
			p.setInt(1, pid);
			
			ResultSet rs=p.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		
		try {
			
			PreparedStatement p=this.con.prepareStatement("select * from liked where pId=? and Uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	public  boolean deleteLike(int pid,int uid) {
		boolean f=false;
		try {
			PreparedStatement p=this.con.prepareStatement("delete from liked where pId=? and Uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f; 
	}
}
