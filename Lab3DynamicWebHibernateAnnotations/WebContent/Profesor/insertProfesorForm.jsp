<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Profesor Insert Form</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />
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
				<th>Nume</th>
				<th>Prenume</th>
				<th>Adresa</th>
			</tr>
			<tr>
				<td><input type="text" name="Nume" value=""></td>
				<td><input type="text" name="Prenume" value=""></td>
				<td><input type="text" name="Adresa" value=""></td>
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
				&& (request.getParameter("Nume") != null)
				&& (request.getParameter("Prenume") != null)
				&& (request.getParameter("Adresa") != null)) {

			String numeProfesor = request.getParameter("Nume");
			String prenumeProfesor = request.getParameter("Prenume");
			String adresaProfesor = request.getParameter("Adresa");

			prof.setNume(numeProfesor);
			prof.setPrenume(prenumeProfesor);
			prof.setAdresa(adresaProfesor);
			genDao.create(prof);

		}
	%>
	Apasa aici:
	<a href="<%=request.getContextPath()%>/Profesor/ProfesorJSP.jsp"><strong>Profesor</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>