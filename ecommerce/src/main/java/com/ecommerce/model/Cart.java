package com.ecommerce.model;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Cart")
@Component
public class Cart implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	public Cart()
	{
	}
	
	@Id
	@GeneratedValue
	private int cartId;
	private int productId;
	private int quantity;
	private String signUpEmail;
	private double amount;
	private String productBrand;
	private String productName;
	private int shippingCharges;
	private int productStock;
	

	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
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

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSignUpEmail() {
		return signUpEmail;
	}

	public void setSignUpEmail(String signUpEmail) {
		this.signUpEmail = signUpEmail;
	}

	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getShippingCharges() {
		return shippingCharges;
	}

	public void setShippingCharges(int shippingCharges) {
		this.shippingCharges = shippingCharges;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	 
	
}
