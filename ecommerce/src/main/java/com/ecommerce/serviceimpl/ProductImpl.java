package com.ecommerce.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.Iproductdao;
import com.ecommerce.model.Product;
import com.ecommerce.service.Iproduct;

@Service
public class ProductImpl implements Iproduct {
	
	@Autowired
	Iproductdao productDb;

	ProductImpl()
	{
		System.out.println("Hello ");
	}
	public void addProduct(Product product)
	{
		productDb.insertProduct(product);
	}
	
	public int getProductIdFromDb()
	{
	 int id = productDb.getID();
	 return id;
	}
	
	public String getProduct(int id) {
		return productDb.getProductBySupplier(id);
	}
	
	public String getProductData(int id) //get info of one product only
	{
		return productDb.getProductInfo(id);
	}
	
	
	public void updateProduct(Product prod) {
		productDb.updateProduct(prod);
		
	}
	
	public void deleteProduct(int id) {
		productDb.deleteProduct(id);	
	}
	
	public String getAllProduct() {
			return productDb.getAllProduct();
	}
	
	public String getDemandedProduct(String category, String forWhom) {
			return productDb.getDemandedProduct(category, forWhom);
	}
	public String getAllBrands() {
		
		return productDb.getAllBrands();
	}
	public String getDemandedProduct(String string, String string2, String string3) {
		return productDb.getDemandedProduct(string , string2 , string3);
	}
	public String getProductsByNameAndBrand() {
		return productDb.getAllProductsByNameAndBrand();
	}
	public String getProductByForCategoryBrand(String forWhom, String cat, String brand) {
		return productDb.getProductByForCategoryBrand( forWhom, cat,brand);
	}
	public String getProductByCategoryAndBrand(String cat, String brand) {
		return productDb.getProductByCategoryAndBrand(cat , brand);
	}
	public String getProductByBrandAndForWhom(String brand, String forWhom) {
		return productDb.getProductByBrandAndForWhom(brand , forWhom);
	}
	public String getProductByBrand(String brand) {
		return productDb.getProductByBrand(brand);
	}
	public String getProductByCategory(String cat) {
		return productDb.getProductByCategory(cat);
	}
	public String getProductForWhom(String forWhom) {
		return productDb.getProductForWhom(forWhom);
	}
	
}
