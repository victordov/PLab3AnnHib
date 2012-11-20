<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO" %>
<%@ page import="md.victordov.lab.dao.GenericDAO" %>

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
		GenericDAO<Profesor> genDao = new ProfesorDAO();
		Profesor prof = new Profesor();
		String idProfesorString = request.getParameter("id");
		Integer idProfesor = Integer.parseInt(idProfesorString);
		genDao.delete(idProfesor);
		
	%>
	<p>Profesorul fost sters</p>

	<a href="<%=request.getContextPath()%>/Profesor/ProfesorJSP.jsp">Apasa
		aici: <strong>Profesor</strong>
	</a>