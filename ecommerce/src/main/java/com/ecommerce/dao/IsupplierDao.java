package com.ecommerce.dao;

import com.ecommerce.model.Supplier;

public interface IsupplierDao {

	String getAllSuppliers();

	void addSupplier(Supplier sup);

	void deleteSupplier(int categoryid);

}
