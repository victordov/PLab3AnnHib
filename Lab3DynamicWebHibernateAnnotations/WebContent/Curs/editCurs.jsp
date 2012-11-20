<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<html>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Curs Edit</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<div id="wrapper">
		<form method="post" action="editCurs.jsp">
			<%
				GenericDAO<Curs> genDao = new CursDAO();
				Curs curs = new Curs();
				String id = "0";
				try {
					id = request.getParameter("id");
				} catch (NumberFormatException e) {
					id = "0";
				}

				Integer no = 0;
				try {
					no = Integer.parseInt(id);
				} catch (NumberFormatException e) {
					no = 0;
				}
				curs = genDao.retrieve(no);
			%>
			<br /> <br />
			<table>
				<caption>Curs Edit</caption>
				<thead>
					<tr>
						<th>Nume</th>
						<th>Prenume</th>
						<th>Adresa</th>
					</tr>
				</thead>
				<tr>
					<td><input type="text" name="Nume"
						value="<%=curs.getNumeCurs()%>"></td>
					<td><input type="text" name="UniverID"
						value="<%=curs.getUniversitate().getUId()%>"></td>
					<td><input type="text" name="ProfID"
						value="<%=curs.getProfesor().getPId()%>"></td>
					<td><input type="hidden" name="id" value="<%=no%>"></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit" value="Update"
						style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- Edit form function -->
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& request.getParameter("id") != null
				&& (request.getParameter("Nume") != null)
				&& (request.getParameter("UniverID") != null)
				&& (request.getParameter("ProfID") != null)) {
			String idCursString = request.getParameter("id");
			Integer idCurs = Integer.parseInt(idCursString);

			String numeCurs = request.getParameter("Nume");
			Integer univerID = Integer.parseInt(request
					.getParameter("UniverID"));
			Integer profID = Integer.parseInt(request
					.getParameter("ProfID"));

			Universitate tempUniv = new Universitate();
			tempUniv.setUId(univerID);
			Profesor tempProf = new Profesor();
			tempProf.setPId(profID);
			curs.setCId(idCurs);
			curs.setNumeCurs(numeCurs);
			curs.setUniversitate(tempUniv);
			curs.setProfesor(tempProf);
			genDao.update(curs);

		}
	%>
	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Apasa
		aici: Curs</a>
	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>