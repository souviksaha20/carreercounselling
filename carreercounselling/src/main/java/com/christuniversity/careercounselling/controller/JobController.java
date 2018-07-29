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

import com.christuniversity.careercounsellingbackend.dao.JobDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.dao.User_JobsDao;
import com.christuniversity.careercounsellingbackend.model.Job;
import com.christuniversity.careercounsellingbackend.model.User;
import com.christuniversity.careercounsellingbackend.model.User_Jobs;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class JobController
{
	@Autowired
	Job job;
	@Autowired
	JobDao jobDao;
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	User_Jobs user_Jobs;
	@Autowired
	User_JobsDao user_JobsDao;
	@RequestMapping(value="/userJob")
	public ModelAndView Jobs(HttpServletRequest request,HttpSession session)
	{
		List<Job> x=new ArrayList<Job>();
		List<User_Jobs> y=new ArrayList<User_Jobs>();
		List<Job> j;
		List<User_Jobs> uj;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
		  		ModelAndView mv=new ModelAndView("userjob");
				try{
					j=(List<Job>)jobDao.Jobs();
					uj=(List<User_Jobs>)user_JobsDao.getJobsByUser(user.getUser_id());
					x.addAll(j);
					y.addAll(uj);
				}catch(NullPointerException e)
				{
					System.out.println("Job by user empty");
				}
				try
				{
					if(y.size()!=0)
					{
						System.out.println(222111);
						mv.addObject("ujlist", y);
						
						
						for (User_Jobs var : y) 
						{
							Iterator<Job> iterator = x.iterator();
							while(iterator.hasNext()){
							    Job curjob = iterator.next();
							if(var.getJob().getJob_id().equals(curjob.getJob_id()))
								iterator.remove();
							}
						}
					}
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught");
				}
				try
				{
					mv.addObject("jobcount", x.size());
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught");
				}
				
				mv.addObject("jobs", x);
				System.out.println("Updated ArrayList Elements: "+x);
				mv.addObject("Jobs", new Job());
				System.out.println("UserJob controller initialisation good");
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
	
	@RequestMapping(value="/addedMyJob",method=RequestMethod.GET)
	public @ResponseBody User_Jobs addedMyJob(@RequestParam("jId") String bId,Model m) throws JsonProcessingException
	{
		Job job1=new Job();
		User_Jobs user_Jobs1 = null;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
				try
				{
				  	user=userDao.getUserByUniqCode(curuser);
					job1=(Job)jobDao.getJobs(bId);
					user_Jobs1=new User_Jobs();
					user_Jobs1.setJob(job1);
					user_Jobs1.setUser(user);
					try {
						if(user_JobsDao.saveorupdate(user_Jobs1)) {
							System.out.println("user job successful");
						}
						else {
							System.out.println("sorry");
						}
					} catch (Exception e) {
						System.out.println("Unique constraint violation or null constraint handled.");
					}
					m.addAttribute("Jobs", new Job());
				}catch (Exception e) {
					System.out.println("Unique constraint violation or null constraint handled.");
				}
			}
		}catch(Exception e)
		{
			System.out.println("Exception handled taketest init");
		}
		return user_Jobs1;
		
	}
	
	@RequestMapping(value = "/deleteMyJob", method = RequestMethod.GET)
	public @ResponseBody void deleteMyJob(@RequestParam("jId") String bId) throws JsonProcessingException
	{
		System.out.println(78);
		try {
			User_Jobs u_j=(User_Jobs) user_JobsDao.getUserJobsByJobnUser(bId,user.getUser_id());
			user_JobsDao.delete(u_j);
		} catch (Exception e) {
			System.out.println("attempt to create delete event with null entity");
		}
	}
}