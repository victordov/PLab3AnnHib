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
<title>StudCurs Curs Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
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
				<th>ID</th>
				<th>Student ID</th>
				<th>Curs ID</th>
			</tr>
			<tr>
				<td><input type="text" name="id"
					value="<%=genDao.retrieve().size() + 1L%>"></td>
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
				&& (request.getParameter("id") != null)
				&& (request.getParameter("StudID") != "")
				&& (request.getParameter("CursID") != null)) {

			String idStudCursString = request.getParameter("id");
			Integer idStudCurs = Integer.parseInt(idStudCursString);
			String studentIdString = request.getParameter("StudID");
			Integer studentID = Integer.parseInt(studentIdString);
			String cursIdString = request.getParameter("CursID");
			Integer cursID = Integer.parseInt(cursIdString);

			Student tempStud = new Student();
			tempStud.setSId(studentID);

			Curs tempCurs = new Curs();
			tempCurs.setCId(cursID);

			studCursObject.setScId(idStudCurs);
			studCursObject.setStudent(tempStud);
			studCursObject.setCurs(tempCurs);
			genDao.create(studCursObject);
		}
	%>
	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp">Apasa
		aici: <strong>Student Curs</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>