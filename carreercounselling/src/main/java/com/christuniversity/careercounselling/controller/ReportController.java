package com.christuniversity.careercounselling.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

@Controller
public class ReportController {
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
	
	@RequestMapping(value = "/report")
	public ModelAndView Report(HttpServletRequest request, HttpSession session) {
	Authentication auth=SecurityContextHolder.getContext().getAuthentication();
	try
	{
		if(!(auth instanceof AnonymousAuthenticationToken))
		{
			String curuser=auth.getName();
		  	user=userDao.getUserByUniqCode(curuser);
			ModelAndView mv = new ModelAndView("report");
			float b=0;
			List<String> scarray;
			List<Dimension> dlist;
			List<Result> rsltlist;
			scarray=new ArrayList<String>();
			try
			{
				dlist= (List<Dimension>) dimensionDao.Dimensions();
				for (Dimension dd : dlist) {
					try {
					rsltlist = (List<Result>) resultDao.resByDimnRep(dd.getDime_id(),user.getReport().getRep_id());
					b+=rsltlist.size();
					}catch(NullPointerException e)
					{
						System.out.println("NPE : Score in "+dd.getDime_name()+" is 0 ReportController line 65.");
					}
				}
				List<String> a=new ArrayList<String>();
				List<Result> roo;
				for (Dimension dd : dlist) {
					a.add(dd.getDime_name());
					try {
					roo = (List<Result>) resultDao.resByDimnRep(dd.getDime_id(),user.getReport().getRep_id());
					float cur=roo.size();
					DecimalFormat df = new DecimalFormat();
					df.setMaximumFractionDigits(2);
					float value=cur/b*100;
					scarray.add(dd.getDime_name()+" "+df.format(value));
					a.add(df.format(value));
					}catch(NullPointerException e)
					{
						String a1=Integer.toString(0);
						a.add(a1);
					}
				}
				for(int i=0;i<scarray.size();i++)
				{
					for(int j=i+1;j<scarray.size();j++)
					{
						String str = scarray.get(i).replaceAll("[^0-9?!\\.]","");
						String str1 = scarray.get(j).replaceAll("[^0-9?!\\.]","");
						Float a1 = Float.valueOf(str);
						Float b1 = Float.valueOf(str1);
						if(a1<b1)
							Collections.swap(scarray, i, j);
					}
				}
				for (int i1=2;i1<scarray.size()-1;i1++)
				{
					try {
						if(!(scarray.get(i1).replaceAll("[^0-9?!\\.]","").equals(scarray.get(i1+1).replaceAll("[^0-9?!\\.]",""))))
						{
							scarray.subList(i1+1, scarray.size()).clear();
							break;
						}
					} catch (IndexOutOfBoundsException e) {
						System.out.println("check what it did");
					}
				}
				List<String> scarray1=new ArrayList<String>();
				for(int i1=0;i1<scarray.size();i1++)
					scarray1.add(scarray.get(i1).replaceAll("[^A-Za-z ]","").trim());
				System.out.println(scarray1);
				JSONArray scArray = new JSONArray(scarray);
				JSONArray fullscore = new JSONArray(a);
				System.out.println("Highest scoring dimensions with marks"+scArray);
				mv.addObject("scarray", scArray);
				mv.addObject("scorelist", fullscore);
				mv.addObject("dimensions", scarray1);
			}catch(Exception e) {System.out.println("NPE : dlist empty ReportController line 62");}
			return mv;
		}
		else
		{
			ModelAndView mv = new ModelAndView("redirect:/");
			return mv;
		}
	}catch(Exception e){
			System.out.println("Exception handled ReportController(individual_student) init");
			ModelAndView mv = new ModelAndView("report");
			return mv;
		}
	}
}
