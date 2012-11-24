<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO"%>
<%@ page import="md.victordov.lab.dao.GenericDAO"%>
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
		GenericDAO<Profesor> genDao = new ProfesorDAO();
		Profesor prof = new Profesor();
		String idProfesorString = request.getParameter("id");
		Integer idProfesor = Integer.parseInt(idProfesorString);
		genDao.delete(idProfesor);
	%>
	<p>Profesor record was deleted</p>

	Click here to return:
	<a href="<%=request.getContextPath()%>/Profesor/ProfesorJSP.jsp"><strong>Profesor</strong>
	</a>