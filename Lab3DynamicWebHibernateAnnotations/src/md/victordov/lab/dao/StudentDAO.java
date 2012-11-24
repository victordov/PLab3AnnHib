package md.victordov.lab.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.vo.Universitate;
import md.victordov.lab.vo.Student;

public class StudentDAO implements Serializable, GenericDAO<Student> {

	/**
	 * @author VictorDov
	 * 
	 *         DAO class Student manages the Student objects ( creates, reads
	 *         one or all or predefined number, updates, deletes, counts the
	 *         number of records.
	 */
	private static final long serialVersionUID = 1L;

	private Session session;

	public List<Student> retrieve() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		List<Student> listStudents = null;
		try {
			listStudents = (List<Student>) session.createQuery("from Student")
					.list();
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
		} finally {
			session.close();
		}

		return listStudents;

	}

	public Student retrieve(int id) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		try {
			Student instance = (Student) session.get(Student.class, id);
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

	public void create(Student t) throws MyDaoException {

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

	public void update(Student t) throws MyDaoException {

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
		Student p;
		try {
			p = (Student) session.get(Student.class, id);
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
	public List<Student> retrieve(int start, int maxRecords)
			throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Criteria crit = session.createCriteria(Student.class);
		int pageIndex = start;
		int numberOfRecordsPerPage = maxRecords;
		int s;
		s = (pageIndex * numberOfRecordsPerPage) - numberOfRecordsPerPage;
		crit.setFirstResult(s);
		crit.setMaxResults(numberOfRecordsPerPage);

		List<Student> list = null;
		try {
			list = (List<Student>) (List<Student>) crit.list();
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
				.createQuery("select count(*) from Student as stud").iterate()
				.next()).longValue();
		tx.commit();
		return count;
	}

}
