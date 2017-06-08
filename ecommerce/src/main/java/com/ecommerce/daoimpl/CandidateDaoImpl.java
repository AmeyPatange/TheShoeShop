package com.ecommerce.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.CandidateDao;
import com.ecommerce.model.Candidate;
import com.google.gson.Gson;

@Repository
public class CandidateDaoImpl implements CandidateDao {

	@Autowired
	SessionFactory sessionFactory;
	
	
	public Candidate updateInDb(Candidate cand)
	{
		System.out.println(cand.getSignUpLastName());
		System.out.println(cand.getSignUpEmail());
		String email = cand.getSignUpEmail();
		System.out.println(email);
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("FROM Candidate c WHERE c.signUpEmail=:email ");
		qry.setParameter("email", email);
		Object list = (Object)qry.uniqueResult();
		
		
		System.out.println("'****************'");
		Candidate old = (Candidate)list;
		session.flush();
		
		
		System.out.println(old.getSignUpFirstName());
		cand.setCandidateId(old.getCandidateId());
		Transaction tx = session.beginTransaction();
		try
		{
			session.saveOrUpdate(cand);
			tx.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		session.close();
		return cand;
	}


	public Candidate getCandidate(int id) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("FROM Candidate c WHERE c.CandidateId=:id");
		qry.setParameter("id", id);
		Object o = qry.uniqueResult();
		Candidate cand = (Candidate)o;
		return cand;
	}


	public Candidate getCandidateByEmail(String signUpEmail) {
		
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Candidate c where c.signUpEmail=:signUpEmail");
		qry.setParameter("signUpEmail", signUpEmail);
		Candidate cand = (Candidate)qry.uniqueResult();
		
		return cand;
	}
}
