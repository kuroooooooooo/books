package com.books.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="/books/list", method= RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", cs.list());
		
		return "/books/list";
	}
	
	/*
	 * @RequestMapping(value="/books/readView", method=RequestMethod.GET) public
	 * String read(CommunityTO to, Model model) throws Exception{
	 * 
	 * logger.info("read");
	 * 
	 * model.addAttribute("read", cs.read(to.getBno()));
	 * 
	 * return "/books/readView"; }
	 */
	
	
	/*
	 * @RequestMapping(value = "/books/updateView", method = RequestMethod.GET)
	 * public String updateView(CommunityTO to, Model model) throws Exception{
	 * logger.info("updateView");
	 * 
	 * model.addAttribute("update", cs.read(to.getBno()));
	 * 
	 * return "/books/updateView"; }
	 */
	
	
	/*
	 * @RequestMapping(value="/books/delete", method = RequestMethod.POST) public
	 * String delete(CommunityTO to) throws Exception{ logger.info("delete");
	 * 
	 * cs.delete(to.getBno());
	 * 
	 * return "redirect:/books/list"; }
	 */
}
