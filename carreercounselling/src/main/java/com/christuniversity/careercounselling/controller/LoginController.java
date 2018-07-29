package com.christuniversity.careercounselling.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.christuniversity.careercounsellingbackend.dao.DimensionDao;
import com.christuniversity.careercounsellingbackend.dao.QuestionDao;
import com.christuniversity.careercounsellingbackend.dao.UserDao;
import com.christuniversity.careercounsellingbackend.model.Dimension;
import com.christuniversity.careercounsellingbackend.model.Question;
import com.christuniversity.careercounsellingbackend.model.User;


@Controller
public class LoginController {
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
	
	
	@RequestMapping(value="/j_spring_security_check")
	public String processRegistration(@RequestParam("j_username")String email,@RequestParam("j_password") String pwd, Model model, HttpSession session)
	{
		User u=userDao.isvalid(email,pwd);
		if(u==null)
		{
			System.out.println("kjhdfskj");
			model.addAttribute("msg","Invalid user name and password");
			return "redirect:/userprofile";
		}
		else
		{
			session.setAttribute("user", u);
			session.setAttribute("name",u.getFname());
			return "redirect:/";
		}
	}
	@RequestMapping(value="/j_spring_security_logout")
	public String logout(HttpServletRequest request,HttpSession session,Model model)
	{
		System.out.println(1111);
		session.invalidate();
		session=request.getSession(true);
		model.addAttribute("logout","logout successful");
		return "redirect:/";
	}

}
