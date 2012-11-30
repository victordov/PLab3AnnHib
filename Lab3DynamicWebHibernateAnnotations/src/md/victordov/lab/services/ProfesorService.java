package md.victordov.lab.services;

import java.util.ArrayList;
import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.dao.ProfesorDAO;
import md.victordov.lab.view.model.ProfesorModel;
import md.victordov.lab.vo.Profesor;

public class ProfesorService implements GenericService<ProfesorModel, Profesor> {

	@Override
	public List<ProfesorModel> retrieve() throws MyDaoException {

		GenericDAO<Profesor> gDao = new ProfesorDAO();
		return this.transformList(gDao.retrieve());
	}

	@Override
	public List<ProfesorModel> retrieve(int start, int maxRecords)
			throws MyDaoException {
		GenericDAO<Profesor> gDao = new ProfesorDAO();
		return this.transformList(gDao.retrieve(start, maxRecords));

	}

	@Override
	public ProfesorModel retrieve(int id) throws MyDaoException {
		GenericDAO<Profesor> gDao = new ProfesorDAO();
		return this.transform(gDao.retrieve(id));
	}

	@Override
	public void create(ProfesorModel t) throws MyDaoException {
		GenericDAO<Profesor> gDao = new ProfesorDAO();
		gDao.create(this.transformBack(t));

	}

	@Override
	public void update(ProfesorModel t) throws MyDaoException {
		GenericDAO<Profesor> gDao = new ProfesorDAO();
		gDao.update(this.transformBack(t));
	}

	@Override
	public void delete(int id) throws MyDaoException {
		GenericDAO<Profesor> gDao = new ProfesorDAO();
		gDao.delete(id);
	}

	@Override
	public Long countSize() throws MyDaoException {
		GenericDAO<Profesor> gDao = new ProfesorDAO();
		return gDao.countSize();
	}

	@Override
	public List<ProfesorModel> transformList(List<Profesor> r) {
		List<ProfesorModel> profesorModelList = new ArrayList<ProfesorModel>();
		for (Profesor p : r) {
			ProfesorModel profesorModelTemp = new ProfesorModel();
			profesorModelTemp.setPId(p.getPId());
			profesorModelTemp.setNume(p.getNume());
			profesorModelTemp.setPrenume(p.getPrenume());
			profesorModelTemp.setAdresa(p.getAdresa());

			profesorModelList.add(profesorModelTemp);
		}
		return profesorModelList;
	}

	@Override
	public ProfesorModel transform(Profesor p) {
		ProfesorModel profesorModel = new ProfesorModel();
		profesorModel.setPId(p.getPId());
		profesorModel.setNume(p.getNume());
		profesorModel.setPrenume(p.getPrenume());
		profesorModel.setAdresa(p.getAdresa());

		return profesorModel;
	}

	@Override
	public Profesor transformBack(ProfesorModel t) {
		Profesor profesor = new Profesor();
		profesor.setPId(t.getPId());
		profesor.setNume(t.getNume());
		profesor.setPrenume(t.getPrenume());
		profesor.setAdresa(t.getAdresa());
		return profesor;
	}

}
