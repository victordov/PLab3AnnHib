<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
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
				<th>ID</th>
				<th>Nume</th>
				<th>Univer ID</th>
				<th>Prof ID</th>
			</tr>
			<tr>
				<td><input type="text" name="id"
					value="<%=genDao.retrieve().size() + 1%>"></td>
				<td><input type="text" name="Nume" value=""></td>
				<td><input type="text" name="UniverID" value=""></td>
				<td><input type="text" name="ProfID" value=""></td>
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
			genDao.create(curs);
		}
	%>
	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Apasa
		aici: Curs</a>
	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>