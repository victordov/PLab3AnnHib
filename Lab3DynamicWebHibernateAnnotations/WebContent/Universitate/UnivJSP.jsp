<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.UnivDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="md.victordov.lab.vo.StudCurs"%>
<%@ page import="md.victordov.lab.vo.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>University</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<!-- Script to write the id of the class Universitate to the get method-->
	<script>
function editRecord(idUniversitate){
    var f=document.form;
    f.method="post";
    f.action='editUniv.jsp?idUniversitate='+idUniversitate;
    f.submit();
}
</script>

	<!-- Script which deletes the record if such exists. Sends the id of the object Universitate that needs to be deleted through the get method -->
	<script>
function deleteRecord(idUniversitate){
    var f=document.form;
    f.method="post";
    f.action='deleteUniv.jsp?idUniversitate='+idUniversitate;
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
		GenericDAO<Universitate> genDao = new UnivDAO();
		List<Universitate> univList;
		univList = genDao.retrieve(pageNr, pageSize);
	%>
	<br />
	<br />
	<!-- Main form which handles the displays all the data from database using tables -->
	<form method="post" name="form">
		<table id="data">
			<caption>Universitate</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Denumire</th>
					<th>Adresa</th>
					<th>Telefon</th>
					<th>Edit</th>
					<th>Delete</th>
					<th>Insert</th>
				</tr>
			</thead>
			<%
				int univListSize = 0;
				univListSize = genDao.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < univList.size()); i++) {
			%>
			<tr>
				<td><%=univList.get(i).getUId()%></td>
				<td><%=univList.get(i).getNumeUniver()%></td>
				<td><%=univList.get(i).getAdresa()%></td>
				<td><%=univList.get(i).getTelefon()%></td>

				<!-- Edit button, information is sent to edit page with aid of javaScript and method get -->
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=univList.get(i).getUId()%>);"></td>

				<!-- Edit button, information is sent to delete page with aid of javaScript and method get -->
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=univList.get(i).getUId()%>);"></td>
				<%
					/**
						 * Insert record logic
						 */
						if (i == 0) {
							out.print("<td colspan = \""
									+ univList.size()
									+ "\"><a href=\"insertUnivForm.jsp\"><input type=\"button\" name=\"insert\"");
							out.print(" value=\"Insert\" style=\"background-color:blue;font-weight:bold;color:white;\" ></a></td>");
						}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</form>
	<br />
	<!-- Pagination logic. Will start the page at number 1 and will count the display pages by
	dividing total number of records to the number of records required to display on the page  -->
	<table>
		<tr>
			<%
				int pageFor = (int) Math.ceil((double) univListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i == pageNr) {
						out.println("<td id=\"pageCss\"><b><a href=\""
								+ request.getContextPath()
								+ "/Universitate/UnivJSP.jsp?pageNr=" + i + "\">"
								+ i + "</a></b></td>");
					} else {
						out.println("<td id=\"pageCss\"><a href=\""
								+ request.getContextPath()
								+ "/Universitate/UnivJSP.jsp?pageNr=" + i + "\">"
								+ i + "</a></td>");
					}

				}
			%>
		</tr>
	</table>
	<br />
	<%@ include file="/footerJSP.jsp"%>