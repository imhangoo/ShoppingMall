package com.imhangoo.shopping.category;

import java.util.*;

public class CategoryService {
	private CategoryDAO dao;
	private static CategoryService service;
	private List<Category> categoryList;
	
	private CategoryService(){
		dao = new CategoryMysqlDAO();
	}
	
	public void add(Category c){
		dao.add(c);
	}
	
	// static factory method, singleton mode
	public static CategoryService getInstance(){
		if(service == null){
			service = new CategoryService();
		}
		return service;
	}
	
	public List<Category> getCategoryList(){
		categoryList = dao.getCategoryList();
		
		return categoryList;
		
	}
	
	

}
