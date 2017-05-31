package com.ecommerce.model;

import java.io.Serializable;

import javax.persistence.*;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Product")
@Component
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Product()
	{
		System.out.println("Hello World");
	}
	
	@Id
	@GeneratedValue
	private int productId;
	
	@Column(name="Brand")  //
	private String productBrand;
	
	@Column(name="Name")  //
	private String productName;
	
	@Column(name="Category")  //
	private String productCategory;
	
	@Column(name="Price") //
	private int productPrice;
	
	@Column(name="DiscountPercent")  //
	private int productDiscountPercent;
	
	@Column(name="Description") //
	private String productDescription;
	
	@Column(name="Stock")  //
	private int productStock;
	
	@Column(name="SupplierId")  //
	private int productSupplierId;
	
	@Column(name="Sex")  //
	private String productSex;
	
	transient  //
	private MultipartFile productImage;
	

	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getProductSupplierId() {
		return productSupplierId;
	}
	public void setProductSupplierId(int productSupplierId) {
		this.productSupplierId = productSupplierId;
	}
	public String getProductSex() {
		return productSex;
	}
	public void setProductSex(String productSex) {
		this.productSex = productSex;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDiscountPercent() {
		return productDiscountPercent;
	}
	public void setProductDiscountPercent(int productDiscountPercent) {
		this.productDiscountPercent = productDiscountPercent;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	
}
