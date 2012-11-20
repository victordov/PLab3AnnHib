package md.victordov.lab.dao;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;

public interface GenericDAO<T> {

	List<T> retrieve() throws MyDaoException;

	List<T> retrieve(int start, int maxRecords) throws MyDaoException;

	T retrieve(int id) throws MyDaoException;

	void create(T t) throws MyDaoException;

	void update(T t) throws MyDaoException;

	void delete(int id) throws MyDaoException;

	Long countSize() throws MyDaoException;

}
