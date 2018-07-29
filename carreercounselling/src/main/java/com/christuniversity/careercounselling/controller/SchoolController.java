package com.christuniversity.careercounselling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.christuniversity.careercounsellingbackend.dao.SchoolDao;

import com.christuniversity.careercounsellingbackend.model.School;

@Controller
public class SchoolController 
{
    @Autowired
    School school;
    @Autowired
    SchoolDao schoolDao;
    
    @RequestMapping(value = "/school")
	public ModelAndView school() {
		
		ModelAndView mv = new ModelAndView("schoolregistrationForm");
		mv.addObject("school",new School());
		List<School> li=(List<School>)schoolDao.Schools();
		mv.addObject("schools", li);
		return mv;
	}
    @RequestMapping(value = "/admin/addschool", method = RequestMethod.POST)
	public ModelAndView addSchool(@ModelAttribute("school") School s,Model model) 
	{
        System.out.println(123);
    	ModelAndView mv= new ModelAndView("redirect:/school");
    	try
    	{
    		String scname=s.getSchool_name();
    		String val;
    		char s1,s2,s3;
    		String[] words = scname.split("\\s+");
    	    int wordslen= words.length;
    	    if(wordslen>2)
    	    {
    	    	s1=words[0].charAt(0);
		    	s2=words[1].charAt(0);
		    	s3=words[2].charAt(0);
		    	val=new StringBuilder().append(s1).append(s2).append(s3).toString();
    	    }
    	    else if(wordslen==2)
    	    {
    	    	s1=words[0].charAt(0);
		    	s2=words[1].charAt(0);
		    	val=new StringBuilder().append('X').append(s1).append(s2).toString();
    	    }
    	    else
    	    	val=scname.substring(0, 3);
    		s.setScl_uniq_code(val+s.getPincode().substring(0,2)+s.getPincode().substring(4,6));
			schoolDao.saveorupdate(s);
		} catch (Exception e) {
			System.out.println(e);
			return mv;
		}
    	return mv;
	}
		
    
}
