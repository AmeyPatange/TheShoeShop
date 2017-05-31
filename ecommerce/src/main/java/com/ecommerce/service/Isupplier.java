package com.ecommerce.service;

import com.ecommerce.model.Supplier;

public interface Isupplier {

	String getAllSuppliers();

	void addSupplier(Supplier sup);

	void deleteSupplier(int categoryid);
}
