package md.victordov.lab.services;

import java.util.ArrayList;
import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.dao.StudentDAO;
import md.victordov.lab.view.model.StudentModel;
import md.victordov.lab.vo.Student;

public class StudentService implements GenericService<StudentModel, Student> {

	@Override
	public List<StudentModel> retrieve() throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();

		return this.transformList(gDao.retrieve());
	}

	@Override
	public List<StudentModel> retrieve(int start, int maxRecords)
			throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();

		return this.transformList(gDao.retrieve(start, maxRecords));
	}

	@Override
	public StudentModel retrieve(int id) throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();
		return this.transform(gDao.retrieve(id));
	}

	@Override
	public void create(StudentModel t) throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();
		gDao.create(this.transformBack(t));

	}

	@Override
	public void update(StudentModel t) throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();
		gDao.update(this.transformBack(t));

	}

	@Override
	public void delete(int id) throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();
		gDao.delete(id);

	}

	@Override
	public Long countSize() throws MyDaoException {
		GenericDAO<Student> gDao = new StudentDAO();
		return gDao.countSize();
	}

	@Override
	public List<StudentModel> transformList(List<Student> r) {
		List<StudentModel> studentModelList = new ArrayList<StudentModel>();
		for (Student s : r) {
			StudentModel studentModelTemp = new StudentModel();
			studentModelTemp.setSId(s.getSId());
			studentModelTemp.setNume(s.getNume());
			studentModelTemp.setPrenume(s.getPrenume());
			studentModelTemp.setGrupa(s.getGrupa());
			studentModelTemp.setEmail(s.getEmail());
			studentModelTemp.setTelFix(s.getTelFix());

			studentModelList.add(studentModelTemp);
		}
		return studentModelList;
	}

	@Override
	public StudentModel transform(Student s) {

		StudentModel studentModel = new StudentModel();
		studentModel.setSId(s.getSId());
		studentModel.setNume(s.getNume());
		studentModel.setPrenume(s.getPrenume());
		studentModel.setGrupa(s.getGrupa());
		studentModel.setEmail(s.getEmail());
		studentModel.setTelFix(s.getTelFix());

		return studentModel;
	}

	@Override
	public Student transformBack(StudentModel t) {
		Student student = new Student();
		student.setSId(t.getSId());
		student.setNume(t.getNume());
		student.setPrenume(t.getPrenume());
		student.setGrupa(t.getGrupa());
		student.setTelFix(t.getTelFix());

		return student;
	}
}
