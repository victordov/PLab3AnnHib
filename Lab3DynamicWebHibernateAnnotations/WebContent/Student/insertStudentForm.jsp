<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.StudentService"%>
<%@ page import="md.victordov.lab.view.model.StudentModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
<%
	/**
	 *Inser student page will insert new record in the database. In case the user submits a request with blank field(s) a void action will be taken. 
	 */
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Student Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />
	<form method="post"
		action="<%=request.getContextPath()%>/Student/insertStudentForm.jsp">
		<%
			GenericService<StudentModel, Student> genService = new StudentService();
			StudentModel stud = new StudentModel();
			List<StudentModel> studModelList;
			studModelList = genService.retrieve();
		%>
		<table>
			<caption>Student Insert</caption>
			<tr>
				<th>Nume</th>
				<th>Prenume</th>
				<th>Grupa</th>
				<th>Email</th>
				<th>Telefon</th>
			</tr>
			<tr>
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
				&& (request.getParameter("Nume") != "")
				&& (request.getParameter("Prenume") != null)
				&& (request.getParameter("Grupa") != null)
				&& (request.getParameter("Email") != null)
				&& (request.getParameter("Telefon") != null)) {

			String numeStudent = request.getParameter("Nume");
			String prenumeStudent = request.getParameter("Prenume");
			String grupaStudent = request.getParameter("Grupa");
			String emailStudent = request.getParameter("Email");
			String telefonStudent = request.getParameter("Telefon");

			stud.setNume(numeStudent);
			stud.setPrenume(prenumeStudent);
			stud.setGrupa(grupaStudent);
			stud.setEmail(emailStudent);
			stud.setTelFix(telefonStudent);
			genService.create(stud);

		}
	%>
	Click here:
	<a href="<%=request.getContextPath()%>/Student/StudentJSP.jsp"> <strong>Student</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>