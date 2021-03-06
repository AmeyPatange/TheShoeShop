package com.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Candidate;
import com.ecommerce.model.LoginUser;
import com.ecommerce.service.Icart;
import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;
import com.ecommerce.service.IsignUp;
import com.ecommerce.service.Isupplier;

@Controller
@SessionAttributes({ "id","login" ,"CustomerDetails","cartList"})
public class SignUp {

	@Autowired
	IsignUp signup;
	
	@Autowired
	Iproduct prod;
	
	@Autowired
	Icategory catlist;
	
	@Autowired
	Isupplier supplier;
	
	@Autowired
	Icart cartService;
	
	@RequestMapping("/createUser") // to create new user
	public ModelAndView creatingUser( @ModelAttribute("user")Candidate cand )
	{
		if(cand.getSignUpEmail().equals(signup.CheckEmailInDb(cand.getSignUpEmail())))//check if email already exist
		{
			ModelAndView mav = new ModelAndView("login","count","User Already Present");
			return mav;
		}
		cand.setUserType("ROLE_CUSTOMER");
		signup.addUser(cand);
		ModelAndView mav = new ModelAndView("login","count",1);
		return mav;
	}
	
	@RequestMapping(value="logincheck", method= RequestMethod.POST) //to check if login is valid for both admin and user
	public ModelAndView loginCandidate(@ModelAttribute("loginuser")LoginUser lu)
	{
		System.out.println("Controller");
		Object o  =signup.checkUserDetails(lu); 
		
		if(o == null)
		{
			ModelAndView empty = new ModelAndView("login", "message", "Not A Valid User.");
			return empty;
		}
		Candidate cand = (Candidate)o;
		if( cand.getUserType().equals("ROLE_CUSTOMER"))
		{
			ModelAndView customerLogin = new ModelAndView("index", "CustomerDetails", cand);
			System.out.println(cand.signUpFirstName);
			customerLogin.addObject("id" , cand.getCandidateId());
			customerLogin.addObject("login" , true);
			String addedItems = cartService.getProductsAddedToCart(cand.getSignUpEmail());
			customerLogin.addObject("cartList" ,addedItems);
			return customerLogin;
		}
		if( cand.getUserType().equals("ROLE_ADMIN"))
		{
			ModelAndView AdminLogin = new ModelAndView("AdminArea", "AdminDetails", cand);//stores admin data in  mav
			AdminLogin.addObject("id", cand.getCandidateId());                           
			String ProductgsonList=prod.getAllProduct();					             //stores  all products
			AdminLogin.addObject("productList",ProductgsonList);
			String allCategory = catlist.getAllCategories();							//stores category
			AdminLogin.addObject("catlist", allCategory);
			String supplierlist = supplier.getAllSuppliers();							//gets all supplier
			AdminLogin.addObject("supplier", supplierlist);
			AdminLogin.addObject("displayModal", false);
			
			return AdminLogin;
		}
		return new ModelAndView("login" , "message", "Something Went Wrong..Please Try Again");
	}
	

	

}
