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

import com.christuniversity.careercounsellingbackend.dao.JobDao;
import com.christuniversity.careercounsellingbackend.model.Job;

@Controller
public class AdminJobController {
	@Autowired
	Job job;
	@Autowired
	JobDao jobDao;

	@RequestMapping(value = "/admin/addJob")
	public ModelAndView Jobs(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("addJob");
		List<Job> j = null;
		try {
			j = (List<Job>) jobDao.Jobs();
			mv.addObject("jobcount", j.size());
			mv.addObject("jobs", j);
			mv.addObject("Jobs", new Job());
			System.out.println("AdminJob controller initialisation good");
		} catch (NullPointerException npe) {
			System.out.println(npe + " caught in /admin/addJob in AdminJobController");
			
		}
		return mv;
	}

	@RequestMapping(value = "/admin/addedJob", method = RequestMethod.POST)
	public ModelAndView addedJobx(@ModelAttribute("Jobs") @Valid Job j, BindingResult result, Model model) {
		ModelAndView mv2 = new ModelAndView("addJob");
		List<Job> j1 = null;
		try {
			j1 = (List<Job>) jobDao.Jobs();
			mv2.addObject("count", j1.size());
			mv2.addObject("jobs", j1);
		} catch (NullPointerException npe) {
			System.out.println(npe + " caught in /admin/addedJob in AdminJobController");
		}
		if (result.hasErrors()) {
			System.out.println(9009);
			mv2.addObject("Jobs", j);
			return mv2;
		} else {
			ModelAndView mv = new ModelAndView("redirect:/admin/addJob");
			try {
				System.out.println(14003);
				System.out.println(j.getJob_id());
				jobDao.saveorupdate(j);
				return mv;

			} catch (Exception e) {
				mv2.addObject("Jobs", j);
				return mv2;
			}
		}
	}

	@RequestMapping(value = "/admin/editJob/{id}", method = RequestMethod.GET)
	public ModelAndView editJobx(@PathVariable("id") String id) {
		ModelAndView mv = new ModelAndView("addJob");
		List<Job> j1 = null;
		try {
			j1 = (List<Job>) jobDao.Jobs();
			mv.addObject("count", j1.size());
			mv.addObject("jobs", j1);
		} catch (NullPointerException npe) {
			System.out.println(npe + " caught in /admin/editJob/{id} in AdminJobController");
		}
		mv.addObject("Jobs", jobDao.getJobs(id));
		return mv;
	}

	@RequestMapping(value = "/admin/deleteJob/{id}", method = RequestMethod.GET)
	public ModelAndView deleteJobx(@PathVariable("id") String id) {
		ModelAndView mv = new ModelAndView("redirect:/admin/addJob");
		Job cyyy = jobDao.getJobs(id);
		jobDao.delete(cyyy);
		return mv;
	}

}
