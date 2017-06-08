package com.ecommerce.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Product;
import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;

@Controller
public class HomeController {

	@Autowired
	Iproduct product;
	
	@Autowired
	Product productModel;
	
	@Autowired
	Icategory categories;
	
	@RequestMapping(value={"/" , "index" })
	public String home(HttpSession session)
	{
		String allProducts = product.getAllProduct();
		session.setAttribute("productList", allProducts);
		String category ="Casuals";
		String forWhom = "Men";
		String casualMenList = product.getDemandedProduct(category, forWhom);
		session.setAttribute("casualMenList", casualMenList);
		forWhom = "Women";
		String casualWomenList = product.getDemandedProduct(category, forWhom);
		session.setAttribute("casualWomenList", casualWomenList);
		forWhom ="Men";
		String forWhom1 = "BOTH";
		category ="Sports";
		String sportsList = product.getDemandedProduct(category , forWhom , forWhom1 );
		session.setAttribute("sportsList", sportsList);
		
		String categoryList = categories.getAllCategories();
		session.setAttribute("category", categoryList);
		session.setAttribute("cartList", false);
		String productBrands = product.getAllBrands();
		session.setAttribute("brandsList", productBrands );
		
		session.setAttribute("product", false );
		session.setAttribute("login", false);
		
		return "index";
	}
	/*
	@RequestMapping("index")
	public String index(HttpSession session)
	{
		String allProducts = product.getAllProduct();
		session.setAttribute("productList", allProducts);
		String category ="Casuals";
		String forWhom = "Men";
		String casualMenList = product.getDemandedProduct(category, forWhom);
		session.setAttribute("casualMenList", casualMenList);
		forWhom = "Women";
		String casualWomenList = product.getDemandedProduct(category, forWhom);
		session.setAttribute("casualWomenList", casualWomenList);
		forWhom ="Men";
		String forWhom1 = "BOTH";
		category ="Sports";
		String sportsList = product.getDemandedProduct(category , forWhom , forWhom1 );
		session.setAttribute("sportsList", sportsList);
		
		String categoryList = categories.getAllCategories();
		session.setAttribute("category", categoryList);
		
		String productBrands = product.getAllBrands();
		session.setAttribute("brandsList", productBrands );
		
		session.setAttribute("product", false );
		session.setAttribute("login", false);
		return "index";
		}
*/
	

	
	@RequestMapping("/aboutUs")
	public String aboutUS()
	{
		return "aboutUs";
	}
	
	@RequestMapping("/casuals")
	public String casuals()
	{
		product.addProduct(productModel);
		return "index";
	}
	
	@RequestMapping("signup")
	public String signup()
	{
		return "signup";
	}
	
	@RequestMapping("login")
	public String login()
	{
		return "login";
	}
	
	
}
