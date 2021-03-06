package com.ecommerce.controller;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Candidate;
import com.ecommerce.model.Product;
import com.ecommerce.service.Icandidate;
import com.ecommerce.service.Icategory;
import com.ecommerce.service.Iproduct;
import com.ecommerce.service.Isupplier;

@Controller
public class ProductController {

	static int count = 1;
	static String Name = "";
	static String Brand ="";
	@Autowired
	Iproduct prod;
	
	@Autowired
	Icandidate cands;
	
	@Autowired
	Icategory catlist;
	
	@Autowired
	Isupplier supplier;
 	
	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public ModelAndView addproduct(@ModelAttribute("Product")Product prodobj, @RequestParam("adminid")int id) 
	{
		ModelAndView mvc=new ModelAndView("AdminArea");

		
		if(count ==0 && Name.equals(prodobj.getProductName()) && Brand.equals(prodobj.getProductBrand()))
		{
			//on page refresh directing to same page without adding product to the database
			String ProductgsonList=prod.getAllProduct();							//all products
			ModelAndView mav = new ModelAndView("AdminArea", "productList",ProductgsonList);
			Candidate cand = cands.getCandidateInfo(id);	//get admin's personal details
			mav.addObject("AdminDetails",cand );
			mav.addObject("id",cand.getCandidateId());								//get admin id from Candidate Table
			
			String allCategory = catlist.getAllCategories();						//all categories
			mav.addObject("catlist", allCategory);
			
			String supplierlist = supplier.getAllSuppliers();					//list of all suppliers
			mav.addObject("supplier", supplierlist);
					
			mav.addObject("displayModal", false);
			System.out.println("Not Added");
			return mav;
		}
		System.out.println("Again Inserted False");
		Name = prodobj.getProductName();
		Brand = prodobj.getProductBrand();
		count=0;
		int prodid = prod.getProductIdFromDb();
		prodid++;
		prodobj.setProductId(prodid);
		prod.addProduct(prodobj);
		
		System.out.println(prodobj.getProductId());
		String path="C:\\Users\\AMEY\\DT\\ecommerce\\src\\main\\webapp\\resources\\images\\";
		path=path+String.valueOf(prodobj.getProductId())+".jpg";
		System.out.println(path);
		
		File f=new File(path);
		MultipartFile filedet=prodobj.getProductImage();
		
		if(!filedet.isEmpty())
		{
			try
			{
			  byte[] bytes=filedet.getBytes();
			  FileOutputStream fos=new FileOutputStream(f);
              			BufferedOutputStream bs=new BufferedOutputStream(fos);
              			bs.write(bytes);
              			bs.close();
             			 System.out.println("File Uploaded Successfully");
			}
			catch(Exception e)
			{
				System.out.println("Exception Arised"+e);
			}
		}
		else
		{
			System.out.println("File is Empty, Not Uploaded");
		}
		System.out.println(prodobj.getProductBrand());
		String ProductgsonList=prod.getAllProduct();		//all products
		mvc.addObject("productList",ProductgsonList);		
		Candidate cand = cands.getCandidateInfo(id);  	//get admin details
		mvc.addObject("AdminDetails",cand );
		mvc.addObject("id",cand.getCandidateId());							//admin id
		String allCategory = catlist.getAllCategories();					//get all categories
		mvc.addObject("catlist", allCategory);
		
		String supplierlist = supplier.getAllSuppliers();				//get all suppliers
		mvc.addObject("supplier", supplierlist);
		
		
		mvc.addObject("displayModal", false);
		
		return mvc;
}

		@RequestMapping(value="/displaymodal")
		public ModelAndView getPicture(@RequestParam("prodid")int id, @RequestParam("id")int adminid)
		{
			
			String productData = prod.getProductData(id);		//get one single product data
			System.out.println(productData);
			ModelAndView mvc = new ModelAndView("AdminArea", "productList", productData);
			mvc.addObject("catlist", false);
			mvc.addObject("supplier", false);
			mvc.addObject("id", adminid);
			mvc.addObject("displayModal", true);
			return mvc;
		}
		
		@RequestMapping(value="/previous")
		public ModelAndView prev(@RequestParam("id")int id)
		{	
			
			String ProductgsonList=prod.getAllProduct();
			ModelAndView mvc = new ModelAndView("AdminArea","productList",ProductgsonList);	//all products
			Candidate cand = cands.getCandidateInfo(id);
			mvc.addObject("AdminDetails",cand );											//admin details
			mvc.addObject("id",cand.getCandidateId());
			String allCategory = catlist.getAllCategories();								//gets all categories
			mvc.addObject("catlist", allCategory);
			String supplierlist = supplier.getAllSuppliers();								//gets all suppliers
			mvc.addObject("supplier", supplierlist);
			
			mvc.addObject("displayModal", false);
			return mvc;
		}
		
		
		@RequestMapping(value="updateproduct")
		public ModelAndView updateProductById(@ModelAttribute("Product")Product prodobj, @RequestParam("id")int adminid)
		{
			
			int id = prodobj.getProductId();
			MultipartFile fileupdate = prodobj.getProductImage();
			if( !fileupdate.isEmpty())
			{
				String path="C:\\Users\\AMEY\\DT\\ecommerce\\src\\main\\webapp\\resources\\images\\";
				path=path+String.valueOf(prodobj.getProductId())+".jpg";
				File f=new File(path);
				
				try
				{
							byte[] bytes=fileupdate.getBytes();
				  			FileOutputStream fos=new FileOutputStream(f);
	              			BufferedOutputStream bs=new BufferedOutputStream(fos);
	              			bs.write(bytes);
	              			bs.close();
	             		   System.out.println("File Uploaded Successfully");
				}
				catch(Exception e)
				{
							System.out.println("Exception Arised"+e);
				}
				
			}
			prod.updateProduct(prodobj);
			String ProductgsonList=prod.getProduct(prodobj.getProductSupplierId());
			ModelAndView mav = new ModelAndView("AdminArea","productList",ProductgsonList);
			Candidate cand = cands.getCandidateInfo(adminid);
			mav.addObject("AdminDetails",cand );
			mav.addObject("id",cand.getCandidateId());
			String allCategory = catlist.getAllCategories();		//get all categories
			mav.addObject("catlist", allCategory);
			String supplierlist = supplier.getAllSuppliers();		//get all suppliers
			mav.addObject("supplier", supplierlist);
			
			mav.addObject("displayModal", false);
			return mav;
			
		}

		@RequestMapping("deleteproduct")
		public ModelAndView delete(@RequestParam("productid")int id , @RequestParam("id")int adminid)
		{
			prod.deleteProduct(id);
			String ProductgsonList = prod.getAllProduct();    		//gets all product
			ModelAndView mav = new ModelAndView("AdminArea","productList",ProductgsonList);
			Candidate cand = cands.getCandidateInfo(adminid);     	//gets admin info
			mav.addObject("AdminDetails",cand );
			mav.addObject("id",cand.getCandidateId());
			String allCategory = catlist.getAllCategories();      //gets all categories
			mav.addObject("catlist", allCategory);
				
			String supplierlist = supplier.getAllSuppliers();		//gets all suppliers
			mav.addObject("supplier", supplierlist);
			
			
			mav.addObject("displayModal", false);
			return mav;
			
			
		}
		
}
