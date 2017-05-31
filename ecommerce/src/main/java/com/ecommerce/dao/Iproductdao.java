package com.ecommerce.dao;


import com.ecommerce.model.Product;


public interface Iproductdao {

		void insertProduct(Product product);		//insert
		int getID();								//get supplier id of a particular product	
		String getProductBySupplier(int id);		//get products according to supplier
		String getProductInfo( int id);				//gets a product info
		void updateProduct(Product prod);			//to update a product
		void deleteProduct(int id);					//to remove a product	
		String getAllProduct();						//gets list of all products
		String getDemandedProduct(String category, String forWhom); //get product according to category and for whom
		String getAllBrands();		//gets all brands
		String getDemandedProduct(String string, String string2, String string3); //get a particular product according to men and women
		String getAllProductsByNameAndBrand(); // product list with only name and brands
		
}