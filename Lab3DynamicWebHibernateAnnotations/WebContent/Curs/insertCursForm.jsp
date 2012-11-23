<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<html>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Curs Insert Form</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />

	<form method="post" action="insertCursForm.jsp">
		<%
			GenericDAO<Curs> genDao = new CursDAO();
			Curs curs = new Curs();
			List<Curs> arrayCurs;
			arrayCurs = genDao.retrieve();
		%>
		<table>
			<caption>Curs Insert</caption>
			<tr>
				<th>Nume</th>
				<th>Univer ID</th>
				<th>Prof ID</th>
			</tr>
			<tr>
				<td><input type="text" name="Nume" value="" placeholder="Nume"></td>
				<td><input type="text" name="UniverID" value="" placeholder="Univer Id"></td>
				<td><input type="text" name="ProfID" value="" placeholder="Profesor Id"></td>
			</tr>
			<tr>
				<td><input type="submit" name="Submit" value="Insert"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
			</tr>

		</table>
	</form>

	<!-- Edit form function -->
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())

		&& (request.getParameter("Nume") != null)
				&& (request.getParameter("UniverID") != null)
				&& (request.getParameter("ProfID") != null)) {

			String numeCurs = request.getParameter("Nume");
			Integer univerID = Integer.parseInt(request
					.getParameter("UniverID"));
			Integer profID = Integer.parseInt(request
					.getParameter("ProfID"));

			Universitate universitate = new Universitate();
			universitate.setUId(univerID);

			Profesor profesor = new Profesor();
			profesor.setPId(profID);

			curs.setNumeCurs(numeCurs);
			curs.setUniversitate(universitate);
			curs.setProfesor(profesor);
			genDao.create(curs);
		}
	%>
	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Click
		here: Curs</a>
	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>