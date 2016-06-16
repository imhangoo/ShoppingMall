package com.imhangoo.shopping;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.imhangoo.shopping.util.DB;

public class UserManager {
	// get all users from database
	public static List<User> getUsers(){
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			String sql = "select * from ruser";
			rs = DB.executeQuery(stmt, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
			
		}
		return list;
	}
	
	/**
	 * delete user from database
	 * @param id
	 */
	public static void deleteUser(int id){
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			String sql = "delete from ruser where id=" + id;
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DB.close(stmt);
			DB.close(conn);
			
		}
	}
	
	/**
	 * validate user login info
	 * @param username
	 * @param password
	 * @return
	 * @throws UserNotFoundException
	 * @throws PasswordNotCorrectException
	 */
	public static User validate(String username, String password) throws UserNotFoundException, PasswordNotCorrectException{
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		User u = null;
		// check user name then check password
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			String sql = "select * from ruser where username = '" + username + "'";
			rs = DB.executeQuery(stmt, sql);
			if(!rs.next()){
				throw new UserNotFoundException();
			}else if(!rs.getString("password").equals(password)){
				throw new PasswordNotCorrectException();
			} else{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setRdate(rs.getTimestamp("rdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);	
		}
		
		return u;
	}
}
