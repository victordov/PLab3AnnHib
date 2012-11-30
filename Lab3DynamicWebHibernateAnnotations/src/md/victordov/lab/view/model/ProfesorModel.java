package md.victordov.lab.view.model;

public class ProfesorModel implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	public ProfesorModel(){
		
	}

	public Integer getPId() {
		return PId;
	}

	public void setPId(Integer pId) {
		PId = pId;
	}

	public String getNume() {
		return nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}

	public String getPrenume() {
		return prenume;
	}

	public void setPrenume(String prenume) {
		this.prenume = prenume;
	}

	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	private Integer PId;
	private String nume;
	private String prenume;
	private String adresa;

}
