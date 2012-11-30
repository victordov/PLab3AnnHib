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
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>StudCurs Edit</title>
</head>
<body>

	<%@ include file="/headerJSP.jsp"%>
	<form method="post" action="editStudCurs.jsp">
		<%
			GenericService<StudCursModel, StudCurs> genService = new StudCursService();
			StudCursModel studCursModel = new StudCursModel();
			String id = request.getParameter("id");
			Integer no = Integer.parseInt(id);
			studCursModel = genService.retrieve(no);
		%>
		<br /> <br />
		<table>
			<caption>StudCurs Edit</caption>
			<tr>
				<th>Student ID</th>
				<th>Curs ID</th>
			</tr>
			<tr>
				<td><input type="text" name="StudID"
					value="<%=studCursModel.getStudentId()%>"></td>
				<td><input type="text" name="CursID"
					value="<%=studCursModel.getCursId()%>"></td>
				<td><input type="hidden" name="id" value="<%=no%>"></td>
			</tr>
			<tr>
				<td><input type="submit" name="Submit" value="Update"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
			</tr>
		</table>
	</form>

	<!-- Update Function -->
	<%
		/*
		 *If statement will handle the request and will deny the inserting of the object into database if any filed will be received null
		 */
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("id") != null)
				&& (request.getParameter("StudID") != null)
				&& (request.getParameter("CursID") != null)) {

			String idStudCursString = request.getParameter("id");
			Integer idStudCurs = Integer.parseInt(idStudCursString);

			String studIdString = request.getParameter("StudID");
			Integer studentId = Integer.parseInt(studIdString);

			String cursIdString = request.getParameter("CursID");
			Integer cursId = Integer.parseInt(cursIdString);

			studCursModel.setScId(idStudCurs);
			studCursModel.setStudentId(studentId);
			studCursModel.setCursId(cursId);
			genService.update(studCursModel);
		}
	%>Click here:
	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp"><strong>StudentCurs</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>