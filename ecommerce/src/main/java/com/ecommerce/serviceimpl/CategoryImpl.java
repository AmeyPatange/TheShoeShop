package com.ecommerce.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.IcategoryDao;
import com.ecommerce.service.Icategory;

@Service
public class CategoryImpl implements Icategory {

	@Autowired
	IcategoryDao catlist;
	
	public String getAllCategories() {
	
		return catlist.getAllCategory();
	}

	public void addCategory(String name) {
		catlist.addCategory(name);
		
	}

	public void deleteCategory(int catid) {
	
		catlist.deleteCategory(catid);
	}

	public String getCategory(int catId) {
		return catlist.getCategory(catId);
	}

}
