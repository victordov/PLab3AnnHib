package md.victordov.lab.view.model;

public class UniversitateModel implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	public UniversitateModel(){
		
	}

	public Integer getUId() {
		return UId;
	}

	public void setUId(Integer uId) {
		UId = uId;
	}

	public String getNumeUniver() {
		return numeUniver;
	}

	public void setNumeUniver(String numeUniver) {
		this.numeUniver = numeUniver;
	}

	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	private Integer UId;
	private String numeUniver;
	private String adresa;
	private String telefon;

}
