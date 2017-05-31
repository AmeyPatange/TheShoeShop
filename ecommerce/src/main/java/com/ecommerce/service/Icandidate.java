package com.ecommerce.service;


import com.ecommerce.model.Candidate;

public interface Icandidate {

	Candidate update(Candidate Cand);
	Candidate getCandidateInfo(int id);
}
