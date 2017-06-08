package com.ecommerce.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Candidate;
import com.ecommerce.model.Cart;
import com.ecommerce.service.Icandidate;
import com.ecommerce.service.Icart;
import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;
import com.ecommerce.service.IsignUp;

@Controller
@SessionAttributes({ "id","login" ,"CustomerDetails","cartList"})
public class ProductDescriptionController {

	@Autowired
	Icategory category;

	@Autowired
	Iproduct product;
	
	@Autowired
	Icart cartService;
	
	@Autowired
	Icandidate cand;
	
	@RequestMapping("/productDescription")
	public ModelAndView product(@RequestParam("categoryId")int catId , @RequestParam("for")String forWhom )
	{
		String particularCategory = category.getCategory(catId);
		String productList = product.getDemandedProduct(particularCategory, forWhom);
		
		ModelAndView mav = new ModelAndView("allProducts", "product", productList);
		return mav;
	}
	
	//forWhom  //category // Brand
	@RequestMapping(value="/getinfo" )
	public ModelAndView listOfProduct(HttpServletRequest request)
	{
		String forWhom = request.getParameter("forWhom");
		String cat = request.getParameter("category");
		String brand  = request.getParameter("Brand");
		
		if( forWhom != null && cat != null && brand != null) // all three fields are present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			
			String productList = product.getProductByForCategoryBrand(forWhom , cat , brand );
			ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
			
		}
		else if( forWhom == null && cat != null && brand != null) //only  forWhom is not present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			String productList = product.getProductByCategoryAndBrand(cat , brand);
			ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
			
		}
		else if( forWhom != null && cat == null && brand != null) //only category id is not present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			String productList = product.getProductByBrandAndForWhom(brand , forWhom);
			ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
		}
		else if( forWhom != null && cat != null && brand == null) // only brand is not present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			String productList = product.getDemandedProduct(cat, forWhom);
		    ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
		}
		else if( forWhom == null && cat == null && brand != null) //only brand is present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			String productList = product.getProductByBrand(brand);
		    ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
		}
		else if( forWhom == null && cat != null && brand == null) //only category is present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			String productList = product.getProductByCategory(cat);
		    ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
			
		}
		else if( forWhom != null && cat == null && brand == null) //only forWhom is present
		{
			System.out.println(forWhom +"" + cat +""+ brand);
			String productList = product.getProductForWhom(forWhom);
		    ModelAndView mav = new ModelAndView("allProducts", "product" , productList);
			return mav;
			
		}
		
	return null;	
		
	
	}
	
	@RequestMapping("product")
	public ModelAndView productPage(@RequestParam("prodId")int id)
	{
		String prodList = product.getProductData(id);
		ModelAndView mav = new ModelAndView("product", "product", prodList);
		
		return mav;
		
	}
	
	@RequestMapping(value="addToCart", method = RequestMethod.POST)
	public ModelAndView cart(@ModelAttribute("Cart")Cart cartObj)
	{
		cartService.addToCart(cartObj);
		System.out.println(cartObj.getSignUpEmail());
		String addedItems = cartService.getProductsAddedToCart(cartObj.getSignUpEmail());
		ModelAndView mav = new ModelAndView("cart","product", addedItems );
		Candidate candidate = (Candidate)cand.getCandidateByEmail(cartObj.getSignUpEmail());
		mav.addObject("CustomerDetails" , candidate );
		mav.addObject("cartList" ,addedItems);
		double number = cartService.getSum(cartObj.getSignUpEmail());
		mav.addObject("number" , number);
		return mav;
	}
	
	@RequestMapping("/checkCart")
	public ModelAndView checkCart(@ModelAttribute("CustomerDetails")Candidate cand)
	{
		System.out.println(cand.signUpEmail);
		String addedItems = cartService.getProductsAddedToCart(cand.signUpEmail);
		System.out.println(addedItems);
		ModelAndView mav = new ModelAndView("cart","product", addedItems );
		mav.addObject("CustomerDetails" , cand );
		mav.addObject("cartList" ,addedItems);
		double number = cartService.getSum(cand.signUpEmail);
		mav.addObject("number" , number);
		return mav;
	
	}
	
	@RequestMapping("/updateInCart")
	public ModelAndView updateCartItem(@ModelAttribute("Cart")Cart cartItem , @ModelAttribute("CustomerDetails")Candidate cand)
	{
		cartService.updateCartItem(cartItem);
		String addedItems = cartService.getProductsAddedToCart(cartItem.getSignUpEmail());
		System.out.println(addedItems);
		ModelAndView mav = new ModelAndView("cart","product", addedItems );
		mav.addObject("CustomerDetails" , cand );
		mav.addObject("cartList" ,addedItems);
		double number = cartService.getSum(cartItem.getSignUpEmail());
		mav.addObject("number" , number);
		return mav;
		
	}
	
	@RequestMapping("removeCartItem")
	public ModelAndView removeFromCart(@RequestParam("cartId") int id, @RequestParam("signUpEmail")String email , @ModelAttribute("CustomerDetails")Candidate cand)
	{
		System.out.println(id + "" + email);
		cartService.removeCartItem(id);
		String addedItems = cartService.getProductsAddedToCart(email);
		System.out.println(addedItems);
		ModelAndView mav = new ModelAndView("cart","product", addedItems );
		mav.addObject("CustomerDetails" , cand );
		mav.addObject("cartList" ,addedItems);
		double number = cartService.getSum(email);
		mav.addObject("number" , number);
		return mav;
		
	}
	
}
