package com.books.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.TO.CommunityTO;
import com.books.dao.CommunityDAO;


@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDAO dao;
	
	

	public void write(CommunityTO to) throws Exception {
		// TODO Auto-generated method stub
		dao.write(to);
	}

}
