package md.victordov.lab.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import md.victordov.lab.ListersUtils.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.vo.Profesor;

public class ProfesorDAO implements Serializable, GenericDAO<Profesor> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Session session;

	public List<Profesor> retrieve() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		List<Profesor> list = null;
		try {
			list = (List<Profesor>) session.createQuery("from Profesor").list();
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
		} finally {
			session.close();
		}

		return list;

	}

	@Override
	public Profesor retrieve(int id) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		try {
			Profesor instance = (Profesor) session.get(Profesor.class, id);
			if (instance == null) {
				System.out.println("get successful, no instance found");
			} else {
				System.out.println("get successful, instance found");
			}
			return instance;
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_ERR_KEY, he);
		} catch (RuntimeException re) {
			System.out.println("get failed");
			re.printStackTrace();
			throw re;
		} finally {
			session.close();
		}

	}

	public void create(Profesor t) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.save(t);
		tx.commit();

	}

	public void update(Profesor t) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(t);
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.UPDATE_ERR_KEY, he);
		} finally {
			session.close();
		}

	}

	public void delete(int id) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Profesor p;
		try {
			p = (Profesor) session.get(Profesor.class, id);
			session.delete(p);
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.DELETE_ERR_KEY, he);
		} finally {
			session.close();
		}

	}

	@Override
	public List<Profesor> retrieve(int start, int maxRecords)
			throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Criteria crit = session.createCriteria(Profesor.class);
		int pageIndex = start;
		int numberOfRecordsPerPage = maxRecords;
		int s;
		s = (pageIndex * numberOfRecordsPerPage) - numberOfRecordsPerPage;
		crit.setFirstResult(s);
		crit.setMaxResults(numberOfRecordsPerPage);

		List<Profesor> list = null;
		try {
			list = (List<Profesor>) (List<Profesor>) crit.list();
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Long countSize() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Long count = ((Long) session
				.createQuery("select count(*) from Profesor as prof").iterate()
				.next()).longValue();
		tx.commit();
		return count;
	}

}
