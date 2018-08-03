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
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value="/main.do")
	public String gomain() {
		return "main";
	}
	
	@RequestMapping(value="/login.do")
	public ModelAndView loginCheck(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO temp = new MemberDTO();
		temp.setId(req.getParameter("id"));
		temp.setPwd(req.getParameter("pwd"));
		MemberDTO dto = memdao.loginCheck(temp);
		ModelAndView mav = new ModelAndView();
		if(dto != null) {
			HttpSession session = req.getSession();
			session.setAttribute("dto", dto);
			mav.addObject("msg", "로그인 성공");
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
			mav.addObject("msg", "아이디 또는 비밀번호가 틀렸습니다. 인사과에 문의 바랍니다.");
			mav.addObject("goUrl", "index.do");
		}
		mav.setViewName("commons/globalMsg");
		return mav;
	}
	
}
