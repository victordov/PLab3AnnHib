package md.victordov.lab.services;

import java.util.ArrayList;
import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.dao.UnivDAO;
import md.victordov.lab.view.model.UniversitateModel;
import md.victordov.lab.vo.Universitate;

public class UniversitateService implements
		GenericService<UniversitateModel, Universitate> {

	@Override
	public List<UniversitateModel> retrieve() throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		return this.transformList(gDao.retrieve());
	}

	@Override
	public List<UniversitateModel> retrieve(int start, int maxRecords)
			throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		return this.transformList(gDao.retrieve(start, maxRecords));
	}

	@Override
	public UniversitateModel retrieve(int id) throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		return this.transform(gDao.retrieve(id));
	}

	@Override
	public void create(UniversitateModel t) throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		gDao.create(this.transformBack(t));

	}

	@Override
	public void update(UniversitateModel t) throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		gDao.update(this.transformBack(t));

	}

	@Override
	public void delete(int id) throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		gDao.delete(id);

	}

	@Override
	public Long countSize() throws MyDaoException {
		GenericDAO<Universitate> gDao = new UnivDAO();
		
		return gDao.countSize();
	}

	@Override
	public List<UniversitateModel> transformList(List<Universitate> univ) {
		List<UniversitateModel> univerModelList = new ArrayList<UniversitateModel>();
		for (Universitate u : univ) {
			UniversitateModel univModelTemp = new UniversitateModel();
			univModelTemp.setUId(u.getUId());
			univModelTemp.setNumeUniver(u.getNumeUniver());
			univModelTemp.setAdresa(u.getAdresa());
			univModelTemp.setTelefon(u.getTelefon());
			univerModelList.add(univModelTemp);
		}
		return univerModelList;
	}

	@Override
	public UniversitateModel transform(Universitate u) {
		UniversitateModel univModel = new UniversitateModel();
		univModel.setUId(u.getUId());
		univModel.setNumeUniver(u.getNumeUniver());
		univModel.setAdresa(u.getAdresa());
		univModel.setTelefon(u.getTelefon());
		return univModel;
	}

	@Override
	public Universitate transformBack(UniversitateModel t) {
		Universitate universitate = new Universitate();
		universitate.setUId(t.getUId());
		universitate.setNumeUniver(t.getNumeUniver());
		universitate.setAdresa(t.getAdresa());
		universitate.setTelefon(t.getTelefon());

		return universitate;
	}

}
