<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.StudCursDAO"%>
<%@ page import="md.victordov.lab.vo.StudCurs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="md.victordov.lab.dao.*"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>StudCurs</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<%
		GenericDAO<StudCurs> genDao = new StudCursDAO();

		StudCurs studCursObject = new StudCurs();
		String idStudCursString = request.getParameter("id");
		Integer idStudCurs = Integer.parseInt(idStudCursString);
		genDao.delete(idStudCurs);
	%>

	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp">Apasa
		aici: <strong>StudCurs Curs</strong>
	</a>


	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>