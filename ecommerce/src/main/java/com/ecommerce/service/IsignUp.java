package com.ecommerce.service;

import com.ecommerce.model.Candidate;
import com.ecommerce.model.LoginUser;

public interface IsignUp {

	void addUser(Candidate cand);
	
	Candidate checkUserDetails(LoginUser lu);

	Object CheckEmailInDb(String signUpEmail);
}
