<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.*"%>
<%@ page import="md.victordov.lab.vo.*"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.StudentService"%>
<%@ page import="md.victordov.lab.view.model.StudentModel"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="md.victordov.lab.dao.*"%>
<!DOCTYPE html>
<%
	/**
	 *@author Victor Dovgaliuc
	 *Main Student page. Displays the Student data in rows defined implicit in the jsp file. Variable which handles number of records is  pageSize.
	 *Deleting, inserting and editing the Student data is made with the aid the of the scripts (javaScript)
	 */
%>
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
		int pageNr = 1;
		int pageSize = 2;
		try {
			if (request.getParameter("pageNr") != null) {
				pageNr = Integer.parseInt(request.getParameter("pageNr"));
			}
		} catch (Exception e) {
			pageNr = 1;
		}
		GenericService<StudentModel, Student> genService = new StudentService();
		List<StudentModel> studModelList;
		studModelList = genService.retrieve(pageNr, pageSize);
	%>
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
				int studListSize = 0;
				studListSize = genService.countSize().intValue();
				int ox = (pageNr * pageSize) - pageSize;
				for (int i = 0; (i < pageSize) && (i < studModelList.size()); i++) {
			%>
			<tr>
				<td><%=studModelList.get(i).getSId()%></td>
				<td><%=studModelList.get(i).getNume()%></td>
				<td><%=studModelList.get(i).getPrenume()%></td>
				<td><%=studModelList.get(i).getGrupa()%></td>
				<td><%=studModelList.get(i).getEmail()%></td>
				<td><%=studModelList.get(i).getTelFix()%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: green; font-weight: bold; color: white;"
					onclick="editRecord(<%=studModelList.get(i).getSId()%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: red; font-weight: bold; color: white;"
					onclick="deleteRecord(<%=studModelList.get(i).getSId()%>);"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td align="right" colspan="8">
					<%
						out.print("<td rowspan = \"2"
								+ studModelList.size()
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
				/**
				 *Pagination logic ( All pages divided page the pageSize will give the number of pages that should be displayed)
				 */
				int pageFor = (int) Math.ceil((double) studListSize
						/ (double) pageSize);
				for (int i = 1; i <= pageFor; i++) {
					if (i == pageNr) {
						out.println("<td id=\"pageCss\"><b><a href=\""
								+ request.getContextPath()
								+ "/Student/StudentJSP.jsp?pageNr=" + i + "\">" + i
								+ "</a></b></td>");
					} else {
						out.println("<td id=\"pageCss\"><a href=\""
								+ request.getContextPath()
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