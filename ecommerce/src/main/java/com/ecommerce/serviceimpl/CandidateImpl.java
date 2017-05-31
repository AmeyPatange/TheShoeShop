package com.ecommerce.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.CandidateDao;
import com.ecommerce.model.Candidate;
import com.ecommerce.service.Icandidate;

@Service
public class CandidateImpl implements Icandidate {

	@Autowired
	CandidateDao candDao;
	
	public Candidate update(Candidate cand)
	{
		Candidate updated =candDao.updateInDb(cand);
		return updated;
	}

	public Candidate getCandidateInfo(int id) {
		
		return candDao.getCandidate(id);
	}
}
