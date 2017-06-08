package com.ecommerce.service;


import com.ecommerce.model.Candidate;

public interface Icandidate {

	Candidate update(Candidate Cand); // update candidate
	Candidate getCandidateInfo(int id); //get by id
	Candidate getCandidateByEmail(String signUpEmail); //get by email
}
