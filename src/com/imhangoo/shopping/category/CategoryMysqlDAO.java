package com.imhangoo.shopping.category;

import com.imhangoo.shopping.util.DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class CategoryMysqlDAO implements CategoryDAO {
	
	private static List<Category> categoryList;
	
	// add a new record to Mysql
	public void add(Category c) {
		Connection conn = DB.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.getPStmt(conn, sql);
		try {
			pstmt.setInt(1, c.getPid());
			pstmt.setString(2, c.getName());
			pstmt.setString(3, c.getDescr());
			pstmt.setInt(4, c.isleaf()? 1 : 0);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(pstmt);
			DB.close(conn);
		}
		
	}
	
	// get category list from mysql
	public List<Category> getCategoryList() {
		categoryList = new ArrayList<Category>();
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		String sql = "SELECT * FROM category";
		ResultSet rs = DB.executeQuery(stmt, sql);
		Category c = null;
		try{
			while(rs.next()){
				c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setGrade(rs.getInt("grade"));
				c.setLeaf(rs.getInt("isleaf")==1?true:false);
				c.setPid(rs.getInt("pid"));
				categoryList.add(c);
			
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		
		return categoryList;
	}

}
