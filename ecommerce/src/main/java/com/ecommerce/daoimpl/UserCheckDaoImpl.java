package com.ecommerce.daoimpl;

import java.util.Iterator;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.IuserCheckdao;
import com.ecommerce.model.Candidate;
import com.ecommerce.model.LoginUser;



@Repository
public class UserCheckDaoImpl implements IuserCheckdao {

	@Autowired
	SessionFactory sessionFactory;
	
	public Object validateUser(LoginUser lu)
	{
		String email =lu.getEmail();
		System.out.println(email);
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("FROM Candidate c WHERE c.signUpEmail=:email ");
		qry.setParameter("email", email);
		Object list = (Object)qry.uniqueResult();
		session.close();
		if( list== null)
		{
			System.out.println("Empty List");
			return null;
		}
		return list;
	}

	public String checkIfPresent(String signUpEmail) {
		Session session = sessionFactory.openSession();
		try
		{
			Query qry = session.createQuery("From Candidate c Where c.signUpEmail=:email");
			qry.setParameter("email",signUpEmail );
			Object o = qry.uniqueResult();
		
			if( o== null)
				return null;
			else
			{	Candidate cand = (Candidate)o;
				return cand.getSignUpEmail();
			}
		}catch(Exception  e){}
			return null;
	}
}
