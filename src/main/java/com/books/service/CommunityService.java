package com.books.service;

import java.util.List;

import com.books.TO.CommunityTO;

public interface CommunityService {

	public void write(CommunityTO to) throws Exception;

	public List<CommunityTO> list() throws Exception;
	
	public CommunityTO read(int bno) throws Exception;
	
	
	
	public void update(CommunityTO to) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	
}
