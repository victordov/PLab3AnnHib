<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.ProfesorDAO"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="md.victordov.lab.vo.StudCurs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Profesor</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<!-- Script pentru Update -->
	<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editProfesor.jsp?id='+id;
    f.submit();
}
</script>

	<script>
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteProfesor.jsp?id='+id;
    f.submit();
}
</script>

	<%
		int pageNr = 1;
		int pageSize = 2;
		try {
			if (request.getParameter("pageNr") != null) {
				pageNr = Integer.parseInt(request.getParameter("pageNr"));
			}
		} catch (Exception e) {
			pageNr = 1;
		}
		GenericDAO<Profesor> genDao = new ProfesorDAO();
		List<Profesor> profList;
		profList = genDao.retrieve(pageNr, pageSize);
	%>
	<br />
	<br />
	<form method="post" name="form">
		<table id="data">
			<caption>Profesor</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nume</th>
					<th>Prenume</th>
					<th>Adresa</th>
					<th>Edit</th>
					<th>Delete</th>
					<th>Insert</th>
				</tr>
			</thead>
			<%
				int profListSize = 0;
				profListSize = genDao.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < profList.size()); i++) {
			%>
			<tr>
				<td><%=profList.get(i).getPId()%></td>
				<td><%=profList.get(i).getNume()%></td>
				<td><%=profList.get(i).getPrenume()%></td>
				<td><%=profList.get(i).getAdresa()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=profList.get(i).getPId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=profList.get(i).getPId()%>);"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td align="right" colspan="6">
					<%
						out.print("<td rowspan = \""
								+ profList.size()
								+ "\"><a href=\"insertProfesorForm.jsp\"><input type=\"button\" name=\"insert\"");
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
				int pageFor = (int) Math.ceil((double) profListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i == pageNr) {
						out.println("<td id=\"pageCss\"><b><a href=\"" + request.getContextPath()
								+ "/Profesor/ProfesorJSP.jsp?pageNr=" + i + "\">"
								+ i + "</a></b></td>");
					} else {
						out.println("<td id=\"pageCss\"><a href=\"" + request.getContextPath()
								+ "/Profesor/ProfesorJSP.jsp?pageNr=" + i + "\">"
								+ i + "</a></td>");
					}

				}
			%>
		</tr>
	</table>
	<br />

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>