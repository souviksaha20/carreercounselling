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

import com.christuniversity.careercounsellingbackend.dao.StrengthDao;
import com.christuniversity.careercounsellingbackend.model.Strength;

@Controller
public class AdminStrengthController
{
	@Autowired
	Strength strength;
	@Autowired
	StrengthDao strengthDao;
	@RequestMapping(value="/admin/addStrength")
	public ModelAndView Strengths(HttpServletRequest request,HttpSession session)
	{
		ModelAndView mv=new ModelAndView("addStrength");
		List<Strength> s = null;
		try
		{
			s=(List<Strength>)strengthDao.Strengths();
			mv.addObject("strcount", s.size());
			mv.addObject("strengths", s);
			System.out.println("AdminStrengthController initialisation good");
		}
		catch(NullPointerException npe){ System.out.println(npe+" caught in /admin/addStrength in AdminStrengthController"); }
		mv.addObject("Strengths", new Strength());
		return mv;
	}
	@RequestMapping(value = "/admin/addedStrength", method = RequestMethod.POST)
	public ModelAndView addedStrengthx(@ModelAttribute("Strengths") @Valid Strength s,BindingResult result,Model model) 
	{
		ModelAndView mv2 = new ModelAndView("addStrength");
		List<Strength> s1 = null;
		try
		{
			s1=(List<Strength>)strengthDao.Strengths();
			mv2.addObject("count", s1.size());
			mv2.addObject("strengths", s1);
		}
		catch(NullPointerException npe)
		{
			System.out.println(npe+" caught in /admin/addedStrength in AdminStrengthController");
		}
		if (result.hasErrors()) 
		{
			System.out.println(90909);
			mv2.addObject("Strengths", s);
			return mv2;
		} 
		else 
		{
			ModelAndView mv = new ModelAndView("redirect:/admin/addStrength");
			try 
			  {
				System.out.println(141103);
				strengthDao.saveorupdate(s);
				return mv;
			  } catch (Exception e) {
			    	mv2.addObject("Strengths", s);
			    	return mv2;
			}
		}
	}
	
	@RequestMapping(value = "/admin/editStrength/{id}", method = RequestMethod.GET)
	public ModelAndView editStrengthx(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("addStrength");
		List<Strength> s = null;
		try
		{
			s=(List<Strength>)strengthDao.Strengths();
			mv.addObject("strcount", s.size());
			mv.addObject("strengths", s);
			mv.addObject("Strengths", strengthDao.getStrengths(id));
		}
		catch(NullPointerException npe) { System.out.println(npe+" caught in /admin/editStrength/{id} in AdminStrengthController");}
		return mv;
	}
	
	@RequestMapping(value = "/admin/deleteStrength/{id}", method = RequestMethod.GET)
	public ModelAndView deleteStrengthx(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("redirect:/admin/addStrength");
		Strength cyyy=strengthDao.getStrengths(id);
		strengthDao.delete(cyyy);
		return mv;
	}
}
