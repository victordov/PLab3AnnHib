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
<title>Profesor Delete</title>
</head>
<body>

	<%
		GenericDAO<Student> genDao = new StudentDAO();

		Student stud = new Student();
		String idStudentString = request.getParameter("id");
		Integer idStudent = Integer.parseInt(idStudentString);
		genDao.delete(idStudent);
	%>

	<a href="<%=request.getContextPath()%>/Student/StudentJSP.jsp">Apasa
		aici: <strong>Student</strong>
	</a>


	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>