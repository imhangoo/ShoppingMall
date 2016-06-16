package com.imhangoo.shopping.category;

import java.util.List;

public interface CategoryDAO {
	public void add(Category c);
	public List<Category> getCategoryList();
}
