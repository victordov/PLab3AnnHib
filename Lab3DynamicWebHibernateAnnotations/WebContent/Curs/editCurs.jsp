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
<%
	/**
	 *@author Victor Dovgaliuc
	 *Curs Edit page. Handles the post request in case the id is received through a different way thant post method the request will be ignorred.
	 */
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Curs Edit</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())
				&& (request.getParameter("id") != null)) {
	%>
	<div id="wrapper">
		<form method="post" action="editCurs.jsp">
			<%
				GenericService<CursModel, Curs> gs = new CursService();
					CursModel cursModel = new CursModel();
					Integer idC = 0;
					try {
						idC = Integer.parseInt(request.getParameter("id"));
					} catch (NumberFormatException e) {
					}

					cursModel = gs.retrieve(idC);
			%>
			<br /> <br />
			<table>
				<caption>Curs Edit</caption>
				<thead>
					<tr>
						<th>Nume Curs</th>
						<th>Universiate Id</th>
						<th>Profesor Id</th>
					</tr>
				</thead>
				<tr>
					<td><input type="text" name="Nume"
						value="<%=cursModel.getNumeCurs()%>"></td>
					<td><input type="text" name="UniverID"
						value="<%=cursModel.getuId()%>"></td>
					<td><input type="text" name="ProfID"
						value="<%=cursModel.getpId()%>"></td>
					<td><input type="hidden" name="id" value="<%=idC%>"></td>
				</tr>
				<tr>
					<td><input type="submit" name="Submit" value="Update"
						style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- Edit form function -->
	<%
		/*
			 *Logic statement for inserting the data into the database
			 */

			if ("POST".equalsIgnoreCase(request.getMethod())
					&& (request.getParameter("id") != null)
					&& (request.getParameter("Nume") != null)
					&& (request.getParameter("UniverID") != null)
					&& (request.getParameter("ProfID") != null)) {
				String idCursString = request.getParameter("id");
				Integer idCurs = Integer.parseInt(idCursString);

				String numeCurs = request.getParameter("Nume");
				Integer univerID = Integer.parseInt(request
						.getParameter("UniverID"));
				Integer profID = Integer.parseInt(request
						.getParameter("ProfID"));

				Universitate universitate = new Universitate();
				universitate.setUId(univerID);

				Profesor profesor = new Profesor();
				profesor.setPId(profID);

				cursModel.setcId(idCurs);
				cursModel.setNumeCurs(numeCurs);
				cursModel.setuId(univerID);
				cursModel.setpId(profID);
				gs.update(cursModel);
			}
		}
	%>
	<a href="<%=request.getContextPath()%>/Curs/CursJSP.jsp">Click
		here: Curs</a>
	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>