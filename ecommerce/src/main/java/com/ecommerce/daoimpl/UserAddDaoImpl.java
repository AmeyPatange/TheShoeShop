package com.ecommerce.daoimpl;


import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.IuserAddDao;
import com.ecommerce.model.Candidate;

@Repository
public class UserAddDaoImpl implements IuserAddDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void addUserToDb(Candidate cand) {
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		session.save(cand);
		
		t.commit();
		session.close();
		
				
	}
}
