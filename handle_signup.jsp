<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Transition</title>
</head>
<body>

 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/central_db"
     user="root"  password=""/>

<h1>Successfully logged in</h1>

<c:set var="email" value='<%= request.getParameter("email")%>'/>
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO "account" ("email", "password") VALUES ('<%= request.getParameter("email")%>', '<%= request.getParameter("password")%>')
</sql:update>

<p><b>Welcome User:</b>
   <%= request.getParameter("email")%>
</p>
<c:forEach var="row" items="${result.rows}">
   <p>Continue Logged In as <a href="index.jsp?user=${row.id}">${row.email}</a></p>
</c:forEach>


</body>
</html>