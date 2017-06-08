package com.ecommerce.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.IcartDao;
import com.ecommerce.model.Cart;
import com.ecommerce.service.Icart;

@Service
public class CartImpl implements Icart {

	@Autowired
	IcartDao cart;
	
	public void addToCart(Cart cartObj) {
	
		cart.addToCart(cartObj);
	}

	public String getProductsAddedToCart(String signUpEmail) {
		return cart.getProdAddedToCart(signUpEmail);
	}

	public double getSum(String signUpEmail) {
		return cart.getSum(signUpEmail);
	}

	public void updateCartItem(Cart cartItem) {
		cart.updateCartItem(cartItem);
	}

	public void removeCartItem(int id) {
		cart.removeCartItem(id);
	}

	

	
}
