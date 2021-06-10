package jobsjunction.config;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jobsjunction.userclass.User;

public class CheckUserPassword {
	public static int userpassword = 0;
	public static int emailNotExists = 0;
	public CheckUserPassword(String emailCheck, String passCheck) {
		Configuration con = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class);
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		User user;
		try {
			user = (User) session.get(User.class, emailCheck);
			String password = user.getPassword();
			if(password.equals(passCheck)) {
				userpassword = 1;
			}
		}catch(NullPointerException n) {
			emailNotExists = 1;
		}
		tx.commit();
	}
}
