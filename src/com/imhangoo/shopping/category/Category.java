package com.imhangoo.shopping.category;


public class Category {

	private int id;

	private String name;

	private String descr;

	private int pid;

	private boolean isleaf;

	private int grade;

	

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public boolean isleaf() {
		return isleaf;
	}

	public void setLeaf(boolean isleaf) {
		this.isleaf = isleaf;
	}

}
