package md.victordov.lab.view.model;

public class StudentModel implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	public StudentModel(){
		
	}
	
	public Integer getSId() {
		return SId;
	}
	public void setSId(Integer sId) {
		SId = sId;
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
	public String getGrupa() {
		return grupa;
	}
	public void setGrupa(String grupa) {
		this.grupa = grupa;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelFix() {
		return telFix;
	}
	public void setTelFix(String telFix) {
		this.telFix = telFix;
	}
	private Integer SId;
	private String nume;
	private String prenume;
	private String grupa;
	private String email;
	private String telFix;

}
