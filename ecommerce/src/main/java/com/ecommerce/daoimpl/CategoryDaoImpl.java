package com.ecommerce.daoimpl;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.IcategoryDao;
import com.ecommerce.model.Category;
import com.google.gson.Gson;

@Repository
public class CategoryDaoImpl implements IcategoryDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public String getAllCategory() {
		
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Category");
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String catlist = gson.toJson(list);
		session.close();
		return catlist;
	}

	public void addCategory(String name) {
		
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("select max(categoryID) from Category");
		Integer id = (Integer)qry.uniqueResult();
		int id1 = id.intValue();
		Category cat = new Category();
		cat.setCategoryID(++id1);
		cat.setCategoryType(name);
		Transaction t = session.beginTransaction();
		session.save(cat);
		t.commit();
		session.close();
	}

	public void deleteCategory(int catid) {
		
		Session session = sessionFactory.openSession();
		Category cat = (Category)session.load(Category.class, catid);
		Transaction t = session.beginTransaction();
		session.delete(cat);
		t.commit();
		session.close();
	}

	public String getCategory(int catId) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("select c.categoryType FROM Category c where c.categoryID=:catId ");
		qry.setParameter("catId", catId);
		String category = (String)qry.uniqueResult();
		session.close();
		return category;
	}

}
