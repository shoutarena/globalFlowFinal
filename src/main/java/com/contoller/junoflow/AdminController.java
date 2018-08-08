package com.contoller.junoflow;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@RequestMapping(value="/admin.do")
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("includPage", "admin/admin.jsp");
		mav.setViewName("main");
		return mav;
	}
	
}
