package com.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.TO.ReplyDTO;
import com.books.dao.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO rd;
	
	
	@Override
	public List<ReplyDTO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return rd.readReply(bno);
	}

}
