<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.StudCursService"%>
<%@ page import="md.victordov.lab.view.model.StudCursModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>

<%
	/**
	 *@author Victor Dovgaliuc
	 *insert StudCursModel page will inser the StudCursModel record using anotation and take into consideration the relationship between tables
	 */
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>StudCursModel Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />
	<form method="post"
		action="<%=request.getContextPath()%>/StudCursModel/insertStudCursForm.jsp">
		<%
			GenericService<StudCursModel, StudCurs> genService = new StudCursService();

			StudCursModel studCursModel = new StudCursModel();
		%>
		<table>
			<caption>StudCursModel Insert</caption>
			<tr>
				<th>Student ID</th>
				<th>Curs ID</th>
			</tr>
			<tr>
				<td><input type="text" placeholder="StudID" name="StudID"
					value=""></td>
				<td><input type="text" placeholder="CursID" name="CursID"
					value=""></td>
			</tr>
			<tr>
				<td><input type="submit" name="Submit" value="Insert"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
			</tr>
		</table>
	</form>

	<!-- Insert Function -->
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("StudID") != "")
				&& (request.getParameter("CursID") != null)) {

			String studentIdString = request.getParameter("StudID");
			Integer studentID = Integer.parseInt(studentIdString);
			String cursIdString = request.getParameter("CursID");
			Integer cursId = Integer.parseInt(cursIdString);

			studCursModel.setStudentId(studentID);
			studCursModel.setCursId(cursId);
			genService.create(studCursModel);
		}
	%>
	Click here:
	<a href="<%=request.getContextPath()%>/StudCursModel/StudCursModel.jsp"><strong>Student
			Curs</strong> </a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>