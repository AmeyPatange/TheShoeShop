package com.ecommerce.daoimpl;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.IcartDao;
import com.ecommerce.model.Cart;
import com.google.gson.Gson;

@Repository
public class CartDaoImpl implements IcartDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void addToCart(Cart cartObj) {
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		session.save(cartObj);
		t.commit();
		session.close();
	}

	public String getProdAddedToCart(String signUpEmail) {
		List list;
		Session session = sessionFactory.openSession();
		try{
			Query qry = session.createQuery("From Cart c Where c.signUpEmail=:signUpEmail");
			qry.setParameter("signUpEmail", signUpEmail);
			list = (List)qry.list();
			Gson gson = new Gson();
			String allList = gson.toJson(list);
			session.close();
			return allList;
			}catch(Exception e){}
		return null;
			
	}

	public double getSum(String signUpEmail) {
		Double amt;
		Session session = sessionFactory.openSession();
		System.out.println(signUpEmail);
		try{
			Query qry = session.createQuery("select sum(c.amount) From Cart c where c.signUpEmail=:signUpEmail");
			qry.setParameter("signUpEmail", signUpEmail);
			amt = (Double)qry.uniqueResult();
			System.out.println(amt.doubleValue());
			session.close();
			return amt.doubleValue();
		}catch(Exception e){}
		return 0;
	}

	public void updateCartItem(Cart cartItem) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		session.update(cartItem);
		t.commit();
		session.close();
		
	}

	public void removeCartItem(int id) {
	
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Cart cartItem = (Cart)session.get(Cart.class, id);
		session.delete(cartItem);
		t.commit();
		session.close();
		
	}



}
