package com.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.model.Candidate;
import com.ecommerce.service.Icandidate;

@Controller
public class CandidateController {
	
	@Autowired
	Icandidate candidate;
	
	@RequestMapping(value="/updateUserAdmin",method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("updateDetails")Candidate cand)
	{
		System.out.println(cand.getSignUpEmail());
		cand.setUserType("ROLE_ADMIN");
		Candidate updated = candidate.update(cand);
		ModelAndView mav = new ModelAndView("AdminArea", "AdminDetails" , updated);
		return mav;
	}
}
