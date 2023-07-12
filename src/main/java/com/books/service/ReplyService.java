package com.books.service;

import java.util.List;

import com.books.TO.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> readReply(int bno) throws Exception;
}
