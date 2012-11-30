<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.ProfesorService"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="md.victordov.lab.view.model.ProfesorModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
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
		GenericService<ProfesorModel, Profesor> genService = new ProfesorService();
		List<ProfesorModel> profModelList;
		profModelList = genService.retrieve(pageNr, pageSize);
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
				profListSize = genService.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < profModelList.size()); i++) {
			%>
			<tr>
				<td><%=profModelList.get(i).getPId()%></td>
				<td><%=profModelList.get(i).getNume()%></td>
				<td><%=profModelList.get(i).getPrenume()%></td>
				<td><%=profModelList.get(i).getAdresa()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=profModelList.get(i).getPId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=profModelList.get(i).getPId()%>);"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td align="right" colspan="6">
					<%
						out.print("<td rowspan = \""
								+ profModelList.size()
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