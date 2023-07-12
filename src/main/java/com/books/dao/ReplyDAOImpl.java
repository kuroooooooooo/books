package com.books.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.TO.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession ss;
	
	
	
	@Override
	public List<ReplyDTO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectList("communityReplyMapper.readReply", bno);
	}

}
