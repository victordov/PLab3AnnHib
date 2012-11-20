package md.victordov.lab.dao;

import java.io.Serializable;
import java.util.List;

import md.victordov.lab.ListersUtils.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.vo.Universitate;
import md.victordov.lab.vo.Universitate;
import md.victordov.lab.vo.Universitate;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;

public class UnivDAO implements GenericDAO<Universitate>, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Session session;

	/**
	 * @author victor Clasa UnivDAO - Universitate Data Access Object, classa
	 *         destinata sa faca legatura dintre baza de date si utilizator
	 *         gestionind clasa Universitate Executa 4 tipuri de functii CRUD
	 */

	public UnivDAO() {

	}

	public List<Universitate> retrieve() throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		List<Universitate> list = null;
		try {
			list = (List<Universitate>) session
					.createQuery("from Universitate").list();

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

	public Universitate retrieve(int id) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Universitate instance = null;
		try {
			instance = (Universitate) session.get(Universitate.class, id);
			if (instance == null) {
				System.out.println("get successful, no instance found");
			} else {
				System.out.println("get successful, instance found");
			}

		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_ERR_KEY, he);
		} finally {
			session.close();
		}
		return instance;

	}

	public void create(Universitate t) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(t);
			tx.commit();

		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.CREATE_ERR_KEY, he);
		} finally {
			session.close();
		}

	}

	public void update(Universitate t) throws MyDaoException {

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
		Universitate p;
		try {
			p = (Universitate) session.get(Universitate.class, id);
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
	public List<Universitate> retrieve(int start, int maxRecords)
			throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Criteria crit = session.createCriteria(Universitate.class);
		int pageIndex = start;
		int numberOfRecordsPerPage = maxRecords;
		int s;
		s = (pageIndex * numberOfRecordsPerPage) - numberOfRecordsPerPage;
		crit.setFirstResult(s);
		crit.setMaxResults(numberOfRecordsPerPage);

		List<Universitate> list = null;
		try {
			list = (List<Universitate>) (List<Universitate>) crit.list();
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
				.createQuery("select count(*) from Universitate as univ")
				.iterate().next()).longValue();
		tx.commit();
		return count;
	}

}
