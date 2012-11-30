package md.victordov.lab.view.model;

public class StudCursModel implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	public StudCursModel() {

	}

	public Integer getScId() {
		return scId;
	}

	public void setScId(Integer scId) {
		this.scId = scId;
	}

	public Integer getCursId() {
		return cursId;
	}

	public void setCursId(Integer cursId) {
		this.cursId = cursId;
	}

	public String getCursNume() {
		return cursNume;
	}

	public void setCursNume(String cursNume) {
		this.cursNume = cursNume;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getStudentNume() {
		return studentNume;
	}

	public void setStudentNume(String studentNume) {
		this.studentNume = studentNume;
	}

	private Integer scId;
	private Integer cursId;
	private String cursNume;
	private Integer studentId;
	private String studentNume;

}
