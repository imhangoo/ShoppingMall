package com.imhangoo.shopping;

import java.sql.*;
import java.util.*;

import com.imhangoo.shopping.util.DB;

public class User {
	private int id;
	private String username;
	private String password;
	private Timestamp rdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	// save user info into database
	public void save(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DB.getConn();
			String sql = "insert into ruser values (null, ?, ?, ?)";
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setTimestamp(3, rdate);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	



}
