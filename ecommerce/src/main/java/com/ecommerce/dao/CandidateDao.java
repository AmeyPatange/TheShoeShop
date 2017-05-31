package com.ecommerce.dao;

import com.ecommerce.model.Candidate;

public interface CandidateDao {

	Candidate updateInDb(Candidate cand);
	Candidate getCandidate(int id);
}
