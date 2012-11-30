package md.victordov.lab.services;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.CursDAO;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.view.model.CursModel;
import md.victordov.lab.vo.Curs;
import md.victordov.lab.vo.Profesor;
import md.victordov.lab.vo.Universitate;

public class CursService implements Serializable,
		GenericService<CursModel, Curs> {

	/**
	 * @author victor dovgaliuc Curs. @ Service handles all DAO request but
	 *         returns and receives different object CursModel object
	 */
	private static final long serialVersionUID = 1L;

	public CursService() {

	}

	@Override
	public List<CursModel> retrieve() throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();
		List<Curs> cursList = new ArrayList<Curs>(genDao.retrieve());
		List<CursModel> cursModelList = new ArrayList<CursModel>(
				this.transformList(cursList));
		return cursModelList;
	}

	@Override
	public List<CursModel> retrieve(int start, int maxRecords)
			throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();
		List<Curs> cursList = new ArrayList<Curs>(genDao.retrieve(start,
				maxRecords));
		List<CursModel> cursModelList = new ArrayList<CursModel>(
				this.transformList(cursList));
		return cursModelList;
	}

	@Override
	public CursModel retrieve(int id) throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();
		CursModel cursModel = this.transform(genDao.retrieve(id));

		return cursModel;
	}

	@Override
	public void create(CursModel t) throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();
		Curs curs = new Curs();
		curs = this.transformBack(t);
		genDao.create(curs);
	}

	@Override
	public void update(CursModel t) throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();
		Curs curs = new Curs();
		curs = this.transformBack(t);
		genDao.update(curs);

	}

	@Override
	public void delete(int id) throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();
		genDao.delete(id);

	}

	@Override
	public Long countSize() throws MyDaoException {
		GenericDAO<Curs> genDao = new CursDAO();

		return genDao.countSize();
	}

	@Override
	public List<CursModel> transformList(List<Curs> r) {
		List<CursModel> cursModelList = new ArrayList<CursModel>();
		for (Curs c : r) {
			CursModel cursModelTemp = new CursModel();
			cursModelTemp.setcId(c.getCId());
			cursModelTemp.setNumeCurs(c.getNumeCurs());
			cursModelTemp.setuId(c.getUniversitate().getUId());
			cursModelTemp.setUniverNume(c.getUniversitate().getNumeUniver());
			cursModelTemp.setpId(c.getProfesor().getPId());
			cursModelTemp.setProfesorNume(c.getProfesor().getNume() + " "
					+ c.getProfesor().getPrenume());
			cursModelList.add(cursModelTemp);
		}
		return cursModelList;
	}

	@Override
	public CursModel transform(Curs c) {
		CursModel cursModel = new CursModel();
		cursModel.setcId(c.getCId());
		cursModel.setNumeCurs(c.getNumeCurs());
		cursModel.setuId(c.getUniversitate().getUId());
		cursModel.setUniverNume(c.getUniversitate().getNumeUniver());
		cursModel.setpId(c.getProfesor().getPId());
		cursModel.setProfesorNume(c.getProfesor().getNume() + " "
				+ c.getProfesor().getPrenume());

		return cursModel;
	}

	@Override
	public Curs transformBack(CursModel t) {
		Curs curs = new Curs();
		Profesor profesor = new Profesor();
		Universitate univ = new Universitate();
		
		curs.setCId(t.getcId());
		curs.setNumeCurs(t.getNumeCurs());
		
		univ.setUId(t.getuId());
		curs.setUniversitate(univ);

		profesor.setPId(t.getpId());
		curs.setProfesor(profesor);

		return curs;
	}

}
