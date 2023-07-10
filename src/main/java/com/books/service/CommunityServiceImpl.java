package com.books.service;

import java.util.List;

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



	@Override
	public List<CommunityTO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}



	@Override
	public CommunityTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}



	@Override
	public void update(CommunityTO to) throws Exception {
		// TODO Auto-generated method stub
		dao.update(to);
	}



	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}


}
