package com.contoller.junoflow;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.junoFlow.commons.GetCalendar;
import com.junoFlow.commons.SelectDateModule;
import com.member.model.junoflow.MemberDAO;
import com.member.model.junoflow.MemberDTO;

@Controller
public class HomeController {

	/*@Autowired
	private MemberDAO memdao;*/
	
	@RequestMapping(value = {"/", "/index.do", "/main.do"})
	public ModelAndView home(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String goPage = "";
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("user")!= null) {
			goPage = "main";
		}else {
			mav.addObject("selectDate", SelectDateModule.getSelectDate());
			goPage = "home";
		}
		
		
		mav.addObject("includPage", "main/writeForm.jsp");
		mav.setViewName(goPage);
		return mav;
	}
	
	/*@RequestMapping(value="/login.do")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO temp = new MemberDTO();
		String pwd = req.getParameter("pwd");
		temp.setId(req.getParameter("id"));
		temp.setPwd(pwd);
		MemberDTO dto = memdao.loginCheck(temp);
		ModelAndView mav = new ModelAndView();
		if(dto != null) {
			if(dto.getPwd().equals(pwd)) {
				HttpSession session = req.getSession();
				session.setAttribute("user", dto);
				mav.addObject("goUrl", "main.do");
				if(req.getParameter("rememId") != null) {
					Cookie ck = new Cookie("saveid", dto.getId());
					ck.setMaxAge(60*24*365);
					resp.addCookie(ck);
				}else {
					Cookie ck = new Cookie("saveid", dto.getId());
					ck.setMaxAge(0);
					resp.addCookie(ck);
				}
			}else {
				mav.addObject("msg", "�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎. �씤�궗怨쇱뿉 臾몄쓽 諛붾엻�땲�떎.");
				mav.addObject("goUrl", "index.do");
			}
		}else {
			mav.addObject("msg", "�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎. �씤�궗怨쇱뿉 臾몄쓽 諛붾엻�땲�떎.");
			mav.addObject("goUrl", "index.do");
		}
		mav.setViewName("commons/globalMsg");
		return mav;
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "home";
	}*/
}
