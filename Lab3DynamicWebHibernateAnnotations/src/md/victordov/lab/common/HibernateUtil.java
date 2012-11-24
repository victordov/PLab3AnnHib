package md.victordov.lab.common;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * 
 * @author VictorDov HibernateUtil - creates and manages sessions. Pattern:
 *         Singleton & Abstract Factory
 */
public class HibernateUtil {

	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;

	static {
		try {
			Configuration configuration = new Configuration();
			configuration.configure();

			serviceRegistry = new ServiceRegistryBuilder().applySettings(
					configuration.getProperties()).buildServiceRegistry();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		} catch (HibernateException he) {
			throw he;
		}

	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static Session beginTransaction() {
		Session hibernateSession = HibernateUtil.getSession();
		hibernateSession.beginTransaction();
		return hibernateSession;
	}

	public static void commitTransaction() {
		HibernateUtil.getSession().getTransaction().commit();
	}

	public static void rollbackTransaction() {
		HibernateUtil.getSession().getTransaction().rollback();
	}

	public static void closeSession() {
		HibernateUtil.getSession().close();
	}

	public static Session getSession() {
		Session hibernateSession = sessionFactory.getCurrentSession();
		return hibernateSession;
	}
}