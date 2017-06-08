package com.ecommerce.service;

import com.ecommerce.model.Cart;

public interface Icart {

	void addToCart(Cart cartObj); // add to cart 

	String getProductsAddedToCart(String signUpEmail); //get all added products to cart by particular user

	double getSum(String signUpEmail); //get sum for particular email from cart

	void updateCartItem(Cart cartItem); //updates a particular  cart item

	void removeCartItem(int id); //delete a particular cart Item
	
	
	
	
}
