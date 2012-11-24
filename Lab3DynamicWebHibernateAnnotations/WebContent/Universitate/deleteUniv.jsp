<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.UnivDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
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
			GenericDAO<Universitate> genDao = new UnivDAO();
			Universitate univ = new Universitate();
			String idUniverString = request.getParameter("idUniversitate");
			Integer idUniversitate = Integer.parseInt(idUniverString);
			genDao.delete(idUniversitate);
		}
	%>
	Click here:
	<a href="<%=request.getContextPath()%>/Universitate/UnivJSP.jsp"> <strong>Universitate</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>