package com.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;

@Controller
public class ProductDescriptionController {

	@Autowired
	Icategory category;

	@Autowired
	Iproduct product;
	
	@RequestMapping("/productDescription")
	public ModelAndView product(@RequestParam("categoryId")int catId , @RequestParam("for")String forWhom )
	{
		String particularCategory = category.getCategory(catId);
		String productList = product.getDemandedProduct(particularCategory, forWhom);
		
		ModelAndView mav = new ModelAndView("allProducts", "product", productList);
		return mav;
	}
	
	//forWhom  //category // Brand
	@RequestMapping(value="/getinfo",method=RequestMethod.POST )
	public ModelAndView listOfProduct(@RequestParam String forWhom, @RequestParam String category , @RequestParam String Brand)
	{
		
		return null;
	}
}
