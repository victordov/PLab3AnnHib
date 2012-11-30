package md.victordov.lab.view.model;

public class CursModel {

	public CursModel() {

	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getNumeCurs() {
		return numeCurs;
	}

	public void setNumeCurs(String numeCurs) {
		this.numeCurs = numeCurs;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getUniverNume() {
		return univerNume;
	}

	public void setUniverNume(String univerNume) {
		this.univerNume = univerNume;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getProfesorNume() {
		return profesorNume;
	}

	public void setProfesorNume(String profesorNume) {
		this.profesorNume = profesorNume;
	}

	private int cId; // Curs Id
	private String numeCurs; // Denumirea cursului
	private int uId; // Universitate Id
	private String univerNume;
	private int pId; // Profesor Id
	private String profesorNume;

}
