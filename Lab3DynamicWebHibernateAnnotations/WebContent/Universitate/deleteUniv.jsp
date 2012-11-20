<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.UnivDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Home Page</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<%
		GenericDAO<Universitate> genDao = new UnivDAO();
		Universitate univ = new Universitate();
		String idUniverString = request.getParameter("idUniversitate");
		Integer idUniversitate = Integer.parseInt(idUniverString);
		genDao.delete(idUniversitate);
	%>
	<a href="<%=request.getContextPath()%>/Universitate/UnivJSP.jsp">Apasaaici:
		<strong>Universitate</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>