<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="md.victordov.lab.services.GenericService"%>
<%@ page import="md.victordov.lab.services.CursService"%>
<%@ page import="md.victordov.lab.view.model.CursModel"%>
<%@ page import="md.victordov.lab.vo.Curs"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		GenericService<CursModel, Curs> gs = new CursService();
		List<CursModel> cml = gs.retrieve(0,10);
		out.println("<table>");
		out.println("<th><tr><td>Curs Id</td><td>Denumire Curs</td><td>Univ Id</td>"
				+ "<td>Denumire Univer</td><td>Prof Id</td><td>Prof Nume</td></tr></th>");
		for (CursModel cm : cml) {
			out.println("<tr>");
			out.println("<td>" + cm.getcId() + "</td>");
			out.println("<td>" + cm.getNumeCurs() + "</td>");
			out.println("<td>" + cm.getuId() + "</td>");
			out.println("<td>" + cm.getUniverNume() + "</td>");
			out.println("<td>" + cm.getpId() + "</td>");
			out.println("<td>" + cm.getProfesorNume() + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("New statement<br />");
		out.println(gs.retrieve(2).getuId());
	%>
</body>
</html>