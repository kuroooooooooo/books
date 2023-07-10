package com.books.dao;

import java.util.List;

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


	@Override
	public List<CommunityTO> list() throws Exception {
		// TODO Auto-generated method stub
		return ss.selectList("communityMapper.list");
	}


	@Override
	public CommunityTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectOne("communityMapper.read", bno);
	}


	@Override
	public void update(CommunityTO to) throws Exception {
		ss.update("communityMapper.update");
		
	}


	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		ss.delete("communityMapper.delete", bno);
	}
	
	

}
