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
<title>Student</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<!-- Script pentru Update -->
	<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editStudent.jsp?id='+id;
    f.submit();
}
</script>

	<script>
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteStudent.jsp?id='+id;
    f.submit();
}
</script>

	<%
		//response.sendRedirect("error.jsp?msg="+ e.message());

		int pageNr = 1;
		int pageSize = 2;
		try {
			if (request.getParameter("pageNr") != null) {
				pageNr = Integer.parseInt(request.getParameter("pageNr"));
			}
		} catch (Exception e) {
			pageNr = 1;
		}
		GenericDAO<Student> genDao = new StudentDAO();
		List<Student> studList;
		studList = genDao.retrieve(pageNr, pageSize);
	%>
	<br />
	<br />
	<br />
	<br />
	<form method="post" name="form">
		<table id="data">
			<caption>Student</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nume</th>
					<th>Prenume</th>
					<th>Grupa</th>
					<th>Email</th>
					<th>Telefon</th>
					<th>Edit</th>
					<th>Delete</th>
					<th align="center">Insert</th>
				</tr>
			</thead>
			<%
				int countID = 0;
				int studListSize = 0;
				studListSize = genDao.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < studList.size()); i++) {
			%>
			<tr>
				<td><%=studList.get(i).getSId()%></td>
				<td><%=studList.get(i).getNume()%></td>
				<td><%=studList.get(i).getPrenume()%></td>
				<td><%=studList.get(i).getGrupa()%></td>
				<td><%=studList.get(i).getEmail()%></td>
				<td><%=studList.get(i).getTelFix()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=studList.get(i).getSId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=studList.get(i).getSId()%>);"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td align="right" colspan="8">
					<%
						out.print("<td rowspan = \""
								+ studList.size()
								+ "\"><a href=\""
								+ request.getContextPath()
								+ "/Student/insertStudentForm.jsp\"><input type=\"button\" name=\"insert\"");
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
				int pageFor = (int) Math.ceil((double) studListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i == pageNr) {
						out.println("<td><b><a href=\"" + request.getContextPath()
								+ "/Student/StudentJSP.jsp?pageNr=" + i + "\">" + i
								+ "</a></b></td>");
					} else {
						out.println("<td><a href=\"" + request.getContextPath()
								+ "/Student/StudentJSP.jsp?pageNr=" + i + "\">" + i
								+ "</a></td>");
					}

				}
			%>
		</tr>
	</table>
	<br />

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>