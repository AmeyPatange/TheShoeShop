package com.ecommerce.model;

import javax.persistence.*;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Category")
@Component
public class Category {

	@Id
	@GeneratedValue
	private int categoryID;
	
	@Column(name="Type")
	private String categoryType;

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	
	
}
