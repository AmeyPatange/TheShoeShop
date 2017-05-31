package com.ecommerce.dao;

import com.ecommerce.model.LoginUser;

public interface IuserCheckdao {

	Object validateUser(LoginUser lu);

	String checkIfPresent(String signUpEmail);
}
