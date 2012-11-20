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
<title>StudCurs Edit</title>
</head>
<body>

	<%@ include file="/headerJSP.jsp"%>
	<form method="post" action="editStudCurs.jsp">
		<%
			GenericDAO<StudCurs> genDao = new StudCursDAO();

			StudCurs studCursObject = new StudCurs();
			String id = request.getParameter("id");
			Integer no = Integer.parseInt(id);
			studCursObject = genDao.retrieve(no);
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
					value="<%=studCursObject.getStudent().getSId()%>"></td>
				<td><input type="text" name="CursID"
					value="<%=studCursObject.getCurs().getCId()%>"></td>
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
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("id") != null)
				&& (request.getParameter("StudID") != null)
				&& (request.getParameter("CursID") != null)) {

			String idStudCursString = request.getParameter("id");
			Integer idStudCurs = Integer.parseInt(idStudCursString);

			String studIdString = request.getParameter("StudID");
			Integer studId = Integer.parseInt(studIdString);

			String cursIdString = request.getParameter("CursID");
			Integer cursId = Integer.parseInt(cursIdString);

			Student tempStud = new Student();
			tempStud.setSId(studId);

			Curs tempCurs = new Curs();
			tempCurs.setCId(cursId);

			studCursObject.setScId(idStudCurs);
			studCursObject.setStudent(tempStud);
			studCursObject.setCurs(tempCurs);
			genDao.update(studCursObject);
		}
	%>


	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp">Apasa
		aici: <strong>Student Curs </strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>