<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*" %>
<html>

<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Curs Delete</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<%
		GenericDAO<Curs> genDao = new CursDAO();
		Curs curs = new Curs();
		String idCursString = request.getParameter("id");
		Integer idCurs = Integer.parseInt(idCursString);
		genDao.delete(idCurs);

	%>
	<p>Curs fost sters</p>

	
	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Apasa
		aici: Curs</a>
	<br />

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>