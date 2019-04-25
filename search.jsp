<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<title>search</title>
<link rel="stylesheet" href="css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Terminal+Dosis' rel='stylesheet' type='text/css'>
<!-- The below script Makes IE understand the new html5 tags are there and applies our CSS to it -->
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/central_db"
     user="root"  password=""/>
</head>
<body>
    <ul id="items">
        <c:set var="q" scope="session" value='<%= request.getParameter("q")%>'/>
        <c:if test="${q}">
        <c:set var="q" value='<%= request.getParameter("q")%>'/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM music WHERE name= ?
            <sql:param value="${q}" />
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
        <li>
            <a href="main.jsp?id=${row.id}"><img src="images/${row.pic_location}" alt="${row.name}"/></a>
            <a href="play.jsp?id=${row.id}" class="title">${row.name}</a>
            <strong>&yen;${row.artist}</strong>
        </li>
        </c:forEach>
        </c:if>
    </ul>
</body>
</html>
