package com.ecommerce.dao;

public interface IcategoryDao {

	public String getAllCategory();   //gets all category
 
	public void addCategory(String name);

	public void deleteCategory(int catid);

	public String getCategory(int catId); //gets only one category
	
}
