<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.StudentDAO"%>
<%@ page import="md.victordov.lab.vo.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Student Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<form method="post"
		action="<%=request.getContextPath()%>/Student/insertStudentForm.jsp">
		<%
			GenericDAO<Student> genDao = new StudentDAO();

			Student stud = new Student();
			List<Student> arrayStud;
			arrayStud = genDao.retrieve();
		%>
		<table>
			<caption>Student Insert</caption>
			<tr>
				<th>ID</th>
				<th>Nume</th>
				<th>Prenume</th>
				<th>Grupa</th>
				<th>Email</th>
				<th>Telefon</th>
			</tr>
			<tr>
				<td><input type="text" name="id"
					value="<%=genDao.retrieve().size() + 1%>"></td>
				<td><input type="text" placeholder="Nume" name="Nume" value=""></td>
				<td><input type="text" placeholder="Prenume" name="Prenume"
					value=""></td>
				<td><input type="text" placeholder="Grupa" name="Grupa"
					value=""></td>
				<td><input type="text" placeholder="Email" name="Email"
					value=""></td>
				<td><input type="text" placeholder="Telefon" name="Telefon"
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
				&& (request.getParameter("Nume") != "")
				&& (request.getParameter("Prenume") != null)
				&& (request.getParameter("Grupa") != null)
				&& (request.getParameter("Email") != null)
				&& (request.getParameter("Telefon") != null)) {

			String idStudentString = request.getParameter("id");
			Integer idStudent = Integer.parseInt(idStudentString);
			String numeStudent = request.getParameter("Nume");
			String prenumeStudent = request.getParameter("Prenume");
			String grupaStudent = request.getParameter("Grupa");
			String emailStudent = request.getParameter("Email");
			String telefonStudent = request.getParameter("Telefon");

			stud.setSId(idStudent);
			stud.setNume(numeStudent);
			stud.setPrenume(prenumeStudent);
			stud.setGrupa(grupaStudent);
			stud.setEmail(emailStudent);
			stud.setTelFix(telefonStudent);
			genDao.create(stud);

		}
	%>
	<a href="<%=request.getContextPath()%>/Student/StudentJSP.jsp">Apasa
		aici: <strong>Student</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>