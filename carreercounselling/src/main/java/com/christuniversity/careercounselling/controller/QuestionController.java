package com.christuniversity.careercounselling.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

import com.christuniversity.careercounsellingbackend.dao.DimensionDao;
import com.christuniversity.careercounsellingbackend.dao.QuestionDao;
import com.christuniversity.careercounsellingbackend.model.Dimension;
import com.christuniversity.careercounsellingbackend.model.Question;
@Controller
public class QuestionController {
	@Autowired
	Dimension dimension;
	@Autowired
	DimensionDao dimensionDao;
	@Autowired
	Question question;
	@Autowired
	QuestionDao questionDao;
	
	
	@RequestMapping(value="/admin/addQuestion")
	public ModelAndView Questions(HttpServletRequest request,HttpSession session)
	{
		System.out.println(11111);
		ModelAndView mv=new ModelAndView("addQuestion");
		List<Question> q=null;
		List<Dimension> d=null;

		Map<Dimension, List<Question>> ht=null;
		try
		{
			d=(List<Dimension>)dimensionDao.Dimensions();
			q=(List<Question>)questionDao.Questions();
			mv.addObject("dimcount", d.size()); 
			ht= new LinkedHashMap<Dimension, List<Question>>();
		}
		catch(NullPointerException npe) {System.out.println(npe+" caught in /admin/addQuestion in QuestionController");}
		try
		{
			for(Dimension dota : d)
				ht.put(dota, questionDao.getquesbyDim(dota.getDime_id()));
		}
		catch(NullPointerException npe)
		{
			System.out.println(npe+" caught");
		}
		try
		{
			request.setAttribute("haka", ht);
			mv.addObject("dot",d);
			mv.addObject("count", q.size());
			mv.addObject("ques", q);
			mv.addObject("dims", d);
		}
		catch(NullPointerException npe) { System.out.println(npe+" caught in /admin/addQuestion in QuestionController");}
		System.out.println("ques controller good");
		mv.addObject("Questions", new Question());
		return mv;
	}
	@RequestMapping(value = "/admin/addQuestions", method = RequestMethod.POST)
	public ModelAndView addQuestions(@ModelAttribute("Questions") @Valid Question q,BindingResult result,Model model) 
	{
		ModelAndView mv2 = new ModelAndView("addQuestion");
		List<Question> q1 = null;
		List<Dimension> d = null;
		try
		{
			q1=(List<Question>)questionDao.Questions();
			mv2.addObject("count", q1.size());
			d=(List<Dimension>)dimensionDao.Dimensions();
			mv2.addObject("ques", q1);
			mv2.addObject("dims", d);
		}
		catch(NullPointerException npe) { System.out.println(npe+" caught in /admin/addQuestions in QuestionController");}
		if (result.hasErrors()) 
		{
			System.out.println(99);
			mv2.addObject("Questions", q);
			return mv2;
		} 
		else 
		{
			ModelAndView mv = new ModelAndView("redirect:/admin/addQuestion");
			try 
			  {
				List<Question> l1 = null;
				int a = 0;
				try
				{
					l1 =(List<Question>)questionDao.getquesbyDim(q.getDimension().getDime_id());
					a=l1.size();
					System.out.println(a);
				}
				catch(NullPointerException npe)
				{
					System.out.println(npe+" caught in /admin/addQuestions in QuestionController");
				}
				if (a<q.getDimension().getNoofques())
				{
					questionDao.saveorupdate(q);
					return mv;
				}
				else
				{
					System.out.println("Cannot add more than 8 questions to a dimension");
					mv2.addObject("mess", "Cannot add more than "+q.getDimension().getNoofques()+" questions to a dimension");
					return mv2;
				}
			    
			  } catch (Exception e) {
			    	mv2.addObject("Questions", q);
			    	return mv2;
			}
		}
	}
	
	@RequestMapping(value = "/admin/editQuestions/{id}", method = RequestMethod.GET)
	public ModelAndView editQuestions(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("addQuestion");
		List<Dimension> d = null;
		List<Question> q = null;
		try
		{
			q=(List<Question>)questionDao.Questions();
			d=(List<Dimension>)dimensionDao.Dimensions();
			mv.addObject("count", q.size());
			mv.addObject("ques", q);
			mv.addObject("dims", d);
			mv.addObject("Questions", questionDao.getQuestions(id));
		}
		catch(NullPointerException npe) {
		System.out.println(npe+" caught admin/editQuestions in QuestionController");}
		return mv;
	}
	
	@RequestMapping(value = "/admin/deleteQuestions/{id}", method = RequestMethod.GET)
	public ModelAndView deleteQuestions(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("redirect:/admin/addQuestion");
		Question cyyy=questionDao.getQuestions(id);
		questionDao.delete(cyyy);
		return mv;
	}
}
