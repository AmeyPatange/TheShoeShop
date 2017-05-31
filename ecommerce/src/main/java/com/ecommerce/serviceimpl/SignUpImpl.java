package com.ecommerce.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.dao.IuserAddDao;
import com.ecommerce.dao.IuserCheckdao;
import com.ecommerce.model.Candidate;
import com.ecommerce.model.LoginUser;
import com.ecommerce.service.IsignUp;

@Service
public class SignUpImpl implements IsignUp {

	@Autowired
	IuserAddDao useradd;
	
	@Autowired
	IuserCheckdao checkdao;
	public void addUser(Candidate cand)
	{
		useradd.addUserToDb(cand);
	}
	
	public Candidate checkUserDetails(LoginUser lu)
	{
		System.out.println(lu.getEmail() + lu.getPassword());
		Object o = checkdao.validateUser(lu);
		System.out.println("---------------------");
		if( o == null)
		{
			return null;
		}
		Candidate cand = (Candidate)o;
		System.out.println(cand.getSignUpEmail());
		if( (cand.getSignUpEmail().equals(lu.getEmail())) && (cand.getSignUpPassword().equals(lu.getPassword())))
		{
			System.out.println("Successful Login");
			return cand;
		}
		else
		{
			System.out.println("Invalid details");
			return null;
		}
		
	}

	public String CheckEmailInDb(String signUpEmail) {
		
		return checkdao.checkIfPresent(signUpEmail);
	
	}
}
