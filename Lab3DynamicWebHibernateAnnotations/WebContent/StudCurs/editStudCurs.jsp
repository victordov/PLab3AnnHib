<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.StudCursDAO"%>
<%@ page import="md.victordov.lab.vo.StudCurs"%>
<%@ page import="md.victordov.lab.vo.Student"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
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
			Integer studId = Integer.parseInt(studIdString);

			String cursIdString = request.getParameter("CursID");
			Integer cursId = Integer.parseInt(cursIdString);

			Student student = new Student();
			student.setSId(studId);

			Curs curs = new Curs();
			curs.setCId(cursId);

			studCursObject.setScId(idStudCurs);
			studCursObject.setStudent(student);
			studCursObject.setCurs(curs);
			genDao.update(studCursObject);
		}
	%>Click here:
	<a href="<%=request.getContextPath()%>/StudCurs/StudCurs.jsp"><strong>StudentCurs</strong>
	</a>

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>