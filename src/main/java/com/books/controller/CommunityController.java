package com.books.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.TO.CommunityTO;
import com.books.TO.PageMaker;
import com.books.TO.ReplyDTO;
import com.books.TO.SearchCriteria;
import com.books.TO.Criteria;
import com.books.service.CommunityService;
import com.books.service.ReplyService;



@Controller
@RequestMapping("/books/*")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	
	@Autowired
	CommunityService cs;
	
	@Autowired
	ReplyService rs;
	
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
	public String list(Model model, SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", cs.list(scri));
		
		PageMaker pm = new PageMaker();
		
		pm.setCri(scri);
		pm.setTotalCount(cs.listCount(scri));
		
		model.addAttribute("pm", pm);
		
		return "/books/list";
	}
	
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(CommunityTO to, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("read!");
		
		model.addAttribute("read", cs.read(to.getBno()));
		model.addAttribute("scri", scri);
		
		
		List<ReplyDTO> replyList = rs.readReply(to.getBno());
		model.addAttribute("replyList", replyList);
		
		return "books/readView";
		
	}
	
	
	@RequestMapping(value="/updateView", method = RequestMethod.GET)
	public String updateView(CommunityTO to, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", cs.read(to.getBno()));
		model.addAttribute("scri", scri);
		
		return "books/updateView";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(CommunityTO to) throws Exception{
		logger.info("update!");
		
		cs.update(to);
		
		
	
		return "redirect:/books/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(CommunityTO to, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		cs.delete(to.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/books/list";
	}
	
	
}
