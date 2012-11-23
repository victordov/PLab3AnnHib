<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.StudentDAO"%>
<%@ page import="md.victordov.lab.vo.StudCurs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>StudCurs Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />
	<form method="post"
		action="<%=request.getContextPath()%>/StudCurs/insertStudCursForm.jsp">
		<%
			GenericDAO<StudCurs> genDao = new StudCursDAO();

			StudCurs studCursObject = new StudCurs();
			List<StudCurs> listStudCurs;
			listStudCurs = genDao.retrieve();
		%>
		<table>
			<caption>StudCurs Insert</caption>
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
			Integer cursID = Integer.parseInt(cursIdString);

			Student student = new Student();
			student.setSId(studentID);

			Curs curs = new Curs();
			curs.setCId(cursID);

			studCursObject.setStudent(student);
			studCursObject.setCurs(curs);
			genDao.create(studCursObject);
		}
	%>
	Click here:
	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp"><strong>Student
			Curs</strong> </a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>