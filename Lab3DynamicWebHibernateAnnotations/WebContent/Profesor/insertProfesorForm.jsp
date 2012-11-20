<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Profesor Insert Form</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<form method="post" action="insertProfesorForm.jsp">
		<%
			GenericDAO<Profesor> genDao = new ProfesorDAO();
			Profesor prof = new Profesor();
			List<Profesor> listProf;
			listProf = genDao.retrieve();
		%>
		<table>
			<caption>Profesor Insert</caption>
			<tr>
				<th>ID</th>
				<th>Nume</th>
				<th>Prenume</th>
				<th>Adresa</th>
			</tr>
			<tr>
				<td><input type="text" name="id"
					value="<%=genDao.retrieve().size() + 1%>"></td>
				<td><input type="text" placeholder="Nume" name="Nume" value=""></td>
				<td><input type="text" placeholder="Prenume" name="Prenume" value=""></td>
				<td><input type="text" placeholder="Adresa" name="Adresa" value=""></td>
			</tr>
			<tr>
				<td><input type="submit" name="Submit" value="Insert"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
			</tr>

		</table>
	</form>

	<!-- Insert form funcition -->
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& request.getParameter("id") != null
				&& (request.getParameter("Nume") != null)
				&& (request.getParameter("Prenume") != null)
				&& (request.getParameter("Adresa") != null)) {

			String idProfesorString = request.getParameter("id");
			Integer idProfesor = Integer.parseInt(idProfesorString);

			String numeProfesor = request.getParameter("Nume");
			String prenumeProfesor = request.getParameter("Prenume");
			String adresaProfesor = request.getParameter("Adresa");

			prof.setPId(idProfesor);
			prof.setNume(numeProfesor);
			prof.setPrenume(prenumeProfesor);
			prof.setAdresa(adresaProfesor);
			genDao.create(prof);

		}
	%>
	<a href="<%=request.getContextPath()%>/Profesor/ProfesorJSP.jsp">Apasa
		aici: <strong>Profesor</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>