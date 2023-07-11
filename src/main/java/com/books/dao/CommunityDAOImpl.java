package com.books.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.TO.CommunityTO;
import com.books.TO.Criteria;



@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	private SqlSession ss;

	
	public void write(CommunityTO to) throws Exception {
		// TODO Auto-generated method stub
		ss.insert("communityMapper.insert", to);
	}


	@Override
	public List<CommunityTO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectList("communityMapper.listPage",cri);
	}


	@Override
	public CommunityTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectOne("communityMapper.read", bno);
	}


	@Override
	public void update(CommunityTO to) throws Exception {
		// TODO Auto-generated method stub
		ss.update("communityMapper.update", to);
	}


	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		ss.delete("communityMapper.delete", bno);
	}


	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return ss.selectOne("communityMapper.listCount");
	}


	
	
	

}
