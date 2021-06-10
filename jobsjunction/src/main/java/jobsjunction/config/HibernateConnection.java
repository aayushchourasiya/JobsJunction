package jobsjunction.config;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.NonUniqueObjectException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.web.servlet.ModelAndView;

import jobsjunction.userclass.User;

public class HibernateConnection {
	public static int userExists = 0;
	public HibernateConnection(String name, String email, String gender, String qualificaton, String password) {
		
		Configuration con = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class);
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		
		User user = new User();
		try {
			User userCheck = (User) session.get(User.class, email);
			user.setName(name);
			user.setEmail(email);
			user.setGender(gender);
			user.setQualification(qualificaton);
			user.setPassword(password);
			session.save(user);
		}catch(NullPointerException e) {
	
		}catch (NonUniqueObjectException e2) {
			userExists = 1;
		}
		tx.commit();
	}
}
