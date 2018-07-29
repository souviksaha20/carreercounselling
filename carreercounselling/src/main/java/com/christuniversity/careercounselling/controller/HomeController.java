package com.christuniversity.careercounselling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christuniversity.careercounsellingbackend.dao.SchoolDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.model.School;
import com.christuniversity.careercounsellingbackend.model.User;

@Controller
public class HomeController {

	@Autowired
	School school;
	@Autowired
	SchoolDao schoolDao;
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@RequestMapping(value = "/")
	 @ExceptionHandler({Error.class})
	public ModelAndView onlode(RedirectAttributes redirectAttrs) {
		ModelAndView mv;
		try {
			mv = new ModelAndView("index");
			User u = new User();
			List<School> li = (List<School>) schoolDao.Schools();
			mv.addObject("user", u);
			mv.addObject("schools", li);
			if (redirectAttrs.getFlashAttributes().equals(null) == true)
				mv.addObject("mess", redirectAttrs.getFlashAttributes());
			else
				mv.addObject("err", redirectAttrs.getFlashAttributes());
		} catch (Exception e) {
			throw new Error(e);
		
		}
		return mv;
	}

	@RequestMapping(value = "/troubleshoot")
	 @ExceptionHandler({Error.class})
	public ModelAndView onlode5() {
	    
//		if(!(auth instanceof AnonymousAuthenticationToken))
//		{
//			String curuser=auth.getName();
//		    user=userDao.getUserByUniqCode(curuser);
//		}
		
		ModelAndView mv = new ModelAndView("troubleshoot");
		
		return mv;
	}

	@RequestMapping(value = "/report/Realistic")
	public ModelAndView realistic() {
		System.out.println(111);
		ModelAndView mv = new ModelAndView("reportRealistic");
		return mv;
	}

	@RequestMapping(value = "/report/Investigative")
	public ModelAndView investigative() {
		System.out.println(111);
		ModelAndView mv = new ModelAndView("reportInvestigative");
		return mv;
	}

	@RequestMapping(value = "/report/Artistic")
	public ModelAndView artistic() {
		System.out.println(111);
		ModelAndView mv = new ModelAndView("reportArtistic");
		return mv;
	}

	@RequestMapping(value = "/report/Social")
	public ModelAndView social() {
		System.out.println(111);
		ModelAndView mv = new ModelAndView("reportSocial");
		return mv;
	}

	@RequestMapping(value = "/report/Enterprising")
	public ModelAndView enterprising() {
		System.out.println(111);
		ModelAndView mv = new ModelAndView("reportEnterprising");
		return mv;
	}

	@RequestMapping(value = "/report/Conventional")
	public ModelAndView conventional() {
		System.out.println(111);
		ModelAndView mv = new ModelAndView("reportConventional");
		return mv;
	}

	@RequestMapping(value = "/error")
	public ModelAndView error() {
		ModelAndView mv = new ModelAndView("404");
		return mv;
	}

	@ExceptionHandler(Error.class)
	public ModelAndView handleCustomException(Error ex) {
		System.out.println("Handling exception");
		ModelAndView model = new ModelAndView("404");
		model.addObject("exception", ex);
		return model;

	}

}
