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

import com.christuniversity.careercounsellingbackend.dao.DimensionDao;
import com.christuniversity.careercounsellingbackend.model.Dimension;
@Controller
public class DimensionController {
	@Autowired
	Dimension dimension;
	@Autowired
	DimensionDao dimensionDao;
	
	@RequestMapping(value="/admin/addDimension")
	public ModelAndView dimensions(HttpServletRequest request,HttpSession session)
	{
		ModelAndView mv=new ModelAndView("addDimension");
		List<Dimension> d = null;
		try
		{
			d=(List<Dimension>)dimensionDao.Dimensions();
			mv.addObject("dimcount", d.size());
			mv.addObject("dims", d);
			System.out.println("dim controller good");
		}
		catch(NullPointerException npe)
		{
			System.out.println(npe+" caught in /admin/addDimension in DimensionController");
		}
		mv.addObject("Dimensions", new Dimension());
		return mv;
	}
	
	@RequestMapping(value = "/admin/addDimensions", method = RequestMethod.POST)
	public ModelAndView addDimensions(@ModelAttribute("Dimensions") @Valid Dimension d,BindingResult result,Model model) 
	{
		ModelAndView mv2 = new ModelAndView("addDimension");
		List<Dimension> d1 = null;
		try
		{
			d1=(List<Dimension>)dimensionDao.Dimensions();
			mv2.addObject("count", d1.size());
		}
		catch(NullPointerException npe)
		{
			System.out.println(npe+" caught in /admin/addDimensions in DimensionController");
		}
		
		mv2.addObject("dims", d1);
		
		if (result.hasErrors()) 
		{
			System.out.println(919);
			mv2.addObject("Dimensions", d);
			return mv2; 
		 
		} 
		else 
		{
			ModelAndView mv = new ModelAndView("redirect:/admin/addDimension");
			try 
			  {
				System.out.println(1413);
				dimensionDao.saveorupdate(d);
				return mv;
			    
			  } catch (Exception e) {
				  
			    	mv2.addObject("Dimensions", d);
			    	return mv2;
			}
		}
	}
	
	@RequestMapping(value = "/admin/editDimensions/{id}", method = RequestMethod.GET)
	public ModelAndView editDimensions(@PathVariable("id") String id)
	{
		System.out.println(113111);
		ModelAndView mv = new ModelAndView("addDimension");
		List<Dimension>d = null;
		try
		{
			d=(List<Dimension>)dimensionDao.Dimensions();
			mv.addObject("count", d.size());
		}
		catch(NullPointerException npe)
		{
			System.out.println(npe+" caught in /admin/editDimensions/{id} in DimensionController");
		}
		
		mv.addObject("dims", d);
		mv.addObject("Dimensions", dimensionDao.getDimensions(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/deleteDimensions/{id}", method = RequestMethod.GET)
	public ModelAndView deleteDimensions(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("redirect:/admin/addDimension");
		Dimension cyyy=dimensionDao.getDimensions(id);
		dimensionDao.delete(cyyy);
		return mv;
	}

}
