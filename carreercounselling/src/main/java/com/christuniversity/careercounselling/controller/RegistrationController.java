package com.christuniversity.careercounselling.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christuniversity.careercounsellingbackend.dao.SchoolDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.model.Authentication;
import com.christuniversity.careercounsellingbackend.model.Report;
import com.christuniversity.careercounsellingbackend.model.School;
import com.christuniversity.careercounsellingbackend.model.User;




@Controller
public class RegistrationController 
{
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	Authentication aut;
	@Autowired
	School school;
	@Autowired
	SchoolDao schoolDao;
	
	
	@RequestMapping(value = "/registeruser", method = RequestMethod.POST)
	public ModelAndView registeruser(@ModelAttribute("user") User u, RedirectAttributes redirectAttrs) 
	{
		System.out.println(123);
		ModelAndView mv = new ModelAndView("redirect:/");
		School scq=u.getSchool();
		School sc=schoolDao.getSchools(scq.getSchool_id());
		if(sc.getCount()<=Integer.parseInt(sc.getNo_of_studs()))
		{
			sc.setCount(sc.getCount()+1);
			u.setReport(new Report());
			aut=new Authentication();
			aut.setRolename("ROLE_STUDENT");
			u.setStud_uniq_code(sc.getScl_uniq_code()+u.getStud_class()+u.getSection()+u.getRoll_no());
			aut.setUsername(sc.getScl_uniq_code()+u.getStud_class()+u.getSection()+u.getRoll_no());
			u.setAut(aut);
			if(userDao.saveorupdate(u))
			{
			redirectAttrs.addFlashAttribute("mess","You have Successfuly Registered Your User ID is "+u.getStud_uniq_code());
			}//mv.addObject( );
			else
			{
				redirectAttrs.addFlashAttribute("errMsg","Sorry you Can not register please try after Some Time");
			}
		}else {
			redirectAttrs.addFlashAttribute("errMsg", "Maximum Number of Students Reached");
//			mv.addObject("errMsg", "Maximum Number of Students Reached");
		}
		return mv;
	}
}
