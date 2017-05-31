package com.ecommerce.service;

public interface Icategory {

	public String getAllCategories(); // gets all categories
	
	void addCategory(String name);	 //adds category

	public void deleteCategory(int catid);  // delete categories 

	public String getCategory(int catId);  //gets A particular category according to Id
	
}
