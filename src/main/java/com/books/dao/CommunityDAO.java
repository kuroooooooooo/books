package com.books.dao;

import java.util.List;

import com.books.TO.CommunityTO;
import com.books.TO.Criteria;
import com.books.TO.SearchCriteria;

public interface CommunityDAO {
	public void write(CommunityTO to) throws Exception;

	public List<CommunityTO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public CommunityTO read(int bno) throws Exception;
	
	public void update(CommunityTO to) throws Exception;
	
	public void delete(int bno) throws Exception;
}
