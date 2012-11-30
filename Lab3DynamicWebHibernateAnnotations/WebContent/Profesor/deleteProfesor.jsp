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
<title>Profesor Delete</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<%
		GenericService<ProfesorModel, Profesor> genService = new ProfesorService();
		Profesor prof = new Profesor();
		String idProfesorString = request.getParameter("id");
		Integer idProfesor = Integer.parseInt(idProfesorString);
		genService.delete(idProfesor);
	%>
	<p>Profesor record was deleted</p>

	Click here to return:
	<a href="<%=request.getContextPath()%>/Profesor/ProfesorJSP.jsp"><strong>Profesor</strong>
	</a>