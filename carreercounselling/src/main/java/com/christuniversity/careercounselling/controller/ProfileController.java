package com.christuniversity.careercounselling.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.christuniversity.careercounsellingbackend.dao.SchoolDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.model.School;
import com.christuniversity.careercounsellingbackend.model.User;

@Controller
public class ProfileController 
{
	@Autowired
	School school;
	@Autowired
	SchoolDao schoolDao;
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value = "/profile")
	public ModelAndView userprofile(HttpSession session) {
       
		ModelAndView mv = new ModelAndView("user");
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			List<School> sc=null;
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
			  	
			  	
			  	if(user.getAut().getRolename().equals("ROLE_ADMIN"))
			  	{
			  		System.out.println(111);
			  		sc=schoolDao.Schools();
			  		mv.addObject("sc", sc);
			  		session.setAttribute("name", "Admin Welcome");	
			  	}
			  	else
			  	{
			  		mv.addObject("user", user);
			  		session.setAttribute("takentest", user.getTakentest());
			  		session.setAttribute("name", user.getFname()+" "+user.getLname());	
			  	}
				return mv;	
			}
			else
			{
				ModelAndView mv2 = new ModelAndView("redirect:/");
				return mv2;
			}
		}
		catch (Exception e) {
			return mv;
		}
	}
	@RequestMapping(value = "/editEmail")
	public ModelAndView email(@RequestParam("em")String email)
	{
		ModelAndView mv2 = new ModelAndView("redirect:/");
		ModelAndView mv = new ModelAndView("redirect:/profile");
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
			  	user.setEmail_id(email);
			  	userDao.saveorupdate(user);
			  	return mv;	
			  	
			}
			else
			{
				System.out.println(22);
				return mv2;	
			}
		}
		catch (Exception e) {
			System.out.println(e);
			return mv;
		}
	}
	@RequestMapping(value = "/editphone")
	public ModelAndView phon(@RequestParam("pho")String phon)
	{
		System.out.println(111);
		ModelAndView mv2 = new ModelAndView("redirect:/");
		ModelAndView mv = new ModelAndView("redirect:/profile");
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				System.out.println(1);
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
			  	System.out.println(phon);
			  	System.out.println(user.getPhone_no());
			  	user.setPhone_no(phon);
			  	userDao.saveorupdate(user);
			  	return mv;	
			  	
			}
			else
			{
				System.out.println(22);
				return mv2;	
			}
		}
		catch (Exception e) {
			System.out.println(e);
			return mv;
		}
	}
}
