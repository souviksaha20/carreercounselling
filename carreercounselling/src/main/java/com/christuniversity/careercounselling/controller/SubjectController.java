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

import com.christuniversity.careercounsellingbackend.dao.SubjectDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.dao.User_SubjectsDao;
import com.christuniversity.careercounsellingbackend.model.Subject;
import com.christuniversity.careercounsellingbackend.model.User;
import com.christuniversity.careercounsellingbackend.model.User_Subjects;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class SubjectController
{
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	Subject subject;
	@Autowired
	SubjectDao subjectDao;
	@Autowired
	User_Subjects user_Subjects;
	@Autowired
	User_SubjectsDao user_SubjectsDao;
	@RequestMapping(value="/userSubject")
	public ModelAndView Subjects(HttpServletRequest request,HttpSession session)
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
			  	
				ModelAndView mv=new ModelAndView("usersubject");
				List<Subject> x=new ArrayList<Subject>();
				List<User_Subjects> y=new ArrayList<User_Subjects>();
				try
				{
					user.setTakentest("Yes");
					userDao.saveorupdate(user);
					session.setAttribute("takentest", "Yes");
				List<Subject> s=(List<Subject>)subjectDao.Subjects();
				List<User_Subjects> us=(List<User_Subjects>)user_SubjectsDao.getSubByUser(user.getUser_id());
				x.addAll(s);
				y.addAll(us);
				}catch(NullPointerException e)
				{
					System.out.println("Sub by user empty");
				}
				try
				{
					if(y.size()!=0)
					{
						System.out.println(222111);
						mv.addObject("usulist", y);
						for (User_Subjects var : y) 
						{
							Iterator<Subject> iterator = x.iterator();
							while(iterator.hasNext()){
								Subject cursub = iterator.next();
							if(var.getSubject().getSub_id().equals(cursub.getSub_id()))
								iterator.remove();
							}
						}
					}
					mv.addObject("subcount", x.size());
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught");
				}
				mv.addObject("subs", x);
				mv.addObject("Subjects", new Subject());
				System.out.println("UserSubject controller initialisation good");
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
			System.out.println("Exception handled taketest init");
			ModelAndView mv = new ModelAndView("usersubject");
			return mv;
		}
	}
	
	@RequestMapping(value="/addedMySubject",method=RequestMethod.GET)
	public @ResponseBody User_Subjects addedMySubject(@RequestParam("sId") String id,Model m) throws JsonProcessingException
	{
		Subject sub=new Subject();
		User_Subjects usub = null;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
				try
				{
				  	user=userDao.getUserByUniqCode(curuser);
					sub=(Subject)subjectDao.getSubjects(id);
					usub=new User_Subjects();
					usub.setSubject(sub);
					usub.setUser(user);
					if(user_SubjectsDao.saveorupdate(usub)) {
						System.out.println("user subject successful");
						}
					else {
						System.out.println("sorry");
					}
				}catch (Exception e) {
					System.out.println("Unique constraint violation or null constraint handled.");
				}
				m.addAttribute("Subjects", new Subject());
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception handled taketest init");
		}
		return usub;
	}
	
	@RequestMapping(value = "/deleteMySubject", method = RequestMethod.GET)
	public @ResponseBody void deleteMySubject(@RequestParam("sId") String id) throws JsonProcessingException
	{
		System.out.println(78);
		try {
			User_Subjects u_s=(User_Subjects) user_SubjectsDao.getUserSubjectsBySubnUser(id,user.getUser_id());
			user_SubjectsDao.delete(u_s);
		} catch (Exception e) {
			System.out.println("attempt to create delete event with null entity");
		}
	}

}
