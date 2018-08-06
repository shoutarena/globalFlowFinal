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

import com.member.model.junoflow.MemberDAO;
import com.member.model.junoflow.MemberDTO;

@Controller
public class HomeController {

	@Autowired
	private MemberDAO memdao;
	
	@RequestMapping(value = {"/", "/index.do"})
	public String home(Locale locale, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String goPage = "";
		if(session.getAttribute("user")!= null) {
			MemberDTO dto = (MemberDTO)session.getAttribute("user");
			if(dto.getGrade() == 0) {
				goPage = "admin/admin";
			}else {
				goPage = "main";
			}
		}else {
			goPage = "home";
		}
		return goPage;
	}
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}

	@RequestMapping(value="/main.do")
	public String gomain(HttpServletRequest req) {
		return "main";
	}
	
	@RequestMapping(value="/login.do")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO temp = new MemberDTO();
		String pwd = req.getParameter("pwd");
		temp.setId(req.getParameter("id"));
		temp.setPwd(pwd);
		MemberDTO dto = memdao.loginCheck(temp);
		ModelAndView mav = new ModelAndView();
		if(dto != null) {
			System.out.println(dto.getPwd());
			System.out.println(pwd);
			if(dto.getPwd().equals(pwd)) {
				HttpSession session = req.getSession();
				session.setAttribute("user", dto);
				if(dto.getGrade() == 0) {
					mav.addObject("goUrl", "admin.do");
				}else {
					mav.addObject("goUrl", "main.do");
				}
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
				mav.addObject("msg", "아이디 또는 비밀번호가 틀렸습니다. 인사과에 문의 바랍니다.");
				mav.addObject("goUrl", "index.do");
			}
		}else {
			mav.addObject("msg", "아이디 또는 비밀번호가 틀렸습니다. 인사과에 문의 바랍니다.");
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
	}
}
