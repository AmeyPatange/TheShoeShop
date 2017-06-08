package com.ecommerce.dao;

import com.ecommerce.model.Candidate;

public interface CandidateDao {

	Candidate updateInDb(Candidate cand); //update
	Candidate getCandidate(int id);  //get candidte by id
	Candidate getCandidateByEmail(String signUpEmail); //get candidate by email
}
