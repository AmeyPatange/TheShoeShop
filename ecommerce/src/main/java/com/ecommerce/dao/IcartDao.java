package com.ecommerce.dao;

import com.ecommerce.model.Cart;

public interface IcartDao {

	void addToCart(Cart cartObj); /// ading object to cart

	String getProdAddedToCart(String signUpEmail); // gets products added to cart by particular user

	double getSum(String signUpEmail); //gets sum for particular email

	void updateCartItem(Cart cartItem); //updates cart item

	void removeCartItem(int id); //remove cart Item
	

}
