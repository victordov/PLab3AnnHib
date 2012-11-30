<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.ProfesorService"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="md.victordov.lab.view.model.ProfesorModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Profesor Edit</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("id") != null)) {
	%>
	<div id="wrapper">
		<form method="post" action="editProfesor.jsp">
			<%
				GenericService<ProfesorModel, Profesor> genService = new ProfesorService();
					ProfesorModel profesorModel = new ProfesorModel();
					Integer id = 0;
					try {
						id = Integer.parseInt(request.getParameter("id"));
					} catch (NumberFormatException e) {
					}
					profesorModel = genService.retrieve(id);
			%>
			<br /> <br />
			<table>
				<caption>Profesor Edit</caption>
				<tr>
					<th>Nume</th>
					<th>Prenume</th>
					<th>Adresa</th>
				</tr>
				<tr>
					<td><input type="text" name="Nume"
						value="<%=profesorModel.getNume()%>"></td>
					<td><input type="text" name="Prenume"
						value="<%=profesorModel.getPrenume()%>"></td>
					<td><input type="text" name="Adresa"
						value="<%=profesorModel.getAdresa()%>"></td>
					<td><input type="hidden" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit" value="Update"
						style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- Edit Function -->
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

				profesorModel.setPId(idProfesor);
				profesorModel.setNume(numeProfesor);
				profesorModel.setPrenume(prenumeProfesor);
				profesorModel.setAdresa(adresaProfesor);
				genService.update(profesorModel);

			}
		}
	%>
	<a href="<%=request.getContextPath()%>/Profesor/ProfesorJSP.jsp">Apasa
		aici: <strong>Profesor</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>