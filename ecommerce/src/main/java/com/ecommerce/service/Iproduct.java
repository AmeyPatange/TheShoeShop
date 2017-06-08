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

	String getProductByForCategoryBrand(String forWhom, String cat, String brand); //get according to three fields

	String getProductByCategoryAndBrand(String cat, String brand); // get product by category and brand

	String getProductByBrandAndForWhom(String brand, String forWhom); // get brand for particular sex

	String getProductByBrand(String brand); // get product by brand

	String getProductByCategory(String cat); // get product By category

	String getProductForWhom(String forWhom); // get product for particular sex

	
	
	
}
