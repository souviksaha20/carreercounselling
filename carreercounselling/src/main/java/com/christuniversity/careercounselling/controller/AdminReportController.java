package com.christuniversity.careercounselling.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.christuniversity.careercounsellingbackend.dao.DimensionDao;
import com.christuniversity.careercounsellingbackend.dao.ResultDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.model.Dimension;
import com.christuniversity.careercounsellingbackend.model.Result;
import com.christuniversity.careercounsellingbackend.model.User;
@Controller
public class AdminReportController {
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	Dimension dimension;
	@Autowired
	DimensionDao dimensionDao;
	@Autowired
	Result result;
	@Autowired
	ResultDao resultDao;
	String reportid;
	@RequestMapping(value="/admin/report")
	public ModelAndView adminreport()
	{
		List<User> userlist=(List<User>)userDao.Users();
		ModelAndView mv=new ModelAndView("adminreport");
		mv.addObject("userlist", userlist);
		System.out.println("adminreport_page_load_successful");
		return mv;
	}
	@RequestMapping(value = "/admin/report/{id}", method = RequestMethod.GET)
	public ModelAndView viewReport(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("admindetailedreport");
		List<User> userlist=(List<User>)userDao.Users();
		mv.addObject("userlist", userlist);
		reportid=id;
		float b=0;
		List<String> scarray=new ArrayList<String>();
		List<Dimension> dlist = (List<Dimension>) dimensionDao.Dimensions();
		try
		{
		for (Dimension dd : dlist) {
			List<Result> roo = (List<Result>) resultDao.resByDimnRep(dd.getDime_id(),id);
			try {
			b+=roo.size();
			}catch(NullPointerException e)
			{
				System.out.println("NPE: Score in "+dd.getDime_name()+" is 0.");
			}
		}
		}
		catch(NullPointerException e)
		{
			System.out.println("NPE: Dimension List is 0.");
		}
		List<String> a=new ArrayList<String>();
		try
		{
		for (Dimension dd : dlist) {
			a.add(dd.getDime_name());
			List<Result> roo = (List<Result>) resultDao.resByDimnRep(dd.getDime_id(),id);
			try {
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
		}catch(NullPointerException e)
		{
			System.out.println("NPE: Dimension List is 0.");
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
		System.out.println("Highest scoring dimensions : "+scarray1);
		JSONArray scArray = new JSONArray(scarray);
		System.out.println("Highest scoring dimensions with marks"+scArray);
		mv.addObject("scarray", scArray);
		mv.addObject("dimensions", scarray1);
		System.out.println("All dimensions with marks "+a);
		JSONArray scorelist = new JSONArray(a);
		mv.addObject("scorelist", scorelist);
		return mv;
	}
}
