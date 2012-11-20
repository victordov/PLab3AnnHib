package md.victordov.lab.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import md.victordov.lab.ListersUtils.HibernateUtil;
import md.victordov.lab.vo.*;

/**
 * Servlet implementation class CursJSP
 */
@WebServlet("/CursServlet")
public class CursServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CursServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Session session = HibernateUtil.getSessionFactory().openSession();
		String sql_query = "from StudCurs as sc inner join sc.student  inner join sc.curs ";
		Query query = session.createQuery(sql_query);
		out.println("<table align=\"center\">");
		for (Iterator it = query.iterate(); it.hasNext();) {
			out.println("<tr>");
			Object[] row = (Object[]) it.next();
			Student tmpStudent = new Student();
			tmpStudent = (Student) row[1];
			Curs tmpCurs = new Curs();
			tmpCurs = (Curs) row[2];
			out.println("<td>ID Student: " + tmpStudent.getSId()
					+ "</td>");
			out.println("<td>" + tmpStudent.getNume() + " "
					+ tmpStudent.getPrenume() + "</td>");
			out.println("<td>" + tmpCurs.getNumeCurs() + "</td>");
			out.println("<td>Id Curs:" + tmpCurs.getCId() + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
