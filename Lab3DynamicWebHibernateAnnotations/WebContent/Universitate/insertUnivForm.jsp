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
<title>University Insert</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<br />
	<br />
	<form method="post"
		action="<%=request.getContextPath()%>/Universitate/insertUnivForm.jsp">
		<%
			GenericDAO<Universitate> genDao = new UnivDAO();
			Universitate univ = new Universitate();
			List<Universitate> listUniv;
			listUniv = genDao.retrieve();
		%>
		<table>
			<caption>Insert Universitate</caption>
			<tr>
				<th>Denumire</th>
				<th>Adresa</th>
				<th>Telefon</th>
			</tr>
			<tr>
				<td><input type="text" placeholder="Denumire" name="Denumire"
					value=""></td>
				<td><input type="text" placeholder="Adresa" name="Adresa"
					value=""></td>
				<td><input type="text" placeholder="Telefon" name="Telefon"
					value=""></td>

			</tr>
			<tr>
				<td colspan="6"><input type="submit" name="Submit"
					value="Insert"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
			</tr>

		</table>
	</form>

	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("Denumire") != null)
				&& (request.getParameter("Adresa") != null)
				&& (request.getParameter("Telefon") != null)) {

			String denumUniver = request.getParameter("Denumire");
			String adresaUniver = request.getParameter("Adresa");
			String telefonUniver = request.getParameter("Telefon");

			univ.setNumeUniver(denumUniver);
			univ.setAdresa(adresaUniver);
			univ.setTelefon(telefonUniver);
			genDao.create(univ);
		}
	%>
	<a href="<%=request.getContextPath()%>/Universitate/UnivJSP.jsp">Apasa
		aici: <strong>Universitate</strong>
	</a>

	<%@ include file="/footerJSP.jsp"%>