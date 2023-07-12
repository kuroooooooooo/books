package com.books.dao;

import java.util.List;

import com.books.TO.ReplyDTO;

public interface ReplyDAO {
	
	public List<ReplyDTO> readReply(int bno) throws Exception;
}
