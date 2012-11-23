<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.StudentDAO"%>
<%@ page import="md.victordov.lab.vo.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="md.victordov.lab.dao.*"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Student Edit</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<!-- In case that the page is accessed directly from browser bar -->
	<!-- it will display a blank line-->
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("id") != null)) {
	%>


	<form method="post" action="editStudent.jsp">
		<%
			GenericDAO<Student> genDao = new StudentDAO();
				Student stud = new Student();
				String id = request.getParameter("id");
				Integer no = Integer.parseInt(id);
				stud = genDao.retrieve(no);
		%>
		<br /> <br />
		<table>
			<caption>Student Edit</caption>
			<tr>
				<th>Nume</th>
				<th>Prenume</th>
				<th>Grupa</th>
				<th>Email</th>
				<th>Telefon</th>
			</tr>
			<tr>
				<td><input type="text" name="Nume" value="<%=stud.getNume()%>"></td>
				<td><input type="text" name="Prenume"
					value="<%=stud.getPrenume()%>"></td>
				<td><input type="text" name="Grupa"
					value="<%=stud.getGrupa()%>"></td>
				<td><input type="text" name="Email"
					value="<%=stud.getEmail()%>"></td>
				<td><input type="text" name="Telefon"
					value="<%=stud.getTelFix()%>"></td>
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
					&& (request.getParameter("Nume") != null)
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
				genDao.update(stud);

			}
	%>
	<%
		}
	%>
	Click here:
	<a href="<%=request.getContextPath()%>/Student/StudentJSP.jsp"><strong>Student</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>