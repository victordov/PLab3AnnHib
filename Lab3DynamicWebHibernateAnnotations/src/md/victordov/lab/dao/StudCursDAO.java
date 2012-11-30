package md.victordov.lab.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.vo.StudCurs;

public class StudCursDAO implements Serializable, GenericDAO<StudCurs> {

	/**
	 * @author VictorDov
	 * 
	 *         DAO class StudCurs manages the StudCurs objects ( creates, reads
	 *         one or all or predefined number, updates, deletes, counts the
	 *         number of records.
	 */
	private static final long serialVersionUID = 1L;

	private Session session;

	@Override
	public List<StudCurs> retrieve() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		List<StudCurs> list = null;
		try {
			list = (List<StudCurs>) session.createQuery("from StudCurs").list();
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
	public List<StudCurs> retrieve(int start, int maxRecords)
			throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Query q = session
				.createQuery("from StudCurs as sc ");
		int pageIndex = start;
		int numberOfRecordsPerPage = maxRecords;
		int s;
		s = (pageIndex * numberOfRecordsPerPage) - numberOfRecordsPerPage;
		q.setFirstResult(s);
		q.setMaxResults(numberOfRecordsPerPage);

		List<StudCurs> list = null;
		try {
			list = (List<StudCurs>) (List<StudCurs>) q.list();
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
	public StudCurs retrieve(int id) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		try {
			StudCurs instance = (StudCurs) session.get(StudCurs.class, id);
			if (instance == null) {

			} else {

			}
			return instance;
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_ERR_KEY, he);
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		} finally {
			session.close();
		}
	}

	@Override
	public void create(StudCurs t) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.save(t);
		tx.commit();

	}

	@Override
	public void update(StudCurs t) throws MyDaoException {

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

	@Override
	public void delete(int id) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		StudCurs p;
		try {
			p = (StudCurs) session.get(StudCurs.class, id);
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
	public Long countSize() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Long count = ((Long) session
				.createQuery("select count(*) from StudCurs as studentStudCurs")
				.iterate().next()).longValue();
		tx.commit();
		return count;
	}

}
