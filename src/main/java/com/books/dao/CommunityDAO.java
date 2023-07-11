package com.books.dao;

import java.util.List;

import com.books.TO.CommunityTO;
import com.books.TO.Criteria;

public interface CommunityDAO {
	public void write(CommunityTO to) throws Exception;

	public List<CommunityTO> list(Criteria cri) throws Exception;
	
	public int listCount() throws Exception;
	
	public CommunityTO read(int bno) throws Exception;
	
	public void update(CommunityTO to) throws Exception;
	
	public void delete(int bno) throws Exception;
}
