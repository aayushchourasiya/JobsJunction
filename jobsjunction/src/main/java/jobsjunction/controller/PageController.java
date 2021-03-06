package jobsjunction.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jobsjunction.config.CheckUserPassword;
import jobsjunction.config.HibernateConnection;
import jobsjunction.userclass.User;


@Controller
public class PageController {
	//Home page mapping
	@RequestMapping("/")
	public String indexPage() {
		return "index";
	}
	//Login page mapping
	@RequestMapping("loginPage")
	public String loginPage() {
		return "login";
	}
	//Registration page mapping
	@RequestMapping("registrationPage")
	public String registrationPage() {
		return "registration";
	}
	//Checking and Saving to database
	@RequestMapping("registerUser")
	public ModelAndView add(@RequestParam("name") String name,@RequestParam("email")String email, @RequestParam("gender") String gender, @RequestParam("qualification") String qualification, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		HibernateConnection connection = new HibernateConnection(name, email, gender, qualification, password);
//		mv.addObject("result",answer);
		if(HibernateConnection.userExists == 1) {
			mv.addObject("namePassingToJsp", name);
			mv.addObject("emailPassingToJsp", email);
			mv.setViewName("alreadyExists");
			HibernateConnection.userExists = 0;
		}
		else {
			mv.setViewName("registerSuccess");
		}
		return mv;
	}
	//If user exists already 
	@RequestMapping("alreadyExists")
	public String tryAgain() {
		return "alreadyExists";
	}
	//If registration is successfull
	@RequestMapping("registerSuccess")
	public String registerSuccess() {
		return "registerSuccess";
	}
	//Login into user profile
	@RequestMapping("login")
	public ModelAndView afterLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		try {
			
			//Using try block because if user directly type login on url, he will get error because there will
			//be no value in emailTag, so the user will be transferred to loginPage!
			
			String emailCheck = request.getParameter("emailTag");
			String passCheck = request.getParameter("passTag");
		
			ModelAndView mv2 = new ModelAndView();
			CheckUserPassword checkUserPassword = new CheckUserPassword(emailCheck, passCheck);
			if(checkUserPassword.emailNotExists == 1) {
				mv2.setViewName("emailWrong");
				checkUserPassword.emailNotExists = 0;
			}
			else {
				if(checkUserPassword.userpassword == 1) {
				
					Configuration con = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class);
					SessionFactory sf = con.buildSessionFactory();
					Session session = sf.openSession();
					Transaction tx = session.beginTransaction();
					
					User user = (User) session.get(User.class, emailCheck);
					HttpSession newSession = request.getSession();
					newSession.setAttribute("username", user.getName());
				
					mv2.setViewName("loginSuccess");
				
					checkUserPassword.userpassword = 0;
				}
				else{
					mv2.addObject("emailShowAfterError", emailCheck);
					mv2.setViewName("wrongPassword");
				}
			}
			return mv2;
		}catch (IllegalArgumentException ilx) {
				response.sendRedirect("loginPage");
				return new ModelAndView();
		}
	}	
	
	@RequestMapping("logoutPage")
	public String logOutMapper() {
		return "logoutPage";
	}
	
	@RequestMapping("notAvailable")
	public String notAvailable() {
		return "notAvailablePage";
	}
	@RequestMapping("loginSuccess")
	public String loginSuccess() {
		return "loginSuccess";
	}
}
