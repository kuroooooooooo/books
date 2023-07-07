package com.books.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.TO.CommunityTO;



@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	private SqlSession ss;

	
	public void write(CommunityTO to) throws Exception {
		// TODO Auto-generated method stub
		ss.insert("communityMapper.insert", to);
	}
	
	

}
