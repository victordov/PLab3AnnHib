<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.StudCursService"%>
<%@ page import="md.victordov.lab.view.model.StudCursModel"%>
<%@ page import="md.victordov.lab.vo.StudCurs"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="md.victordov.lab.vo.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>

<%
	/**
	 *@author Victor Dovgaliuc
	 *Delete StudCurs (Student <--> Curs) from database  
	 */
%>

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
		GenericService<StudCursModel, StudCurs> genService = new StudCursService();
		String idStudCursString = request.getParameter("id");
		Integer idStudCurs = Integer.parseInt(idStudCursString);
		genService.delete(idStudCurs);
	%>
	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp">Click
		here: <strong>StudCurs Curs</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>