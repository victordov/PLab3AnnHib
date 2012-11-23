<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Home Page</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="/headerJSP.jsp"%>
	<div id="wrapper">
		<div id="centerBody">
			<h1>Hibernate with Annotations</h1>
			<h2>Short Description</h2>
			<p>Tomcat7 is running this project. Database is MySQL5, contains
				5 tables:</p>
			<ul>
				<li>Student</li>
				<li>Curs</li>
				<li>Student Curs</li>
				<li>Profesor</li>
				<li>Universitate</li>
			</ul>
			<p>All information is retrieved usingHibernate 4.1</p>
		</div>
		<br />
	</div>
	<!-- Footer -->
	<%@ include file="/footerJSP.jsp"%>