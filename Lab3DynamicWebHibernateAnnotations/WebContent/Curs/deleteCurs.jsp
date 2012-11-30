<%@page import="md.victordov.lab.common.exception.MyDaoException"%>
<%@page import="md.victordov.lab.common.exception.ErrorList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
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
<title>Curs Delete</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<%
		GenericService<CursModel, Curs> gs = new CursService();
		String idCursString = request.getParameter("id");
		gs.delete(Integer.parseInt(idCursString));
	%>
	<p>Curs was deleted</p>


	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Click
		here: Curs</a>
	<br />

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>