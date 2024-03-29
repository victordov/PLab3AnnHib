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
<%
	/**
	 *@author Victor Dovgaliuc
	 *Stud Curs is the main page which will help you to insert, delete and edit the data of type StudCurs
	 */
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>StudCurs</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<!-- Script pentru Update -->
	<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editStudCurs.jsp?id='+id;
    f.submit();
}
</script>

	<script> 
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteStudCurs.jsp?id='+id;
    f.submit();
}
</script>

	<%
		int pageNr = 1;
		int pageSize = 2;

		if (request.getParameter("pageNr") != null) {
			try {
				pageNr = Integer.parseInt(request.getParameter("pageNr"));
			} catch (NumberFormatException e) {
				pageNr = 1;
			}
		}
		GenericService<StudCursModel, StudCurs> genService = new StudCursService();
		List<StudCursModel> studCursModelList;
		studCursModelList = genService.retrieve(pageNr, pageSize);
	%>
	<br />
	<br />
	<form method="post" name="form">
		<table id="data">
			<caption>StudCurs</caption>
			<thead>
				<tr>
					<th>Stud Curs ID</th>
					<th>Student Id</th>
					<th>Curs ID</th>
					<th>Edit</th>
					<th>Delete</th>
					<th align="center">Insert</th>
				</tr>
			</thead>
			<%
				int countID = 0;
				int studCursListSize = 0;
				studCursListSize = genService.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < studCursModelList.size()); i++) {
			%>
			<tr>
				<td><%=studCursModelList.get(i).getScId()%></td>
				<td><%=studCursModelList.get(i).getStudentId()%></td>
				<td><%=studCursModelList.get(i).getCursId()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=studCursModelList.get(i).getScId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=studCursModelList.get(i).getScId()%>);"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td align="right" colspan="5">
					<%
						out.print("<td rowspan = \""
								+ studCursModelList.size()
								+ "\"><a href=\""
								+ request.getContextPath()
								+ "/StudCurs/insertStudCursForm.jsp\"><input type=\"button\" name=\"insert\"");
						out.print(" value=\"Insert\" style=\"background-color:blue;font-weight:bold;color:white;\" ></a></td>");
					%>
				</td>
			</tr>
		</table>
	</form>
	<br />
	<table>
		<tr>
			<%
				/*
				 *Pagination Logic
				 */
				int pageFor = (int) Math.ceil((double) studCursListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i % 20 == 0) {
						out.println("<tr>");
					}
					if (i % 40 == 0) {
						out.println("</tr>");
					}
					if (i == pageNr) {
						out.println("<td id=\"pageCss\"><b><a href=\""
								+ request.getContextPath()
								+ "/StudCurs/StudCurs.jsp?pageNr=" + i + "\">" + i
								+ "</a></b></td>");
					} else {
						out.println("<td id=\"pageCss\"><a href=\""
								+ request.getContextPath()
								+ "/StudCurs/StudCurs.jsp?pageNr=" + i + "\">" + i
								+ "</a></td>");
					}

				}
			%>
		</tr>
	</table>
	<br />

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>