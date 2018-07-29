package com.christuniversity.careercounselling.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
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

import com.christuniversity.careercounsellingbackend.dao.DimensionDao;
import com.christuniversity.careercounsellingbackend.dao.QuestionDao;
import com.christuniversity.careercounsellingbackend.dao.ReportDao;
import com.christuniversity.careercounsellingbackend.dao.ResultDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.model.Dimension;
import com.christuniversity.careercounsellingbackend.model.Question;
import com.christuniversity.careercounsellingbackend.model.Report;
import com.christuniversity.careercounsellingbackend.model.Result;
import com.christuniversity.careercounsellingbackend.model.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class ResultController {
	@Autowired
	Dimension dimension;
	@Autowired
	DimensionDao dimensionDao;
	@Autowired
	Question question;
	@Autowired
	QuestionDao questionDao;
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	Result result;
	@Autowired
	ResultDao resultDao;
	@Autowired
	Report report;
	@Autowired
	ReportDao reportDao;
	int i = 0;
	String a1 = null;
	int flag=0;
	@RequestMapping(value="/takeTest")
	public ModelAndView Results(HttpServletRequest request,HttpSession session)
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
				ModelAndView mv=new ModelAndView("taketest");
				System.out.println("Fsd");
				System.out.println(user.getUser_id()+" "+user.getStud_uniq_code());
				List<Question> q = null;
				List<Dimension> d = null;
				List<Result> r = null;
				List<Question> q1=new ArrayList<Question>();
				List<Dimension> d1=new ArrayList<Dimension>();
				List<Result> r1=new ArrayList<Result>();
				JSONArray quesArray = null;
				JSONArray resArray = null;
				try
				{
					q=(List<Question>)questionDao.Questions();
					d=(List<Dimension>)dimensionDao.Dimensions();
				}
				catch(NullPointerException npe){ System.out.println(npe+" caught : q or d empty"); }
				try{r=(List<Result>)resultDao.resByRep(user.getReport().getRep_id());}catch(NullPointerException npe){System.out.println(npe+" caught : r empty");}
				try
				{
					q1.addAll(q);
					d1.addAll(d);
				}catch(NullPointerException npe){ System.out.println(npe+" caught : q1 or d1 empty"); }
				try{r1.addAll(r);}catch(NullPointerException npe){System.out.println(npe+" caught : r1 empty");}
				quesArray = new JSONArray(q1);
				resArray = new JSONArray(r1);
				mv.addObject("reslist", r1);
				mv.addObject("reslit", resArray);
				mv.addObject("ques", q1);
				mv.addObject("dims", d1);
				mv.addObject("ajf", quesArray);
				try
				{
					mv.addObject("noofqs", q.size());
					mv.addObject("noofds", d.size());
				}
				catch(NullPointerException npe){System.out.println(npe+" caught");}
				try{mv.addObject("noofrs", r1.size());}catch(NullPointerException npe){System.out.println(npe+" caught : r1.size() empty");}
				mv.addObject("Results", new Result());
				System.out.println("Result controller initialisation good");
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
			ModelAndView mv = new ModelAndView("taketest");
			return mv;
		}
	}
	
	@RequestMapping(value="/saveResult",method=RequestMethod.GET)
	public @ResponseBody List<Integer> saveResult(@RequestParam("qId") String qid,@RequestParam("ans") String ans,Model m) throws JsonProcessingException
	{
		List<Integer> ab=new ArrayList<Integer>();
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
			  	Question q=new Question();
				q=(Question)questionDao.getQuestions(qid);
				Result r=resultDao.getResultByQnU(qid,user.getReport().getRep_id());
				if(r!=null)
				{
					r.setAnswer(ans);
				}
				else
				{
					r=new Result();
					r.setReport(user.getReport());
					r.setQuestion(q);
					r.setAnswer(ans);
				}
				if(resultDao.saveorupdate(r)) {
					System.out.println("One result save success");
				}
				else {
					System.out.println("One result save fail");
				}
				r=resultDao.getResultByQnU(qid,user.getReport().getRep_id());
				List<Result> r1 = null;
				List<Question> q1 = null;
				try
				{
					r1=(List<Result>)resultDao.resByRep(user.getReport().getRep_id());
					q1=(List<Question>)questionDao.Questions();
					m.addAttribute("progress", r1.size());
					m.addAttribute("total", q1.size());
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught");
				}
				
				m.addAttribute("Results", new Result());
				List<Dimension> dlist = null;
				try
				{
					ab.add(r1.size());
					ab.add(q1.size());
					dlist = (List<Dimension>)dimensionDao.Dimensions();
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught");
				}
				int x=0;
				String j=null;
				for(Dimension dd:dlist)
				{
					try
					{
						List<Result> roo=(List<Result>)resultDao.resByDim(dd.getDime_id());
						if(!roo.isEmpty())
						{
							if(roo.size()>x)
							{
								System.out.println(roo.size());
								x=roo.size();
								j=dd.getDime_name();
							}
						}
					}catch(NullPointerException e)
			        {
			            System.out.print("NullPointerException Caught");
			        }
				}
				System.out.println("Your best dimension is : "+j);
				if(j!=null)
				{
					System.out.println("reched here");
					Report repor=user.getReport();
					repor.setDimensionname(j);
					repor.setHighestmarks(Integer.toString(x));
					userDao.saveorupdate(user);
					r.setReport(repor);
					System.out.println(repor.getRep_id());
					System.out.println(repor.getDimensionname());
					System.out.println(repor.getHighestmarks());
				}
				return ab;
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception caught method saveResult");
		}
		return ab;
	}
	@RequestMapping(value="/review")
	public ModelAndView review(HttpServletRequest request,HttpSession session)
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		ModelAndView mv=new ModelAndView("review");
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
				List<Result> rsList;
				try
				{
					rsList=resultDao.resByRep(user.getReport().getRep_id());
					mv.addObject("results",rsList);
					mv.addObject("Resultss", new Result());
				}
				catch(NullPointerException e)
				{
					System.out.println("NPE: method review");
				}
				return mv;
			}
			else
			{
				ModelAndView mv1 = new ModelAndView("redirect:/");
				return mv1;
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception handled taketest review method (page)");
			ModelAndView mv1 = new ModelAndView("review");
			return mv1;
		}
	}
	@RequestMapping(value="/modResult",method=RequestMethod.GET)
	public @ResponseBody int modResult(@RequestParam("qId") String qid) throws JsonProcessingException
	{
		int finans=0;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		try
		{
			if(!(auth instanceof AnonymousAuthenticationToken))
			{
				String curuser=auth.getName();
			  	user=userDao.getUserByUniqCode(curuser);
				Result r;
				try
				{
					r=resultDao.getResultByQnU(qid,user.getReport().getRep_id());
					if(r!=null)
					{
						String a=r.getAnswer();
						if(a.equals("1"))
						{
							r.setAnswer("0");
							finans=0;
						}
						else
						{
							r.setAnswer("1");
							finans=1;
						}
					}
					if(resultDao.saveorupdate(r)) {
						System.out.println("One result mod success");
					}
					else {
						System.out.println("One result mod fail");
					}
				}
				catch(Exception e)
				{
					System.out.println("An exception in method modResult in ResultController");
				}
			}
		}catch(Exception e)
		{
			System.out.println("Main exception in method modResult in ResultController");
		}
		return finans;
	}
}
