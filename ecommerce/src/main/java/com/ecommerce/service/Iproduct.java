package com.ecommerce.service;


import com.ecommerce.model.Product;

public interface Iproduct {

	void addProduct(Product product); // add to database

	int getProductIdFromDb();    //to get a particular id

	String getProduct(int i); //all products for particular supplier id
	
	String getProductData(int id);   // one single product
	
	void updateProduct(Product prod);  //to update a product

	void deleteProduct(int id); //delete by Id
	
	String getAllProduct();   //all products from database

	String getDemandedProduct(String category, String forWhom); // returns like casual for men or casual for women

	String getAllBrands();  // gets all brands

	String getDemandedProduct(String string, String string2, String string3); // get according to Sports , Men , BOTH

	String getProductsByNameAndBrand(); //get all products by only name and brand..

	
	
	
}
