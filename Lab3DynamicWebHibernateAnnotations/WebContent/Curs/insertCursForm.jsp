<%@page import="md.victordov.lab.common.exception.MyDaoException"%>
<%@page import="md.victordov.lab.common.exception.ErrorList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<%@ page import="md.victordov.lab.common.exception.MyDaoException"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.CursService"%>
<%@ page import="md.victordov.lab.view.model.CursModel"%>
<!DOCTYPE html>
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
			GenericService<CursModel, Curs> gs = new CursService();
			CursModel cursModel = new CursModel();
			List<CursModel> arrayCurs;
			arrayCurs = gs.retrieve();
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
				<td><input type="text" name="UniverID" value=""
					placeholder="Univer Id"></td>
				<td><input type="text" name="ProfID" value=""
					placeholder="Profesor Id"></td>
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

			cursModel.setNumeCurs(numeCurs);
			cursModel.setuId(univerID);
			cursModel.setpId(profID);
			gs.create(cursModel);
		}
	%>
	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Click
		here: Curs</a>
	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>