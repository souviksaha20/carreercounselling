package com.christuniversity.careercounselling.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.christuniversity.careercounsellingbackend.dao.StrengthDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.dao.User_StrengthsDao;
import com.christuniversity.careercounsellingbackend.model.Strength;
import com.christuniversity.careercounsellingbackend.model.User;
import com.christuniversity.careercounsellingbackend.model.User_Strengths;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class StrengthController
{
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	Strength strength;
	@Autowired
	StrengthDao strengthDao;
	@Autowired
	User_Strengths user_Strengths;
	@Autowired
	User_StrengthsDao user_StrengthsDao;
	@RequestMapping(value="/userStrength")
	public ModelAndView Strengths(HttpServletRequest request,HttpSession session)
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
				List<Strength> x = null;
				List<User_Strengths> y = null;
				List<Strength> s;
				List<User_Strengths> us;
				ModelAndView mv=new ModelAndView("userstrength");
				try {
					x=new ArrayList<Strength>();
					y=new ArrayList<User_Strengths>();
					s=(List<Strength>)strengthDao.Strengths();
					us=(List<User_Strengths>)user_StrengthsDao.getStrByUser(user.getUser_id());
					x.addAll(s);
					y.addAll(us);
				}catch(NullPointerException e)
				{
					System.out.println("strength by user empty");
				}
				try
				{
					if(y.size()!=0)
					{
						System.out.println(222111);
						mv.addObject("uslist", y);
						
						
						for (User_Strengths var : y) 
						{
							Iterator<Strength> iterator = x.iterator();
							while(iterator.hasNext()){
								Strength curstr = iterator.next();
							if(var.getStrength().getStr_id().equals(curstr.getStr_id()))
								iterator.remove();
							}
						}
					}
					mv.addObject("strcount", x.size());
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught");
				}
				mv.addObject("strs", x);
				mv.addObject("Strengths", new Strength());
				System.out.println("UserStrength controller initialisation good");
				return mv;
			}
			else
			{
				ModelAndView mv = new ModelAndView("redirect:/");
				return mv;
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception handled StrengthController init");
			ModelAndView mv = new ModelAndView("userstrength");
			return mv;
		}
	}
	
	@RequestMapping(value="/addedMyStrength",method=RequestMethod.GET)
	public @ResponseBody User_Strengths addedMyStrength(@RequestParam("sId") String id,Model m) throws JsonProcessingException
	{
		Strength str=new Strength();
		User_Strengths ustr=new User_Strengths();
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
				try
				{
				  	user=userDao.getUserByUniqCode(curuser);
					str=(Strength)strengthDao.getStrengths(id);
					ustr.setStrength(str);
					ustr.setUser(user);
					try {
						if(user_StrengthsDao.saveorupdate(ustr)) {
							System.out.println("user strength successful");
						}
						else {
							System.out.println("sorry");
						}
					}catch (Exception e) {
						System.out.println("Unique constraint violation or null constraint handled.");
					}
					m.addAttribute("Strengths", new Strength());
				}catch (Exception e) {
					System.out.println("Unique constraint violation or null constraint handled.");
				}
			}
		}catch(Exception e)
		{
			System.out.println("Exception handled taketest init");
		}
		return ustr;
	}
	
	@RequestMapping(value = "/deleteMyStrength", method = RequestMethod.GET)
	public @ResponseBody void deleteMyStrength(@RequestParam("sId") String id) throws JsonProcessingException
	{
		System.out.println(78);
		try {
			User_Strengths u_s=(User_Strengths) user_StrengthsDao.getUserStrengthsByStrnUser(id,user.getUser_id());
			user_StrengthsDao.delete(u_s);
		} catch (Exception e) {
			System.out.println("attempt to create delete event with null entity");
		}
	}

}
