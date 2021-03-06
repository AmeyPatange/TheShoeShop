package com.ecommerce.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.IsupplierDao;
import com.ecommerce.model.Supplier;
import com.google.gson.Gson;

@Repository
public class SupplierDaoImpl implements IsupplierDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public String getAllSuppliers() {
		
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Supplier");
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String supplierList = gson.toJson(list);
		session.close();
		
		return supplierList;
	}

	public void addSupplier(Supplier sup) {
		
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("select max(SupplierId) From Supplier");
		Integer id = (Integer)qry.uniqueResult();
		int id1 = id.intValue();
		sup.setSupplierId(++id1);
		Transaction t = session.beginTransaction();
		session.save(sup);
		t.commit();
		session.close();
		
	}

	public void deleteSupplier(int categoryid) {
		
		Session session = sessionFactory.openSession();
		Supplier supplier = (Supplier)session.load(Supplier.class, categoryid);
		Transaction t = session.beginTransaction();
		session.delete(supplier);
		t.commit();
		session.close();
	}


	
}
