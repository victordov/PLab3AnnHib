<%@page import="md.victordov.lab.common.exception.MyDaoException"%>
<%@page import="md.victordov.lab.common.exception.ErrorList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.dao.CursDAO"%>
<%@ page import="md.victordov.lab.vo.Universitate"%>
<%@ page import="md.victordov.lab.vo.Profesor"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<%@ page import="md.victordov.lab.common.exception.MyDaoException"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.CursService"%>
<%@ page import="md.victordov.lab.view.model.CursModel"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Curs</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>

	<!-- Script pentru Update -->
	<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editCurs.jsp?id='+id;
    f.submit();
}
</script>

	<script>
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteCurs.jsp?id='+id;
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
		GenericService<CursModel, Curs> gs = new CursService();
		List<CursModel> cml = gs.retrieve(2, 3);

		List<CursModel> cursModelList = null;
		cursModelList = gs.retrieve(pageNr, pageSize);
	%>
	<br />
	<br />
	<br />
	<form method="post" name="form">
		<table id="data">
			<caption>Curs</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nume Curs</th>
					<th>Universitate Id</th>
					<th>Profesor Id</th>
					<th>Edit</th>
					<th>Delete</th>
					<th>Insert</th>
				</tr>
			</thead>
			<%
				int cursModelListSize = 0;
				cursModelListSize = gs.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < cursModelList.size()); i++) {
			%>
			<tr>
				<td><%=cursModelList.get(i).getcId()%></td>
				<td><%=cursModelList.get(i).getNumeCurs()%></td>
				<td><%=cursModelList.get(i).getuId()%></td>
				<td><%=cursModelList.get(i).getpId()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=cursModelList.get(i).getcId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=cursModelList.get(i).getcId()%>);"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td align="right" colspan="<%=cursModelList.size()%>">
					<%
						out.print("<td colspan = \""
								+ 7
								+ "\" align=\"right\"><a href=\"insertCursForm.jsp\"><input type=\"button\" name=\"insert\"");
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
				int pageFor = (int) Math.ceil((double) cursModelListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i == pageNr) {
						out.println("<td id=\"pageCss\"><b><a href=\""
								+ request.getContextPath()
								+ "/Curs/CursJSP.jsp?pageNr=" + i + "\">" + i
								+ "</a></b></td>");
					} else {
						out.println("<td id=\"pageCss\"><a href=\""
								+ request.getContextPath()
								+ "/Curs/CursJSP.jsp?pageNr=" + i + "\">" + i
								+ "</a></td>");
					}
				}
			%>
		</tr>
	</table>
	<br />

	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>