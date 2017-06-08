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
		String getProductByForCategoryBrand(String forWhom, String cat, String brand); // according to three fields
		String getProductByCategoryAndBrand(String cat, String brand); // according to brand and category
		String getProductByBrandAndForWhom(String brand, String forWhom); //get product by brand and sex
		String getProductByBrand(String brand); // product by brand
		String getProductByCategory(String cat); // product by category
		String getProductForWhom(String forWhom);// product for Particular Sex
		
}
