package com.books.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.books.TO.CommunityTO;
import com.books.service.CommunityService;



@Controller
@RequestMapping("/books/*")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	
	@Autowired
	CommunityService cs;
	
	@RequestMapping(value = "/books/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	@RequestMapping(value = "/books/write", method = RequestMethod.POST)
	public String write(CommunityTO to) throws Exception{
		logger.info("write");
		
		cs.write(to);
		
		return "redirect:/";
	}
}
