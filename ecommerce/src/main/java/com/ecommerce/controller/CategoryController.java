package com.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Candidate;
import com.ecommerce.service.Icandidate;
import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;
import com.ecommerce.service.Isupplier;

@Controller
public class CategoryController {

	@Autowired
	Icategory category;
	
	@Autowired
	Iproduct prod;
	
	@Autowired
	Isupplier supplier;
	
	@Autowired
	Icandidate cands;
	
	static int var=1;
	static String prevCategory ="";
	
	@RequestMapping("addCategory")
	public ModelAndView addCat(@RequestParam("name")String name, @RequestParam("adminid")int adminid)
	{
		if( var == 0 && prevCategory.equals(name))
		{
			String ProductgsonList=prod.getAllProduct();							//gets all product	
			ModelAndView mav = new ModelAndView("AdminArea", "productList",ProductgsonList);
			Candidate cand = cands.getCandidateInfo(adminid);					//get admin info
			mav.addObject("AdminDetails",cand);
			mav.addObject("id", cand.getCandidateId());
			String allCategory = category.getAllCategories();						//gets alll categories
			mav.addObject("catlist", allCategory);
			String supplierlist = supplier.getAllSuppliers();						//gets all suppliers
			mav.addObject("supplier", supplierlist);
			mav.addObject("displayModal", false);
			System.out.println("Not Added");
			return mav;
			
		}
		category.addCategory(name);
		var = 0;
		prevCategory = name;
		String ProductgsonList=prod.getAllProduct();							//gets all product	
		ModelAndView mav = new ModelAndView("AdminArea", "productList",ProductgsonList);
		
		Candidate cand = cands.getCandidateInfo(adminid);					//get admin info
		mav.addObject("AdminDetails",cand);
		mav.addObject("id", cand.getCandidateId());
		String allCategory = category.getAllCategories();						//gets alll categories
		mav.addObject("catlist", allCategory);
		
		String supplierlist = supplier.getAllSuppliers();						//gets all suppliers
		mav.addObject("supplier", supplierlist);
		
		mav.addObject("displayModal", false);
		System.out.println("Not Added");
		return mav;
		
	}
	
	@RequestMapping("deleteCategory")
	public ModelAndView deleteCat(@RequestParam("id")int catid, @RequestParam("adminid")int adminid)
	{
		category.deleteCategory(catid);
		String ProductgsonList=prod.getAllProduct();							//gets all product	
		
		ModelAndView mav = new ModelAndView("AdminArea", "productList",ProductgsonList);
		
		Candidate cand = cands.getCandidateInfo(adminid);						//get admin info
		mav.addObject("AdminDetails",cand);
		mav.addObject("id", cand.getCandidateId());
		String allCategory = category.getAllCategories();						//gets alll categories
		mav.addObject("catlist", allCategory);
		
		String supplierlist = supplier.getAllSuppliers();						//gets all suppliers
		mav.addObject("supplier", supplierlist);
		
		mav.addObject("displayModal", false);
		System.out.println("Not Added");
		return mav;
	}
}
