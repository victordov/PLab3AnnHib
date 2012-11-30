<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.UniversitateService"%>
<%@ page import="md.victordov.lab.view.model.UniversitateModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<!-- Edit Universitate is a jsp page that edits the record of the Universitate table
in case that the user will try to access the page through the get method a black page will be displayed -->
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Universitate Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("idUniversitate") != null)) {
	%>
	<form method="post" action="editUniv.jsp">
		<%
			GenericService<UniversitateModel, Universitate> genService = new UniversitateService();
				UniversitateModel univModel = new UniversitateModel();
				String id = request.getParameter("idUniversitate");
				Integer no = Integer.parseInt(id);
				univModel = genService.retrieve(no);
		%>
		<table>
			<tr>
				<th>Denumire</th>
				<th>Adresa</th>
				<th>Telefon</th>
			</tr>
			<tr>
				<td><input type="text" name="Denumire"
					value="<%=univModel.getNumeUniver()%>"></td>
				<td><input type="text" name="Adresa"
					value="<%=univModel.getAdresa()%>"></td>
				<td><input type="text" name="Telefon"
					value="<%=univModel.getTelefon()%>"></td>
				<td><input type="hidden" name="idUniversitate" value="<%=no%>"></td>
			</tr>
			<tr>
				<td><input type="submit" name="Submit" value="Update"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
			</tr>

		</table>
	</form>

	<!-- All fields are checked if not null to avoid black data to be inserted in the table Unviersitate -->
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
					&& request.getParameter("idUniversitate") != null
					&& (request.getParameter("Denumire") != null)
					&& (request.getParameter("Adresa") != null)
					&& (request.getParameter("Telefon") != null)) {
				String idUniverString = request
						.getParameter("idUniversitate");
				Integer idUniversitate = Integer.parseInt(idUniverString);

				String denumUniver = request.getParameter("Denumire");
				String adresaUniver = request.getParameter("Adresa");
				String telefonUniver = request.getParameter("Telefon");

				univModel.setUId(idUniversitate);
				univModel.setNumeUniver(denumUniver);
				univModel.setAdresa(adresaUniver);
				univModel.setTelefon(telefonUniver);
				genService.update(univModel);
			}
		}
	%>

	<a href="<%=request.getContextPath()%>/Universitate/UnivJSP.jsp">Click
		here: <strong>Universitate</strong>
	</a>

	<%@ include file="/footerJSP.jsp"%>