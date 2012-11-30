<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.UniversitateService"%>
<%@ page import="md.victordov.lab.view.model.UniversitateModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<!-- Page that will delete the object of class Univesitate, through the Post Method id is sent and verified if not null.
If id is sent through the browser bar or directly a black page will be displayed and void action is taken-->
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>University delete</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("idUniversitate") != null)) {
			GenericService<UniversitateModel, Universitate> genService = new UniversitateService();
			String idUniverString = request.getParameter("idUniversitate");
			Integer idUniversitate = Integer.parseInt(idUniverString);
			genService.delete(idUniversitate);
		}
	%>
	Click here:
	<a href="<%=request.getContextPath()%>/Universitate/UnivJSP.jsp"> <strong>Universitate</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>