<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.UnivDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Universitate</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<!-- Script pentru redirectionarea spre pagina de editare-->
	<script>
function editRecord(idUniversitate){
    var f=document.form;
    f.method="post";
    f.action='editUniv.jsp?idUniversitate='+idUniversitate;
    f.submit();
}
</script>

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
	<br />
	<br />
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
				int countID = 0;
				for (int i = 0; (i < pageSize) && (i < univList.size()); i++) {
			%>
			<tr>
				<td><%=univList.get(i).getUId()%></td>
				<td><%=univList.get(i).getNumeUniver()%></td>
				<td><%=univList.get(i).getAdresa()%></td>
				<td><%=univList.get(i).getTelefon()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=univList.get(i).getUId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=univList.get(i).getUId()%>);"></td>
				<%
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
	<table>
		<tr>
			<%
				int pageFor = (int) Math.ceil((double) univListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i == pageNr) {
						out.println("<td><b><a href=\"" + request.getContextPath()
								+ "/Universitate/UnivJSP.jsp?pageNr=" + i + "\">"
								+ i + "</a></b></td>");
					} else {
						out.println("<td><a href=\"" + request.getContextPath()
								+ "/Universitate/UnivJSP.jsp?pageNr=" + i + "\">"
								+ i + "</a></td>");
					}

				}
			%>
		</tr>
	</table>
	<br />


	<%@ include file="/footerJSP.jsp"%>