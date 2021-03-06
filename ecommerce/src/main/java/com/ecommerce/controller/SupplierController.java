package com.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Candidate;
import com.ecommerce.model.Supplier;
import com.ecommerce.service.Icandidate;
import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;
import com.ecommerce.service.Isupplier;

@Controller
public class SupplierController {

	@Autowired
	Isupplier supplier;
	
	@Autowired
	Iproduct prod;
	
	@Autowired
	Icandidate cands;
	
	@Autowired
	Icategory category;
	
	static int supp = 1;
	static String prevSupplierName = "";
	static String prevSupplierEmail = "" ;
	
	@RequestMapping("addSupplier")
	public ModelAndView addSupplier(@ModelAttribute("Supplier")Supplier sup , @RequestParam("id") int adminid)
	{
		if( supp == 0 && prevSupplierName.equals(sup.getSupplierFirstName()) && prevSupplierEmail.equals(sup.getSupplierEmail()))
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
		
		supplier.addSupplier(sup);
		supp = 0;
		prevSupplierName = sup.getSupplierFirstName();
		prevSupplierEmail = sup.getSupplierEmail();
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
	
	@RequestMapping("deleteSupplier")
	public ModelAndView deleteSupplier(@RequestParam("catid")int categoryid, @RequestParam("id")int adminid)
	{
		supplier.deleteSupplier(categoryid);
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
}
