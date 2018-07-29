package com.christuniversity.careercounselling.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.christuniversity.careercounsellingbackend.dao.SubjectDao;
import com.christuniversity.careercounsellingbackend.model.Subject;

@Controller
public class AdminSubjectController
{
	@Autowired
	Subject subject;
	@Autowired
	SubjectDao subjectDao;
	@RequestMapping(value="/admin/addSubject")
	public ModelAndView Subjects(HttpServletRequest request,HttpSession session)
	{
		ModelAndView mv=new ModelAndView("addSubject");
		List<Subject> su = null;
		try
		{
			su=(List<Subject>)subjectDao.Subjects();
			mv.addObject("subcount", su.size());
			mv.addObject("subs", su);
			System.out.println("AdminSubjectController initialisation good");
		}
		catch(NullPointerException npe) { System.out.println(npe+" caught in /admin/addSubject in AdminSubjectController"); }
		mv.addObject("Subjects", new Subject());
		return mv;
	}
	@RequestMapping(value = "/admin/addedSubject", method = RequestMethod.POST)
	public ModelAndView addedSubjectx(@ModelAttribute("Subjects") @Valid Subject s,BindingResult result,Model model) 
	{
		ModelAndView mv2 = new ModelAndView("addSubject");
		List<Subject> su = null;
		try
		{
			su=(List<Subject>)subjectDao.Subjects();
			mv2.addObject("count", su.size());
			mv2.addObject("subs", su);
		}
		catch(NullPointerException npe) { System.out.println(npe+" caught in /admin/addedSubject in AdminSubjectController"); }
		if (result.hasErrors()) 
		{
			System.out.println(9009);
			mv2.addObject("Subjects", s);
			return mv2;
		} 
		else 
		{
			ModelAndView mv = new ModelAndView("redirect:/admin/addSubject");
			try 
			  {
				System.out.println(141103);
				subjectDao.saveorupdate(s);
				return mv;
			  }
			catch (Exception e) {
				mv2.addObject("Subjects", s);
			   	return mv2;
			}
		}
	}
	
	@RequestMapping(value = "/admin/editSubject/{id}", method = RequestMethod.GET)
	public ModelAndView editSubjectx(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("addSubject");
		List<Subject> su = null;
		try
		{
			su=(List<Subject>)subjectDao.Subjects();
			mv.addObject("subcount", su.size());
			mv.addObject("subs", su);
			mv.addObject("Subjects", subjectDao.getSubjects(id));
		}
		catch(NullPointerException npe) { System.out.println(npe+" caught in /admin/editSubject/{id} in AdminSubjectController"); }
		return mv;
	}
	
	@RequestMapping(value = "/admin/deleteSubject/{id}", method = RequestMethod.GET)
	public ModelAndView deleteSubjectx(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("redirect:/admin/addSubject");
		Subject cyyy=subjectDao.getSubjects(id);
		subjectDao.delete(cyyy);
		return mv;
	}
}
