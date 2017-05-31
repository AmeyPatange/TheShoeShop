package com.ecommerce.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.IsupplierDao;
import com.ecommerce.model.Supplier;
import com.ecommerce.service.Isupplier;

@Service
public class SupplierImpl implements Isupplier {

	@Autowired
	IsupplierDao supplier;
	
	public String getAllSuppliers() {
		return supplier.getAllSuppliers();
	}

	public void addSupplier(Supplier sup) {
	
		supplier.addSupplier(sup);
	}

	public void deleteSupplier(int categoryid) {
		
		supplier.deleteSupplier(categoryid);
	}

}
