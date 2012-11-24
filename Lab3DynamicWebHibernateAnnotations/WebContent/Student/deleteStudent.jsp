<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.StudentDAO"%>
<%@ page import="md.victordov.lab.vo.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
<!-- Delete Student page receives id through POST METHOD and check if not null, in case a null id a blank page will be displayed -->
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Student Delete</title>
</head>
<body>
	<%@ include file="/headerJSP.jsp"%>
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("id") != null)) {
			GenericDAO<Student> genDao = new StudentDAO();
			Student stud = new Student();
			String idStudentString = request.getParameter("id");
			Integer idStudent = Integer.parseInt(idStudentString);
			genDao.delete(idStudent);
		}
	%>
	Click Here:
	<a href="<%=request.getContextPath()%>/Student/StudentJSP.jsp"><strong>Student
			Menu</strong> </a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>