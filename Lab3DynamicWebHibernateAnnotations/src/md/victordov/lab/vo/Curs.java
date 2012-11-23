package md.victordov.lab.vo;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Curs generated by hbm2java
 */
@Entity
@Table(name = "curs", catalog = "uni2_4t")
public class Curs implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer CId;
	private Universitate universitate;
	private Profesor profesor;
	private String numeCurs;
	private Set<StudCurs> studCurses = new HashSet<StudCurs>(0);

	public Curs() {
	}

	public Curs(Universitate universitate, Profesor profesor, String numeCurs) {
		this.universitate = universitate;
		this.profesor = profesor;
		this.numeCurs = numeCurs;
	}

	public Curs(Universitate universitate, Profesor profesor, String numeCurs,
			Set<StudCurs> studCurses) {
		this.universitate = universitate;
		this.profesor = profesor;
		this.numeCurs = numeCurs;
		this.studCurses = studCurses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "c_id", unique = true, nullable = false)
	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "u_id", nullable = false)
	public Universitate getUniversitate() {
		return this.universitate;
	}

	public void setUniversitate(Universitate universitate) {
		this.universitate = universitate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "p_id", nullable = false)
	public Profesor getProfesor() {
		return this.profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

	@Column(name = "nume_curs", nullable = false, length = 30)
	public String getNumeCurs() {
		return this.numeCurs;
	}

	public void setNumeCurs(String numeCurs) {
		this.numeCurs = numeCurs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "curs")
	public Set<StudCurs> getStudCurses() {
		return this.studCurses;
	}

	public void setStudCurses(Set<StudCurs> studCurses) {
		this.studCurses = studCurses;
	}

}